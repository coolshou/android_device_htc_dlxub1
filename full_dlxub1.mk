#
# Copyright (C) 2011 The CyanogenMod Project
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


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/dlxub1/msm8960.mk)

#
$(call inherit-product, device/htc/dlxub1/BoardConfig.mk)

# Inherit from dlxub1 device
$(call inherit-product, device/htc/dlxub1/device.mk)



#kernel
# export PATH=$(pwd)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin:$PATH
# export ARCH=arm
# export CROSS_COMPILE=aach-linux-android-
# make deluxe_ub1_defconfig
# make
# make ARCH=arm modules_install INSTALL_MOD_PATH=/home/coolshou/ADT/20-Butterfly/aosp-5/device/htc/dlxub1/prebuild/

USE_PREBUILT_KERNEL := true;
ifeq ($(TARGET_PREBUILT_KERNEL),)
  ifeq ($(USE_PREBUILT_KERNEL), true)
    TARGET_PREBUILT_KERNEL := device/htc/dlxub1/prebuild/zImage
  else
    TARGET_PREBUILT_KERNEL := device/htc/dlxub1-kernel/arch/arm/boot/zImage
  endif
endif

.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):$(PRODUCT_OUT)/kernel

#kernel module
ifeq ($(USE_PREBUILT_KERNEL), true)
  TARGET_PREBUILT_DIR = device/htc/dlxub1/prebuild
  MODULE_DIR := lib/modules/3.4.10-gb734f9b-dirty/kernel
else
  TARGET_PREBUILT_DIR = device/htc/dlxub1-kernel
  MODULE_DIR := .
endif

PRODUCT_COPY_FILES += \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/arch/arm/mach-msm/msm-buspm-dev.ko:$(PRODUCT_OUT)/system/lib/modules/msm-buspm-dev.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/arch/arm/mach-msm/reset_modem.ko:$(PRODUCT_OUT)/system/lib/modules/reset_modem.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/block/test-iosched.ko:$(PRODUCT_OUT)/system/lib/modules/test-iosched.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/crypto/ansi_cprng.ko:$(PRODUCT_OUT)/system/lib/modules/ansi_cprng.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/bluetooth/bluetooth-power.ko:$(PRODUCT_OUT)/system/lib/modules/bluetooth-power.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/crypto/msm/qce40.ko:$(PRODUCT_OUT)/system/lib/modules/qce40.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/crypto/msm/qcedev.ko:$(PRODUCT_OUT)/system/lib/modules/qcedev.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/crypto/msm/qcrypto.ko:$(PRODUCT_OUT)/system/lib/modules/qcrypto.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/input/evbug.ko:$(PRODUCT_OUT)/system/lib/modules/evbug.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/media/video/gspca/gspca_main.ko:$(PRODUCT_OUT)/system/lib/modules/gspca_main.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/misc/eeprom/eeprom_93cx6.ko:$(PRODUCT_OUT)/system/lib/modules/eeprom_93cx6.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/net/ethernet/micrel/ks8851.ko:$(PRODUCT_OUT)/system/lib/modules/ks8851.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/scsi/scsi_wait_scan.ko:$(PRODUCT_OUT)/system/lib/modules/scsi_wait_scan.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/spi/spidev.ko:$(PRODUCT_OUT)/system/lib/modules/spidev.ko \
     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/drivers/video/backlight/lcd.ko:$(PRODUCT_OUT)/system/lib/modules/lcd.ko
     
#     $(TARGET_PREBUILT_DIR)/$(MODULE_DIR)/fs/exfat/exfat.ko:$(PRODUCT_OUT)/system/lib/modules/exfat.ko
#texfat.ko    

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.dlxub1 \
    init.qcom.firmware_links.sh \
    init.dlxub1.rc \
    init.dlxub1.usb.rc \
    ueventd.dlxub1.rc

# Post boot service
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.post_boot.sh:system/etc/init.post_boot.sh

# Recovery
PRODUCT_PACKAGES += \
    lpm.rc \
    charger \
    choice_fn \
    offmode_charging \
    init.recovery.dlxub1.rc

PRODUCT_PACKAGES += \
    battery_0.png \
    battery_1.png \
    battery_2.png \
    battery_3.png \
    battery_4.png \
    battery_fail.png \
    battery_full.png

PRODUCT_PACKAGES += \
    libnetcmdiface

# Misc stuff :permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
#TODO:
#bluetooth, accelerometer, compass, touchscreen.multitouch.distinct, sip sip.voip
#

# QC thernald config
PRODUCT_COPY_FILES += device/htc/dlxub1/configs/thermald.conf:/system/etc/thermald.conf

# Media configs
PRODUCT_COPY_FILES += device/htc/dlxub1/configs/AudioBTID.csv:system/etc/AudioBTID.csv
PRODUCT_COPY_FILES += device/htc/dlxub1/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# wifi config
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/configs/calibration:/system/etc/calibration \
    device/htc/dlxub1/configs/calibration.gpio4:/system/etc/calibration.gpio4

# Audio config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/dlxub1/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/dlxub1/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/dlxub1/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 

#
PRODUCT_PACKAGES += \
    libGLES_android
    
# Wifi
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/htc/dlxub1/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    lib_driver_cmd_bcmdhd \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
#    device/htc/dlxub1/keylayout/dummy_keypad.kl:system/usr/keylayout/dummy_keypad.kl \
#    device/htc/dlxub1/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
#    device/htc/dlxub1/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/dlxub1/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/dlxub1/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/dlxub1/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Audio
PRODUCT_PACKAGES += \
    libaudioamp \
    aplay \
    arec \
    amix \
    libalsa-intf \
    audio.primary.msm8960 \
    audio_policy.msm8960 \
    alsa.msm8960
#    audio.mirrorlink.default

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

#not support RAW    
#PRODUCT_COPY_FILES += \
#	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml

# The gps config appropriate for this device
#PRODUCT_COPY_FILES += device/htc/dlxub1/gps/gps.conf:system/etc/gps.conf

# GPS
PRODUCT_PACKAGES += \
    libloc_adapter \
    libloc_eng \
    libloc_api_v02 \
    libgps.utils \
    gps.default
#    gps.msm8960 \

# Torch
PRODUCT_PACKAGES += \
    Torch

#
PRODUCT_PACKAGES += \
    keystore.msm8960

# Sensor
PRODUCT_PACKAGES += \
    sensors.dlxub1

# 
#PRODUCT_PACKAGES += \
#    libstagefright_hdcp
    
# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS := default

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_USER=buildteam
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_HOST=ABM105

# Device uses high-density artwork where available
#PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
#PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi
PRODUCT_LOCALES += zh_TW en_US xxhdpi

PRODUCT_DEFAULT_LANGUAGE = zh
PRODUCT_DEFAULT_REGION = TW

# following are CyanogenMod's file
# call dalvik heap config
#$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
#$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
