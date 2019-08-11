include $(TOPDIR)/rules.mk

PKG_NAME:=chw
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=John Doe <john.doe@example.com>
PKG_LICENSE:=CC0-1.0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/chw
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Hello world application
	URL:=https://www.example.com
endef

define Package/chw/description
	hello world application
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	# $(CP) ./src/{main.c,Makefile} $(PKG_BUILD_DIR)/
endef

define Build/Configure
	cmake -B $(PKG_BUILD_DIR) -S ./src
endef

define Build/Compile
	$(call Build/Compile/Default,-C $(PKG_BUILD_DIR))
endef

define Package/chw/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/chw $(1)/usr/bin/
endef

$(eval $(call BuildPackage,chw))
