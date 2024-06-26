PATCH_LOADER_VERSION = 0.0.1
PATCH_LOADER_SITE = $(BR2_EXTERNAL_KBS_PATH)/../system-components
PATCH_LOADER_SITE_METHOD = local
PATCH_LOADER_SUBDIR = patch-loader
PATCH_LOADER_INSTALL_TARGET = YES

define PATCH_LOADER_COPY_PATCHES
	mkdir -p $(TARGET_DIR)/usr/share/patches; \
	$(INSTALL) -D -m 655 $(@D)/patch-loader/patches/*.vcv $(TARGET_DIR)/usr/share/patches/;
endef
PATCH_LOADER_POST_INSTALL_TARGET_HOOKS += PATCH_LOADER_COPY_PATCHES

define PATCH_LOADER_CARGO_FETCH
# Hacky way to fetch deps

     cd $(PATCH_LOADER_SRCDIR) && \
         PATH=$(HOST_DIR)/bin:$(PATH) $(PKG_CARGO_ENV) cargo fetch
endef

PATCH_LOADER_POST_RSYNC_HOOKS += PATCH_LOADER_CARGO_FETCH

$(eval $(cargo-package))