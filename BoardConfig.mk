DEVICE_PATH := device/oppo/CPH1911

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6771
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6771

# Kernel — offsets extracted directly from recovery_stock.img
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user androidboot.hardware=mt6771 firmware_class.path=/vendor/firmware loop.max_part=7 androidboot.boot_devices=bootdevice
BOARD_KERNEL_BASE        := 0x40078000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x14f88000
BOARD_SECOND_OFFSET      := 0x00e88000
BOARD_TAGS_OFFSET        := 0x13f88000
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
BOARD_BOOTIMG_HEADER_VERSION := 1

# Extracted from bootimg.cfg:
# kerneladdr  = 0x40080000 → base = kerneladdr - 0x8000 = 0x40078000
# ramdiskaddr = 0x55000000 → offset = 0x55000000 - 0x40078000 = 0x14f88000
# tagsaddr    = 0x54000000 → offset = 0x54000000 - 0x40078000 = 0x13f88000

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

# Partitions — from /proc/partitions + by-name symlinks
BOARD_FLASH_BLOCK_SIZE              := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE      := 33554432    # mmcblk0p33 32MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 67108864    # mmcblk0p2  64MB
BOARD_CACHEIMAGE_PARTITION_SIZE     := 452984832   # mmcblk0p41 432MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 5586853888  # mmcblk0p40 ~5.2GB
BOARD_VENDORIMAGE_PARTITION_SIZE    := 1124585472  # mmcblk0p39 ~1GB
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 54229187584 # mmcblk0p42 ~50GB

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Non A/B device
AB_OTA_UPDATER := false

# Display — from kernel cmdline: 1080p panel oppo18561_tianma_himax83112a
TARGET_SCREEN_DENSITY := 480
TARGET_SCREEN_WIDTH   := 1080
TARGET_SCREEN_HEIGHT  := 2340

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_MKE2FS            := true
BOARD_HAS_LARGE_FILESYSTEM    := true
BOARD_HAS_NO_SELECT_BUTTON    := true
BOARD_SUPPRESS_SECURE_ERASE   := true
RECOVERY_SDCARD_ON_DATA       := true

# MTK specific
BOARD_USES_MTK_HARDWARE := true
TW_MTK_CRYPTO           := true

# TWRP flags
TW_THEME                    := portrait_hdpi
TW_EXTRA_LANGUAGES          := true
TW_NO_SCREEN_BLANK          := true
TW_NO_SCREEN_TIMEOUT        := true
TW_NO_REBOOT_BOOTLOADER     := true
TW_USE_TOOLBOX              := true
TW_EXCLUDE_MTP              := true
TW_INCLUDE_NTFS_3G          := true
TW_INCLUDE_REPACKTOOLS      := true
TW_INCLUDE_RESETPROP        := true
TW_INCLUDE_LIBRESETPROP     := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST          := "hbtp_vm"

# Brightness — from ueventd + kernel cmdline
TW_BRIGHTNESS_PATH      := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS       := 2047
TW_DEFAULT_BRIGHTNESS   := 1200

# CPU temp
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone1/temp"

# Crypto — FBE aes-256-xts from fstab
TW_INCLUDE_CRYPTO          := true
TW_INCLUDE_CRYPTO_FBE      := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Security patch spoof (required for FBE decrypt on Android 11)
PLATFORM_VERSION            := 11
PLATFORM_SECURITY_PATCH     := 2099-12-31
VENDOR_SECURITY_PATCH       := 2099-12-31
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Version
TW_DEVICE_VERSION := CPH1911-alpha1
