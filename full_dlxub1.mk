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

# Inherit from msm8960-common
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# Inherit from dlxub1 device
$(call inherit-product, device/htc/dlxub1/device.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=zh \
	ro.product.locale.region=TW

#kernel
#kernel modules


#PRODUCT_COPY_FILES += \
	
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

# Misc stuff
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
#    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# QC thernald config
#PRODUCT_COPY_FILES += device/htc/dlxub1/configs/thermald.conf:/system/etc/thermald.conf

# Media configs
PRODUCT_COPY_FILES += device/htc/dlxub1/configs/AudioBTID.csv:system/etc/AudioBTID.csv
PRODUCT_COPY_FILES += device/htc/dlxub1/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# ? config
#PRODUCT_COPY_FILES += \
#    device/htc/dlxub1/configs/calibration:/system/etc/calibration \
#    device/htc/dlxub1/configs/calibration.gpio4:/system/etc/calibration.gpio4

# Audio config
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/dlxub1/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/dlxub1/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/dlxub1/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

#PRODUCT_COPY_FILES += \
#    device/htc/dlxub1/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 

# Wifi
PRODUCT_COPY_FILES += \
    device/htc/dlxub1/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/dlxub1/configs/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf

PRODUCT_PACKAGES += \
	hostapd \
	wpa_supplicant
	
# Media
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
#PRODUCT_COPY_FILES += \
#    device/htc/dlxub1/keylayout/dummy_keypad.kl:system/usr/keylayout/dummy_keypad.kl \
#    device/htc/dlxub1/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
#    device/htc/dlxub1/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
#    device/htc/dlxub1/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
#    device/htc/dlxub1/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
#    device/htc/dlxub1/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl
    
PRODUCT_PACKAGES += \
	keystore.msm8960

# Input device config
#PRODUCT_COPY_FILES += \
#    device/htc/dlxub1/idc/projector_input.idc:system/usr/idc/projector_input.idc \
#    device/htc/dlxub1/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

#display
PRODUCT_PACKAGES += \
	gralloc.default \
	gralloc.msm8960 \
	libGLES_android
	
# Audio
#msm8974 msm8226 msm8084
#	libqcompostprocbundle \
#
PRODUCT_PACKAGES += \
	libqcomvisualizer \
	libqcomvoiceprocessing \
	libaudioamp \
	audio.primary.msm8960 \
	audio.mirrorlink.default 
	
# Camera
PRODUCT_PACKAGES += \
	camera.msm8960

# GPS
# The gps config appropriate for this device
#PRODUCT_COPY_FILES += device/htc/dlxub1/gps/gps.conf:system/etc/gps.conf

PRODUCT_PACKAGES += \
        libloc_adapter \
        libloc_api_v02 \
        libloc_ds_api 

PRODUCT_PACKAGES += \
        libloc_core \
        libloc_eng \
        libgps.utils \
        gps.default \
        gps.msm8960 \
        gps.conf

# Torch
PRODUCT_PACKAGES += \
    Torch

#
PRODUCT_PACKAGES += \
	consumerir.default

#other libs
PRODUCT_PACKAGES += \
	libtinyxml
    
#opencv
PRODUCT_PACKAGES += \
	libcxcore \
	libcv \
	libcvaux \
	libcvml \
	libcvhighgui \
	libopencv

#sepolicy
PRODUCT_PACKAGES += \
	sepolicy \
	sepolicy.recovery \
	general_sepolicy.conf \
	file_contexts \
	seapp_contexts \
	property_contexts \
	service_contexts \
	selinux-network.sh \
	mac_permissions.xml \
	selinux_version

PRODUCT_PACKAGES += \
	sepolicy-analyze \
	checkseapp \
	checkfc \
	insertkeys.py \
	sepolicy-check

PRODUCT_PACKAGES += \
	libemoji
	
	
#KeyVPN APK - https://success.mocana.com/hc/en-us/articles/200871447-Installation-of-KeyVPN
#KeyVPN distribution has two types of APKs. 
#One is referred to as the KeyVPNService, and the other is referred to as KeyVPN. 
#The KeyVPNService APK provides the VPN APIs that the KeyVPN APK requires. 
#The KeyVPN APK is basically a wrapper for the APIs provided by KeyVPNService APK. 
#
# libmvpnc.so, libvelodsf.sign.so, and libvelodsf.so 

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS := default

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0


# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# call dalvik heap config 
$(call inherit-product-if-exists, device/htc/dlxub1/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config (CM)
$(call inherit-product-if-exists, device/htc/dlxub1/phone-xxhdpi-2048-hwui-memory.mk)
