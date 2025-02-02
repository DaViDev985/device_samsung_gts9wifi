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
DERP_BUILDTYPE=Official
DERP_VERSION_APPEND_TIME_OF_DAY=true
EXTRA_UDFPS_ICONS=true
TARGET_NOT_USES_BLUR=true
TARGET_USES_PICO_GAPPS=true
TARGET_SUPPORTS_QUICK_TAP=false

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

# Remove Packages
PRODUCT_PACKAGES += \
    RemovePackages

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Samsung IDC files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/idc/,$(TARGET_COPY_OUT_VENDOR)/usr/idc)

# ANGLE
PRODUCT_PACKAGES += \
    ANGLE

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8550-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/gts9wifi/gts9wifi-vendor.mk)