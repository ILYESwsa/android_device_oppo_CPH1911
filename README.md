# TWRP Device Tree — OPPO F11 (CPH1911)

| Feature | Value |
|---------|-------|
| SoC | MediaTek Helio P70 (mt6771) |
| CPU | 4x Cortex-A73 @ 2.1GHz + 4x Cortex-A53 @ 2.0GHz |
| GPU | Mali-G72 MP3 @ 900MHz |
| RAM | 6GB |
| Display | 1080x2340, 480dpi |
| Panel | oppo18561_tianma_himax83112a_1080p |
| Storage | 128GB eMMC (non A/B) |
| Android | 11 (ColorOS) |
| Codename | CPH1911 |

## Partition Layout

| Partition | Block | Size |
|-----------|-------|------|
| recovery | mmcblk0p2 | 64MB |
| boot | mmcblk0p33 | 32MB |
| system | mmcblk0p40 | ~5.2GB |
| vendor | mmcblk0p39 | ~1GB |
| userdata | mmcblk0p42 | ~50GB |
| cache | mmcblk0p41 | 432MB |

## Build Status

Build via GitHub Actions — push to main triggers a build automatically.
Output artifact: `TWRP-CPH1911/recovery.img`

## Testing (Safe — no overwrite)

```bash
# Backup stock recovery first (in Termux)
su -c "dd if=/dev/block/mmcblk0p2 of=/sdcard/recovery_stock.img bs=4096"

# Flash TWRP to recovery partition
su -c "dd if=/sdcard/twrp_CPH1911.img of=/dev/block/mmcblk0p2 bs=4096"

# Reboot into recovery
su -c "reboot recovery"

# Restore stock if needed
su -c "dd if=/sdcard/recovery_stock.img of=/dev/block/mmcblk0p2 bs=4096"
```

## Flash via MTKClient (from PC)

```bash
# Backup
python mtk r recovery recovery_stock.img

# Flash TWRP
python mtk w recovery twrp_CPH1911.img

# Restore
python mtk w recovery recovery_stock.img
```

## Known First-Boot Issues

- Touch may not work → needs touch driver init in recovery ramdisk
- Decryption may fail → FBE Android 11 needs crypto libs
- These are normal iteration #1 issues

## Credits

Device tree generated from stock CPH1911 recovery.img
Kernel offsets extracted directly from bootimg header
fstab taken verbatim from stock ramdisk
