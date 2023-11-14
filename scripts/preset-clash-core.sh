#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================


# 预置openclash内核
mkdir -p files/etc/openclash/core


# dev内核
CLASH_DEV_URL="https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux-arm64.tar.gz"
# premium内核
CLASH_TUN_URL="https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux-arm64-2023.08.17-13-gdcc8d87.gz"
# Meta内核版本
CLASH_META_URL="https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux-arm64.tar.gz"

wget -qO- $CLASH_DEV_URL | gunzip -c > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta
# 给内核权限
chmod +x files/etc/openclash/core/clash*

# meta 要GeoIP.dat 和 GeoSite.dat
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# Country.mmdb
COUNTRY_LITE_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/lite/Country.mmdb
# COUNTRY_FULL_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb
wget -qO- $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb
# wget -qO- $COUNTRY_FULL_URL > files/etc/openclash/Country.mmdb
