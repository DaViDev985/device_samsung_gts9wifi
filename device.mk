#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Tablet
TARGET_IS_TABLET := true

# Characteristics
PRODUCT_CHARACTERISTICS := tablet

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

# Set boot animation orientation and default display rotation to be landscape.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.bootanim.set_orientation_logical_0=ORIENTATION_90
    
# Derp Flags
DERP_BUILDTYPE=Community
DERP_VERSION_APPEND_TIME_OF_DAY=true
EXTRA_UDFPS_ICONS=true
TARGET_NOT_USES_BLUR=true
TARGET_USES_PICO_GAPPS=true

# Fingerprint
TARGET_HAS_UDFPS := true

# Init
PRODUCT_PACKAGES += \
    init.gts9wifi.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResGts9wifi \
    SystemUIResGts9wifi \
    SettingsResGts9wifi \
    ApertureResGts9wifi

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Keyboard Cover Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/Vendor_04e8_Product_a035.idc:vendor/usr/idc/Vendor_04e8_Product_a035.idc

# ANGLE
PRODUCT_PACKAGES += \
    ANGLE

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/gts9wifi/gts9wifi-vendor.mk)