#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/motorola/cedric/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)
$(call inherit-product, vendor/lineage/config/common_mini_go_phone.mk)

# GMS GO (1GB)
WITH_GMS := true
GMS_MAKEFILE := gms_go.mk

$(call inherit-product, vendor/lineage/config/partner_gms.mk)


# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_cedric_gms_go
PRODUCT_DEVICE := cedric
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G (5)
PRODUCT_MANUFACTURER := motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="cedric_retail-user 8.1.0 OPP28.85-19-4-2 3447de release-keys" \
    PRODUCT_NAME="cedric_retail"

BUILD_FINGERPRINT := motorola/cedric_retail/cedric:8.1.0/OPP28.85-19-4-2/3447de:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# DocumentsUI overlay
PRODUCT_PACKAGES += \
    DocumentsUIOverlay

# Trust
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# APN(s)
PRODUCT_COPY_FILES += vendor/lineage/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml
