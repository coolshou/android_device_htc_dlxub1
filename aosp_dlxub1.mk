# AOSP base ROM for HTC butterfly x920d (dlxub1)
#


# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Release name
PRODUCT_RELEASE_NAME := dlxub1
PRODUCT_NAME := aosp_dlxub1

#with following line, the system.img & userdata.img will be in full size like AOSP x86 image
# system.img size = BOARD_SYSTEMIMAGE_PARTITION_SIZE
# userdata.img size = BOARD_USERDATAIMAGE_PARTITION_SIZE
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

#avoid hardware/qcom/display/msm8960/liblight and device/htc/msm8960-common/liblights conflect
TARGER_CM_BASE := false
# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/dlxub1/full_dlxub1.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := dlxub1
#PRODUCT_NAME := htc_asia_tw
#must same as vendorsetup.sh
PRODUCT_NAME := aosp_dlxub1
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Butterfly
PRODUCT_MANUFACTURER := HTC
PRODUCT_BOARD := MSM8960
PRODUCT_DEFAULT_LANGUAGE :=zh
PRODUCT_DEFAULT_REGION := TW


export BUILD_USER=buildteam
export BUILD_HOST=ABM105
 
# Set build fingerprint / ID / Product Name etc.
#PRODUCT_BUILD_PROP_OVERRIDES += \
#	BUILD_ID=LMY49I \
#	PRODUCT_NAME=dlxub1 \
#	BUILD_FINGERPRINT=htc/htc_asia_tw/dlxub1:5.1.1/LMY49I/279904.9:user/release-keys \
#	PRIVATE_BUILD_DESC="3.12.709.9 CL279904 release-keys"

