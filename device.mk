#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from msm8937-common
$(call inherit-product, device/motorola/msm8937-common/msm8937.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/cedric/cedric-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=1 \
    ro.surface_flinger.vsync_event_phase_offset_ns=5000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=7500000 \
    debug.mdpcomp.idletime=600 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    pm.dexopt.shared=quicken \
    pm.dexopt.downgrade_after_inactive_days=10 \
    debug.enable.sglscale=1 \
    debug.sf.hw=1 \
    debug.hwui.renderer=opengl \
    debug.egl.hw=1 \
    debug.sf.disable_hwc=0 \
    debug.sf.recomputecrop=0 \
    debug.sf.disable_backpressure=1 \
    debug.cpurend.vsync=false \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    debug.sf.gpu_comp_tiling=1 \
    debug.performance.tuning=1 \
    video.accelerate.hw=1 \
    debug.renderengine.backend=gles

# Disable buffer age
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false


PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    libppeiscore_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/msm8937_mot_camera_conf.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8937_mot_camera_conf.xml \
    $(LOCAL_PATH)/configs/camera/mot_ov5695_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_ov5695_chromatix.xml \
    $(LOCAL_PATH)/configs/camera/mot_imx258_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/mot_imx258_chromatix.xml


# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc


# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Optimize
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI

# Strip debug
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    dalvik.vm.zygotemaxfailedboots=5 \
    dalvik.vm.foreground-heap-growth-multiplier=4.0 \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false \
    dalvik.vm.dex2oat-threads=2 \
    ro.vendor.qti.am.reschedule_service=true \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.boot-dex2oat-cpu-set=0,1,2,3 \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.dex2oat-cpu-set=0,1 \
    dalvik.vm.isa.arm.features=div \
    persist.sys.dalvik.vm.lib.2=libart.so

    sys.use_fifo_ui=1
    dalvik.vm.systemservercompilerfilter=speed-profile
    dalvik.vm.extra-opts=-Xcompiler-option --inline-max-code-units=0

# Improve scrolling
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.scrollingcache=0 \
    ro.min.fling_velocity=160 \
    ro.max.fling_velocity=20000

# IO Cgroups
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.iocgrp.config=1

    
    
# Low Memory Killer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.config.ulmk_memcg=true \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=0 \
    ro.lmk.downgrade_pressure=60 \
    ro.lmk.kill_heaviest_task=false
    ro.lmk.use_psi=false \
    ro.lmk.critical=0 \
    ro.lmk.low=950
    ro.lmk.critical=0 \
    ro.lmk.low=950 \
    ro.lmk.swap_free_low_percentage=15

# Inherit customized Android Go defaults.
$(call inherit-product, device/motorola/cedric/go_defaults_custom.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true \
    ro.vendor.qti.sys.fw.bservice_limit=5 \
    ro.vendor.qti.sys.fw.bservice_age=5000 \
    ro.vendor.qti.sys.fw.use_trim_settings=true \
    ro.vendor.qti.sys.fw.empty_app_percent=50 \
    ro.vendor.qti.sys.fw.trim_empty_percent=100 \
    ro.vendor.qti.sys.fw.trim_cache_percent=100 \
    ro.vendor.qti.sys.fw.trim_enable_memory=2147483648

# Sensors
PRODUCT_PACKAGES += \
    motosh

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.cedric

# Makes device compatible with Google Dialer Go.
# In better case it should be a part of Gapps
# but we have no Gapps specially for Android Go devices
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/googledialergo-sysconfig.xml:system/etc/sysconfig/googledialergo-sysconfig.xml

# The target has no boot jars to check
SKIP_BOOT_JARS_CHECK := true

# Inherit common Android Go defaults.
$(call inherit-product, build/make/target/product/go_defaults.mk)
