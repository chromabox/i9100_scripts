@echo off
echo "SGS2 kernel write script."

if not exist zImage (
ECHO "zImage not found...exit"
pause
exit
)

echo "DONT POWER OFF WHILE REWRITING KERNEL !!!. "

pause

echo "write zImage......."

@echo on
adb push zImage /data/local/tmp
@echo off
if not %ERRORLEVEL% == 0 (
ECHO "ERROR: adb push ....exit."
pause
exit
)


@echo on
adb shell su -c "cat /data/local/tmp/zImage > /dev/block/mmcblk0p5"
@echo off

if not %ERRORLEVEL% == 0 (
ECHO "ERROR: adb shell copy zImage ....exit."
pause
exit
)

echo "done."
pause

echo "kernel write success. reboot SGS2.."
pause

@echo on
adb shell su -c "sync; reboot"
@echo off

echo "done."


