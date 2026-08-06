#!/bin/bash
rm -rf feeds/packages/net/{xray-core,sing-box,v2ray-geodata}
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages

# OpenClash
git clone -b dev --depth 1 https://github.com/vernesong/OpenClash package/OpenClash

# homeproxy
#git clone -b dev --depth 1 https://github.com/immortalwrt/homeproxy package/luci-app-homeproxy
git clone --depth 1 -b master https://github.com/fun200/homeproxy_plus package/luci-app-homeproxy
sed -i "s/ImmortalWrt/OpenWrt/g" package/luci-app-homeproxy/po/zh_Hans/homeproxy.po
sed -i "s/ImmortalWrt proxy/OpenWrt proxy/g" package/luci-app-homeproxy/htdocs/luci-static/resources/view/homeproxy/{client.js,server.js}

# dae daed
#git clone https://github.com/kenzok8/openwrt-daede package/daede
#git clone -b kix --depth 1 https://github.com/QiuSimons/luci-app-dae package/dae
git clone -b kix --depth 1 https://github.com/QiuSimons/luci-app-daed package/daed
git clone https://github.com/QiuSimons/vmlinux-btf package/vmlinux-btf
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=2026.06.14/g' package/daed/daed/Makefile
sed -i 's/DAED_VERSION:=.*/DAED_VERSION:=daed-4d6a433/g' package/daed/daed/Makefile
sed -i 's/WING_VERSION:=.*/WING_VERSION:=wing-dc50308/g' package/daed/daed/Makefile
sed -i 's/CORE_VERSION:=.*/CORE_VERSION:=core-5a51cc7/g' package/daed/daed/Makefile
sed -i 's/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=4d6a43331f2f6e25961935b9e7ac09a7568bb2b4/g' package/daed/daed/Makefile

# 克隆immortalwrt-luci packages仓库
git clone --depth=1 -b openwrt-25.12 https://github.com/immortalwrt/luci.git immortalwrt-luci
cp -rf immortalwrt-luci/applications/luci-app-diskman feeds/luci/applications/luci-app-diskman
ln -sf ../../../feeds/luci/applications/luci-app-diskman ./package/feeds/luci/luci-app-diskman
cp -rf immortalwrt-luci/applications/luci-app-msd_lite feeds/luci/applications/luci-app-msd_lite
ln -sf ../../../feeds/luci/applications/luci-app-msd_lite ./package/feeds/luci/luci-app-msd_lite
cp -rf immortalwrt-luci/applications/luci-app-ramfree feeds/luci/applications/luci-app-ramfree
ln -sf ../../../feeds/luci/applications/luci-app-ramfree ./package/feeds/luci/luci-app-ramfree
cp -rf immortalwrt-luci/applications/luci-app-unblockneteasemusic feeds/luci/applications/luci-app-unblockneteasemusic
ln -sf ../../../feeds/luci/applications/luci-app-unblockneteasemusic ./package/feeds/luci/luci-app-unblockneteasemusic
git clone --depth=1 -b openwrt-25.12 https://github.com/immortalwrt/packages.git immortalwrt-packages
cp -rf immortalwrt-packages/net/msd_lite feeds/packages/net/msd_lite
ln -sf ../../../feeds/packages/net/msd_lite ./package/feeds/packages/msd_lite
sed -i 's/解除网易云音乐播放限制/音乐解锁/g' feeds/luci/applications/luci-app-unblockneteasemusic/root/usr/share/luci/menu.d/luci-app-unblockneteasemusic.json

# change luci
#perl -pi -e "s/hostname='OpenWrt'/hostname='XiaomanWrt'/g" package/base-files/files/bin/config_generate
#node insert.js
#mv 1.png package/new/luci-theme-argon/luci-theme-argon/htdocs/luci-static/argon/background/
# 自定义脚本
