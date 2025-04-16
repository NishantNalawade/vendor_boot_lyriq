#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/lyriq

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

PRODUCT_PACKAGES += \
     android.hardware.health@2.0-service \
     android.hardware.health@1.0.vendor \
     android.hardware.health@2.0.vendor

PRODUCT_PACKAGES += \
    bootctrl.mt6893

# Copy modules for depmod
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*.ko,$(DEVICE_PATH)/recovery/root/lib/modules,$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules)

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_DTB):$(PRODUCT_OUT)/dtb.img

#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.mt6893 \
#    libgptutils \
#    libz \
#    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
