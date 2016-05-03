# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).


#eng版本要生成odex的话，那么只需要把WITH_DEXPREOPT := true ；
WITH_DEXPREOPT := true
#user版不想生成odex，那么只需要定义DISABLE_DEXPREOPT := true；
DISABLE_DEXPREOPT := false
#如果想单独控制某一个应用是否生成odex的话可以在这个应用的Android.mk中添加WITH_DEXPREOPT := true；


# inherit from common msm8960
-include device/htc/dlxub1/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/dlxub1/include

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp

#CPU, TODO
#ARCH_ARM_HAVE_NEON := true
#adreno320?
#TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
#
#TARGET_2ND_ARCH=
#TARGET_2ND_ARCH_VARIANT=
#TARGET_2ND_CPU_VARIANT=

# Assert
TARGET_OTA_ASSERT_DEVICE := dlxub1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := dlxub1
BOARD_HAS_LARGE_FILESYSTEM := true

# Adreno configuration
BOARD_EGL_CFG := device/htc/dlxub1/configs/egl.cfg

#Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=dlxub1 user_debug=31
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01808000
TARGET_KERNEL_CONFIG := deluxe_ub1_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/dlxub1

KERNEL_DEFCONFIG := $(TARGET_KERNEL_CONFIG)
KERNEL_DIR := device/htc/dlxub1-kernel


-include $(KERNEL_DIR)/AndroidKernel.mk

# Audio
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_SEPERATED_VOIP := true
BOARD_AUDIO_AMPLIFIER := device/htc/dlxub1/libaudioamp
BOARD_HAVE_HTC_CSDCLIENT := true
#? hardware/qcom/audio/legacy/libalsa-intf/alsa_mixer.c:33:23: fatal error: sound/tlv.h: No such file or directory
#? from hardware/qcom/audio/legacy/libalsa-intf/alsa_mixer.c:21:
#bionic/libc/kernel/uapi/asm-arm/asm/signal.h:105:14: error: expected ':', ',', ';', '}' or '__attribute__' before '*' token
#BOARD_USES_LEGACY_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

# Camera
USE_CAMERA_STUB := false
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Graphics
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
HAVE_ADRENO_SOURCE := false

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/dlxub1/bluetooth/include
BOARD_BLUEDROID_VENDOR_CONF := device/htc/dlxub1/bluetooth/vnd_dlxub1.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Use libril in the device tree
BOARD_PROVIDES_LIBRIL := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# We have the new GPS driver
BOARD_HAVE_NEW_QC_GPS := true

# Wifi
#WPA_SUPPLICANT_VERSION := VER_2_1_DEVEL
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/etc/firmware/fw_bcm4334_p2p.bin"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
#/dev/block/mmcblk0p32 /system
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
#/dev/block/mmcblk0p34 /data
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12482248704
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 36
# EXT4 larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true


# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Added for Clockworkmod
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
