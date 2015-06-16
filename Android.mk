# Copyright (c) 2014 μg Project Team
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := GmsCore
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := GmsCore

gmscore_dir := $(LOCAL_PATH)
#gmscore_apk := play-services-core/build/outputs/apk/play-services-core-release-unsigned.apk
gmscore_apk := play-services-core/build/outputs/apk/play-services-core-debug.apk

$(LOCAL_PATH)/$(gmscore_apk):
	echo "sdk.dir=$(ANDROID_HOME)" > $(gmscore_dir)/local.properties
	cd $(gmscore_dir) && git submodule update --recursive --init
	cd $(gmscore_dir) && ./gradlew clean
#	cd $(gmscore_dir) && JAVA_TOOL_OPTIONS="$(JAVA_TOOL_OPTIONS) -Dfile.encoding=UTF8" ./gradlew assembleRelease
	cd $(gmscore_dir) && JAVA_TOOL_OPTIONS="$(JAVA_TOOL_OPTIONS) -Dfile.encoding=UTF8" ./gradlew assembleDebug

LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := $(gmscore_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)
