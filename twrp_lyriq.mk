#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# Inherit some common pb stuff.
$(call inherit-product-if-exists, vendor/pb/config/common.mk)

# Inherit from lyriq device
$(call inherit-product, device/motorola/lyriq/device.mk)

PRODUCT_DEVICE := lyriq
PRODUCT_NAME := twrp_lyriq
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 40
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola
