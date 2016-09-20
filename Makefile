all: main

SYSROOT=$(NDK)/platforms/android-19/arch-arm
TOOLCHAIN=$(NDK)/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/
CROSS_COMPILE=$(TOOLCHAIN)arm-linux-androideabi-

main: main.c
	$(CROSS_COMPILE)gcc $< -o $@ --sysroot $(SYSROOT)
	adb push $@ /data/local/tmp/
	adb shell -c "/data/local/tmp/$@"
		
clean:
	rm -rf main
