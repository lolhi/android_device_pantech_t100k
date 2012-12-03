COMMON_GLOBAL_CFLAGS += -DT100K -DNEED_UMS_ENABLE
TARGET_SPECIFIC_HEADER_PATH := device/pantech/t100k/include

#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/pantech/t100k/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true

TARGET_BOOTLOADER_BOARD_NAME := t100k
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Init
TARGET_PROVIDES_INIT_RC := true

# Preload bootanimation
TARGET_BOOTANIMATION_PRELOAD := true

# Camera
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
BOARD_NEEDS_MEMORYHEAPPMEM := true

## This is evil. The mt9m114 (FFC) data inside the liboemcamera blob is in the .bss section,
## and inaccessible if PIE is enabled
TARGET_DISABLE_ARM_PIE := true

# Audio
COMMON_GLOBAL_CFLAGS += -DQCOM_ACDB_ENABLED -DLEGACY_QCOM_VOICE
TARGET_USES_ION_AUDIO := true

# For headset
BOARD_USES_ALSA_AUDIO := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
TARGET_NEEDS_BLUETOOTH_INIT_DELAY := true

# Vibrator
BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/pantech/t100k/vibrator/vibrator.c

# Graphics
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ROTATOR_KERNEL_FORMATS
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_GENLOCK := true
TARGET_USES_ION := true
BOARD_USES_QCOM_LIBS := true
BOARD_EGL_CFG := device/pantech/t100k/configs/egl.cfg
TARGET_USES_OVERLAY := true
TARGET_NO_HW_VSYNC := true
TARGET_HAVE_BYPASS  := true
TARGET_NO_BYPASS_CROPPING := true

TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
TARGET_USE_SCORPION_PLD_SET := true
TARGET_SCORPION_BIONIC_PLDOFFS := 6
TARGET_SCORPION_BIONIC_PLDSIZE := 128

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.carrier=KT-KOR loglevel=0
BOARD_KERNEL_BASE := 0x40200000
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/pantech/t100k/prebuilt/kernel

BOARD_BOOTIMAGE_PARTITION_SIZE := 0xA00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0xA00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 361234432
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1548140544
BOARD_FLASH_BLOCK_SIZE := 131072

#BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY := true

# Wifi related defines
#WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER	 := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
BOARD_HOSTAPD_DRIVER             := WEXT
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_wext
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wl/bcm43291.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wl/bcm43291_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wl/bcm43291_p2p.bin"

# Wifi
WIFI_DRIVER_MODULE_NAME          := wlan
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/wlan/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wl/bcm43291.bin nvram_path=/system/etc/wl/nvram.txt"

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := qcom
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 33
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := false

# Recovery
BOARD_HAS_JANKY_BACKBUFFER := true
BOARD_CUSTOM_GRAPHICS := ../../../device/pantech/t100k/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/pantech/t100k/recovery/recovery_keys.c
#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"
TARGET_USERIMAGES_USE_EXT4 := true