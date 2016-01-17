# Java製アプリが動くVM環境のひな形

複数の、役割の違うサーバを似た構成で立てるためのひな形になるVagrantfileとスクリプトです。

## VM情報

- vagrant-server1: 必要に応じて増やしてください。

## 前提条件

### マシン条件

BIOSの設定で、仮想化技術(Virtualization Technology)をONにしておくこと。
設定方法は各自のBIOSのマニュアルを参照。

### Oracle VirtualBoxのダウンロード

https://www.virtualbox.org/

### Vagrantのダウンロード

https://www.vagrantup.com/

## Setup

プロキシ環境下で動くように、Vagrant Proxy Pluginを導入します。

```sh
sh setup.sh
```

