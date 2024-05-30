LOADMODULES_VERSION = 0.0.1
LOADMODULES_SITE = $(BR2_EXTERNAL_KBS_PATH)/package/loadmodules
LOADMODULES_SITE_METHOD = local
LOADMODULES_INSTALL_TARGET = YES

define LOADMODULES_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(LOADMODULES_PKGDIR)/S05modules $(TARGET_DIR)/etc/init.d/S05modules; \
	mkdir $(TARGET_DIR)/etc/modules.d; \
	echo "snd-bcm2835" > $(TARGET_DIR)/etc/modules.d/01sound;
endef

$(eval $(generic-package))