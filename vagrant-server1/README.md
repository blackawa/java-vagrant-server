# server1

Write Description Here

## Awake

```sh
vagrant up
# Provisioning...
# Wait for a few minutes!
vagrant ssh
# -> Operate your mission
```

## Setup

### X-Windowの有効化

X-Windowはデフォルトで管理者権限を持っていないユーザでは無効なので、設定を書き換える。

```sh
su -
# password: vagrant
vim /etc/pam.d/xserver
# auth required pam_console.so
#               ^^^^^^^^^^^^^^
#                 -> pam_permit.so
```

