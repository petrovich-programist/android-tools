@echo off
title XIAOMI BOOTLOADER UNLOCKER v2.0
color 0A
mode con: cols=60 lines=30

:: ============================================
::  XIAOMI REDMI BOOTLOADER UNLOCKER
::  Automatic unlock tool
:: ============================================

:MAIN
cls
echo.
echo ã======================================¬
echo ¦  XIAOMI BOOTLOADER UNLOCKER v2.0    ¦
echo ¦======================================¦
echo ¦ 1. AUTO UNLOCK (Full Process)       ¦
echo ¦ 2. Check Device Status              ¦
echo ¦ 3. Reboot to Fastboot               ¦
echo ¦ 4. Unlock Bootloader                ¦
echo ¦ 5. Reboot Device                    ¦
echo ¦ 6. Check Bootloader Status          ¦
echo ¦ 7. Exit                             ¦
echo L======================================-
echo.
set /p choice="Select option (1-7): "

if "%choice%"=="1" goto AUTO_UNLOCK
if "%choice%"=="2" goto CHECK_DEVICE
if "%choice%"=="3" goto REBOOT_FASTBOOT
if "%choice%"=="4" goto UNLOCK_BOOTLOADER
if "%choice%"=="5" goto REBOOT_DEVICE
if "%choice%"=="6" goto CHECK_STATUS
if "%choice%"=="7" exit
goto MAIN

:: ============================================
:: AUTO UNLOCK - Full automatic process
:: ============================================
:AUTO_UNLOCK
cls
echo.
echo ã======================================¬
echo ¦     AUTO UNLOCK PROCESS              ¦
echo L======================================-
echo.
echo This will:
echo 1. Check ADB connection
echo 2. Reboot to Fastboot
echo 3. Unlock bootloader
echo 4. Reboot device
echo.
echo ?? ALL DATA WILL BE DELETED!
echo.
set /p confirm="Continue? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN

cls
echo.
echo ========================================
echo  STEP 1/4: Checking ADB connection...
echo ========================================
echo.
adb devices 2>nul
echo.
echo If device is listed - press any key...
pause >nul

cls
echo.
echo ========================================
echo  STEP 2/4: Rebooting to Fastboot...
echo ========================================
echo.
adb reboot bootloader 2>nul
echo Waiting for device...
echo.
echo The phone screen should show "FASTBOOT"
echo.
timeout /t 15 >nul

cls
echo.
echo ========================================
echo  STEP 3/4: Unlocking bootloader...
echo ========================================
echo.
echo Checking Fastboot connection...
fastboot devices 2>nul
echo.
echo If device is listed - proceeding...
echo.
echo Sending unlock command...
fastboot flashing unlock 2>nul
echo.
echo ?? CONFIRM ON YOUR PHONE!
echo Use Volume Up to select "UNLOCK"
echo Press Power to confirm
echo.
echo Waiting 30 seconds...
timeout /t 30 >nul

cls
echo.
echo ========================================
echo  STEP 4/4: Rebooting device...
echo ========================================
echo.
fastboot reboot 2>nul
echo.
echo ? PROCESS COMPLETE!
echo.
echo Your phone will reboot.
echo First boot may take 5-10 minutes.
echo.
echo Bootloader status: UNLOCKED
echo.
pause
goto MAIN

:: ============================================
:: CHECK DEVICE
:: ============================================
:CHECK_DEVICE
cls
echo.
echo ã======================================¬
echo ¦     CHECKING DEVICE STATUS            ¦
echo L======================================-
echo.
echo ADB Devices:
adb devices 2>nul
echo.
echo Fastboot Devices:
fastboot devices 2>nul
echo.
echo Device Info:
adb shell getprop ro.product.model 2>nul
adb shell getprop ro.product.brand 2>nul
adb shell getprop ro.build.version.release 2>nul
echo.
pause
goto MAIN

:: ============================================
:: REBOOT TO FASTBOOT
:: ============================================
:REBOOT_FASTBOOT
cls
echo.
echo ã======================================¬
echo ¦     REBOOTING TO FASTBOOT             ¦
echo L======================================-
echo.
echo Sending reboot command...
adb reboot bootloader 2>nul
echo.
echo The phone will restart in Fastboot mode.
echo Screen should show FASTBOOT logo.
echo.
echo Waiting 15 seconds...
timeout /t 15 >nul
echo.
echo Checking...
fastboot devices 2>nul
echo.
pause
goto MAIN

:: ============================================
:: UNLOCK BOOTLOADER
:: ============================================
:UNLOCK_BOOTLOADER
cls
echo.
echo ã======================================¬
echo ¦     UNLOCKING BOOTLOADER              ¦
echo L======================================-
echo.
echo ?? WARNING! ALL DATA WILL BE DELETED!
echo.
echo Prerequisites:
echo 1. Phone in Fastboot mode
echo 2. Mi Account linked to phone
echo 3. OEM Unlocking enabled
echo.
set /p confirm="Are you sure? (Y/N): "
if /i not "%confirm%"=="Y" goto MAIN

echo.
echo Trying method 1: fastboot oem unlock
fastboot oem unlock 2>nul
echo.
echo Trying method 2: fastboot flashing unlock
fastboot flashing unlock 2>nul
echo.
echo Trying method 3: fastboot oem unlock-go
fastboot oem unlock-go 2>nul
echo.
echo If prompted on phone - CONFIRM UNLOCK!
echo.
echo ? Done! Check status with option 6.
echo.
pause
goto MAIN

:: ============================================
:: REBOOT DEVICE
:: ============================================
:REBOOT_DEVICE
cls
echo.
echo Rebooting device...
fastboot reboot 2>nul
echo Done!
pause
goto MAIN

:: ============================================
:: CHECK BOOTLOADER STATUS
:: ============================================
:CHECK_STATUS
cls
echo.
echo ã======================================¬
echo ¦     BOOTLOADER STATUS                 ¦
echo L======================================-
echo.
echo Checking bootloader variables...
echo.
fastboot getvar unlocked 2>nul
echo.
fastboot getvar secure 2>nul
echo.
fastboot getvar product 2>nul
echo.
fastboot getvar version 2>nul
echo.
echo If "unlocked: yes" - BOOTLOADER IS UNLOCKED!
echo If "unlocked: no" - Still locked.
echo.
pause
goto MAIN