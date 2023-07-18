ifneq ($(AUDIO_USE_STUB_HAL), true)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-macro-redefined -Wno-unused-function
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT)), true)
LOCAL_CFLAGS += -DENABLE_EXTENDED_COMPRESS_FORMAT
endif
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := compress.c utils.c compress_hw.c compress_plugin.c snd_utils.c
LOCAL_MODULE := libtinycompress
LOCAL_SHARED_LIBRARIES := libcutils libutils
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-macro-redefined -Wno-unused-function
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif
LOCAL_SRC_FILES := cplay.c
LOCAL_MODULE := cplay
LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := libcutils libutils libtinycompress
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_CFLAGS := -Wno-macro-redefined -Wno-unused-function
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SRC_FILES := compress.c utils.c
LOCAL_CFLAGS += -DUSE_VENDOR_EXTN
LOCAL_CFLAGS += -DENABLE_EXTENDED_COMPRESS_FORMAT
LOCAL_MODULE := libtinycompress_vendor
LOCAL_SHARED_LIBRARIES := libcutils libutils
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true
include $(BUILD_SHARED_LIBRARY)
endif
