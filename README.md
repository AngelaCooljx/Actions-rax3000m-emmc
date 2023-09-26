# Actions-rax3000m-emmc-ubootmod
使用 GitHub Actions 在线编译定制 CMCC RAX3000M EMMC (ubootmod) 版本的 ImmortalWrt-23.05-SNAPSHOT 固件

**得益于 @1715173329 的提交 [b587b57](https://github.com/immortalwrt/immortalwrt/commit/b587b57d8f1a33925e473af38bc4c17f80af0417) ，ImmortalWrt 官方现已支持 CMCC RAX3000M EMMC 版本固件编译使用**

## 固件特性
使用 [ImmortalWrt 官方仓库](https://github.com/immortalwrt/immortalwrt/tree/openwrt-23.05)，openwrt-23.05 分支源码编译，无线使用 mt76 开源驱动，主线已支持硬件加速，内核版本 5.15，软件包支持在线安装。

固件默认选中软件包
`kmod-mt7981-firmware, mt7981-wo-firmware, kmod-usb3, automount, f2fsck, mkf2fs`

添加集成软件包
`f2fs-tools, htop, openssl-util, kmod-fuse, kmod-usb-net-ipheth, kmod-usb-net-rndis, luci-app-argon-config, luci-app-autoreboot, luci-app-diskman, luci-app-ksmbd, luci-app-openclash, luci-app-openvpn, luci-app-ttyd, luci-app-upnp, luci-app-usb-printer, luci-app-zerotier, luci-theme-argon`
并预置 openclash 内核

**如需在线安装 kmod 内核模块类型软件包，你需要在 http://mirrors.pku.edu.cn/immortalwrt/releases/23.05-SNAPSHOT/targets/mediatek/filogic/packages/ 处手动查找下载 "kernel_5.15.\*-1-\*_aarch64_cortex-a53.ipk" 该软件包并上传安装，之后即可正常在线安装其他 kmod 软件包**

## 使用说明
每周日 19 时自动执行或在 Actions 选择该工作流手动点击 Run workflow 执行编译，等待固件编译完成上传至 releases 发布即可下载

默认 LAN IP 已更改为 `192.168.6.1`，可在 `scripts/diy.sh` 处修改

需要取消集成或添加其他软件包可在 `configs/rax3000m-emmc.config` 处参考注释内容自行修改或添加配置

Actions 默认编译 52 MHz 版本，部分机器使用默认 52 MHz 闪存频率固件可能会出现 I/O 报错，无法正常使用，需要在 Run workflow 时勾选 **Use 26MHz max-frequency** 重新编译刷入使用，或在工作流配置文件中将 `USE_26MHZ` 中 `default: 'false'` 的 false 改为 true

## Credits
- [XiaoBinin/Actions-immortalwrt](https://github.com/XiaoBinin/Actions-immortalwrt)
- [hanwckf/immortalwrt-mt798x](https://github.com/hanwckf/immortalwrt-mt798x)
- [lgs2007m/immortalwrt-mt798x-rax3000m-emmc](https://github.com/lgs2007m/immortalwrt-mt798x-rax3000m-emmc)
- [GL-iNet](https://github.com/gl-inet)
- [padavanonly](https://github.com/padavanonly)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
