# Android-Tools

> Bootloader unlocking program for Xiaomi devices

---

## About

Android-Tools is a simple batch script that automates the process of unlocking the bootloader on Xiaomi/Redmi devices. No complex commands, no confusing menus — just select an option and go.

## Features

- **Auto Unlock** — full automatic process (ADB → Fastboot → Unlock → Reboot)
- **Device Check** — see connected devices and basic info
- **Bootloader Status** — check if your bootloader is locked or unlocked
- **Multiple Unlock Methods** — tries `oem unlock`, `flashing unlock`, `oem unlock-go`
- **Safe Reboot** — reboot to system, fastboot, or recovery

## Requirements

| Tool | Download |
|------|----------|
| ADB & Fastboot | [Google Platform Tools](https://developer.android.com/studio/releases/platform-tools) |
| USB Drivers | [Xiaomi USB Driver](https://developer.android.com/studio/run/win-usb) |
| Windows | 7/8/10/11 |

## Quick Start

1. **Enable Developer Options** on your phone:
   - Settings → About Phone → Tap "MIUI Version" 7 times

2. **Enable USB Debugging & OEM Unlock**:
   - Settings → Additional Settings → Developer Options
   - Turn on "USB Debugging"
   - Turn on "OEM Unlocking"

3. **Connect phone to PC via USB**

4. **Run the script**:
   ```batch
   android-tools.bat

5. Select option 1 (Auto Unlock) and follow the prompts

Menu Options
Option	Description
1	Auto Unlock — does everything automatically
2	Check Device — shows connected devices and info
3	Reboot to Fastboot — reboots phone into fastboot mode
4	Unlock Bootloader — sends unlock commands
5	Reboot Device — reboots phone normally
6	Check Status — shows bootloader lock status
7	Exit
Important Notes
ALL DATA WILL BE WIPED when unlocking the bootloader

Make sure your Mi Account is linked to the phone

First boot after unlock may take 5-10 minutes

Some Xiaomi devices require waiting 7 days after enabling OEM Unlock

Troubleshooting
Problem	Solution
adb not recognized	Install Platform Tools and add to PATH
Device not found	Check USB cable, enable USB Debugging, accept RSA prompt on phone
Unlock failed	Make sure OEM Unlocking is enabled in Developer Options
Waiting for device	Reconnect USB, try different cable/port
Credits
Created by: [Your Friend's Name]

Inspired by: YIAF — Yeah!! I'm A Free!!!!

Special thanks to: Xiaomi community

License
MIT — do whatever you want, just don't blame me if your phone explodes.
