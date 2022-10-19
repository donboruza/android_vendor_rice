PRODUCT_VERSION_MAJOR = 7
PRODUCT_VERSION_MINOR = 5

RICE_FLAVOR := Tiramisu
RICE_VERSION := Kalamay
RISE_CODE := 3.0
RICE_CODE := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)

ifeq ($(RICE_OFFICIAL), true)
    RICE_BUILDTYPE := OFFICIAL
else
    RICE_BUILDTYPE := COMMUNITY
endif

ifeq ($(WITH_GMS), true)
    ifeq ($(TARGET_CORE_GMS), true)
       RICE_PACKAGE_TYPE ?= CORE
    else ifeq ($(TARGET_OPTOUT_GOOGLE_TELEPHONY), true)
       RICE_PACKAGE_TYPE ?= GMS
    else
       RICE_PACKAGE_TYPE ?= PIXEL
    endif
else
       RICE_PACKAGE_TYPE ?= AOSP
endif

LINEAGE_BUILD_DATE := $(shell date -u +%y%m%d%H)

LINEAGE_VERSION_SUFFIX := $(LINEAGE_BUILD_DATE)-$(RICE_BUILDTYPE)-$(RICE_PACKAGE_TYPE)-$(LINEAGE_BUILD)

# Internal version
LINEAGE_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_VERSION_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_VERSION_SUFFIX)
