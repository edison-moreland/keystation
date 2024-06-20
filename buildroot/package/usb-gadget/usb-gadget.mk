USB_GADGET_VERSION = 0.0.1
USB_GADGET_SITE = $(BR2_EXTERNAL_KBS_PATH)/package/usb-gadget
USB_GADGET_SITE_METHOD = local
USB_GADGET_INSTALL_TARGET = YES
USB_GADGET_INIT_SCRIPT = S02usb-gadget

define USB_GADGET_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_GADGET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_LIBCOMPOSITE)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_CONFIGFS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_CONFIGFS_ACM)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_CONFIGFS_F_MIDI2)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_CONFIGFS_F_MIDI)
endef

define USB_GADGET_INSTALL_MODULES
	$(INSTALL) -D -m 755 $(USB_GADGET_PKGDIR)/02usb $(TARGET_DIR)/etc/modules.d/02usb;
endef
USB_GADGET_POST_INSTALL_TARGET_HOOKS += USB_GADGET_INSTALL_MODULES


USB_GADGET_CONFIGFS_FSTAB='none		/sys/kernel/config		configfs	defaults	0	0'

define USB_GADGET_INSTALL_FSTAB
	if ! grep -q $(USB_GADGET_CONFIGFS_FSTAB) $(TARGET_DIR)/etc/fstab; then\
		echo $(USB_GADGET_CONFIGFS_FSTAB) >> $(TARGET_DIR)/etc/fstab;\
	fi
endef
USB_GADGET_POST_INSTALL_TARGET_HOOKS += USB_GADGET_INSTALL_FSTAB

define USB_GADGET_INSTALL_INIT
	$(INSTALL) -D -m 755 $(USB_GADGET_PKGDIR)/$(USB_GADGET_INIT_SCRIPT) $(TARGET_DIR)/etc/init.d/$(USB_GADGET_INIT_SCRIPT)
endef
USB_GADGET_POST_INSTALL_TARGET_HOOKS += USB_GADGET_INSTALL_INIT

USB_GADGET_INITTAB_GETTY='ttyGS0::respawn:-/bin/sh'

define USB_GADGET_INSTALL_GETTY
	if ! grep -q $(USB_GADGET_INITTAB_GETTY) $(TARGET_DIR)/etc/inittab; then\
		echo $(USB_GADGET_INITTAB_GETTY) >> $(TARGET_DIR)/etc/inittab;\
	fi
endef
USB_GADGET_POST_INSTALL_TARGET_HOOKS += USB_GADGET_INSTALL_GETTY

$(eval $(generic-package))