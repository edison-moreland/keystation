KEYSTATION_VERSION = 0.0.1
KEYSTATION_SITE = $(BR2_EXTERNAL_KBS_PATH)/../system-components
KEYSTATION_SITE_METHOD = local
KEYSTATION_SUBDIR = keystation
KEYSTATION_INSTALL_TARGET = YES
KEYSTATION_DEPENDENCIES = host-rustc loadmodules

define KEYSTATION_INSTALL_MODULES
	$(INSTALL) -D -m 755 $(KEYSTATION_PKGDIR)/01core $(TARGET_DIR)/etc/modules.d/01core;
endef
KEYSTATION_POST_INSTALL_TARGET_HOOKS += KEYSTATION_INSTALL_MODULES

define KEYSTATION_INSTALL_SERVICE
	$(INSTALL) -D -m 755 $(KEYSTATION_PKGDIR)/S05keystation $(TARGET_DIR)/etc/init.d/S05keystation
endef
KEYSTATION_POST_INSTALL_TARGET_HOOKS += KEYSTATION_INSTALL_SERVICE

KEYSTATION_POST_RSYNC_HOOKS += POST_RSYNC_CARGO_VENDOR

$(eval $(cargo-package))