# docker alpine

<details>
<summary>docker imageをダウンロード</summary>

```  PowerShell
docker pull alpine
```

</details>

<details>
<summary>docker containerを起動</summary>

``` PowerShell
docker run -it -d alpine
```

</details>

<details>
<summary>alpine containerにアクセス</summary>

``` PowerShell
docker exec -it alpine sh  
# docker container
/ #
```

</details>


## 基本コマンド

<details>
<summary>apk help</summary>

``` docker container
/ # apk --help
apk-tools 2.12.7, compiled for x86_64.

usage: apk [<OPTIONS>...] COMMAND [<ARGUMENTS>...]

Package installation and removal:
  add        Add packages to WORLD and commit changes
  del        Remove packages from WORLD and commit changes

System maintenance:
  fix        Fix, reinstall or upgrade packages without modifying WORLD
  update     Update repository indexes
  upgrade    Install upgrades available from repositories
  cache      Manage the local package cache

Querying package information:
  info       Give detailed information about packages or repositories
  list       List packages matching a pattern or other criteria
  dot        Render dependencies as graphviz graphs
  policy     Show repository policy for packages
  search     Search for packages by name or description

Repository maintenance:
  index      Create repository index file from packages
  fetch      Download packages from global repositories to a local directory
  manifest   Show checksums of package contents
  verify     Verify package integrity and signature

Miscellaneous:
  audit      Audit system for changes
  stats      Show statistics about repositories and installations
  version    Compare package versions or perform tests on version strings

This apk has coffee making abilities.
```

</details>

<details>
<summary>apk update && apk upgrade</summary>

``` docker container
/ # apk update && apk upgrade
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.15/community/x86_64/APKINDEX.tar.gz
v3.15.4-138-gcb44b6bacb [https://dl-cdn.alpinelinux.org/alpine/v3.15/main]
v3.15.4-137-gab24a37f18 [https://dl-cdn.alpinelinux.org/alpine/v3.15/community]
OK: 15854 distinct packages available
OK: 6 MiB in 14 packages
```

</details>

<details>
<summary>apk info</summary>

``` docker container
/ # apk info
musl
busybox
alpine-baselayout     
alpine-keys
ca-certificates-bundle
libretls
ssl_client
apk-tools
scanelf
musl-utils
libc-utils
libcrypto1.1
libssl1.1
zlib
```

</details>

<details>
<summary>apk add</summary>

``` docker container
/ # apk add vim
(1/5) Installing xxd (8.2.4836-r0)
(2/5) Installing lua5.3-libs (5.3.6-r1)
(3/5) Installing ncurses-terminfo-base (6.3_p20211120-r0)
(4/5) Installing ncurses-libs (6.3_p20211120-r0)
(5/5) Installing vim (8.2.4836-r0)
Executing busybox-1.34.1-r5.trigger
OK: 35 MiB in 19 packages
```

</details>

<details>
<summary>apk del</summary>

``` docker container
/ # apk del vim
(1/5) Purging vim (8.2.4836-r0)
(2/5) Purging xxd (8.2.4836-r0)
(3/5) Purging lua5.3-libs (5.3.6-r1)
(4/5) Purging ncurses-libs (6.3_p20211120-r0)
(5/5) Purging ncurses-terminfo-base (6.3_p20211120-r0)
Executing busybox-1.34.1-r5.trigger
OK: 6 MiB in 14 packages
```

</details>

## timezoneをAsia/Tokyoへ変更

### 日本時間へ変更

<details>
<summary>date確認</summary>

``` docker container
/ # date
Tue May 17 07:57:26 JST 2022
```

</details>

<details>
<summary>apk add tzdata</summary>

``` docker container
/ # apk add tzdata
(1/1) Installing tzdata (2022a-r0)
Executing busybox-1.34.1-r5.trigger
OK: 38 MiB in 20 packages
```

</details>

<details>
<summary>zone確認</summary>

``` docker container
/ # ls usr/share/zoneinfo/
Africa        Asia          CET           Cuba          Egypt         Factory       GMT+0         HST           Iran          Kwajalein     MST7MDT       Navajo        Poland        Singapore     UTC           Zulu          zone.tab
America       Atlantic      CST6CDT       EET           Eire          GB            GMT-0         Hongkong      Israel        Libya         Mexico        PRC           Portugal      Turkey        Universal     iso3166.tab   zone1970.tab
Antarctica    Australia     Canada        EST           Etc           GB-Eire       GMT0          Iceland       Jamaica       MET           NZ            PST8PDT       ROC           UCT           W-SU          posixrules
Arctic        Brazil        Chile         EST5EDT       Europe        GMT           Greenwich     Indian        Japan         MST           NZ-CHAT       Pacific       ROK           US            WET           right
```

</details>

<details>
<summary>zone/Asia確認</summary>

``` docker container
/ # ls usr/share/zoneinfo/Asia/
Aden           Ashgabat       Bangkok        Chita          Damascus       Gaza           Irkutsk        Kamchatka      Kolkata        Macau          Novokuznetsk   Pyongyang      Saigon         Srednekolymsk  Thimbu         Ulan_Bator     Yangon
Almaty         Ashkhabad      Barnaul        Choibalsan     Dhaka          Harbin         Istanbul       Karachi        Krasnoyarsk    Magadan        Novosibirsk    Qatar          Sakhalin       Taipei         Thimphu        Urumqi         Yekaterinburg
Amman          Atyrau         Beirut         Chongqing      Dili           Hebron         Jakarta        Kashgar        Kuala_Lumpur   Makassar       Omsk           Qostanay       Samarkand      Tashkent       Tokyo          Ust-Nera       Yerevan
Anadyr         Baghdad        Bishkek        Chungking      Dubai          Ho_Chi_Minh    Jayapura       Kathmandu      Kuching        Manila         Oral           Qyzylorda      Seoul          Tbilisi        Tomsk          Vientiane
Aqtau          Bahrain        Brunei         Colombo        Dushanbe       Hong_Kong      Jerusalem      Katmandu       Kuwait         Muscat         Phnom_Penh     Rangoon        Shanghai       Tehran         Ujung_Pandang  Vladivostok
Aqtobe         Baku           Calcutta       Dacca          Famagusta      Hovd           Kabul          Khandyga       Macao          Nicosia        Pontianak      Riyadh         Singapore      Tel_Aviv       Ulaanbaatar    Yakutsk
```

</details>

<details>
<summary>日本時間へ変更</summary>

``` docker container
/ # cp usr/share/zoneinfo/Asia/Tokyo etc/localtime
```

</details>

<details>
<summary>date確認</summary>

``` docker container
/ # date
Tue May 17 08:07:25 JST 2022
```

</details>

### 日本語入力はできる

<details>
<summary>vimでtest.txtを作成・編集</summary>

``` docker container
/ # cd
~ # vim test.txt
~ # cat test.txt
あいうえお
かきくけこ
さしすせそ
たちつてと
なにぬねの
はひふへほ
まみむめも
やゆよ
らりるれろ
わをん
```

</details>

### 新規ユーザー追加

<details>
<summary>doasをインストール</summary>

[doas](https://wiki.archlinux.jp/index.php/Doas)

``` docker container
/ # apk add doas
(1/1) Installing doas (6.8.1-r7)
Executing doas-6.8.1-r7.post-install
 * Your configuration in /etc/doas.conf was migrated to
 * /etc/doas.d/doas.conf and a symlink was installed in its
 * place.  For more information about the new doas configuration
 * directory, consult doas.d(5).
Executing busybox-1.34.1-r5.trigger
OK: 9 MiB in 16 packages
```

</details>

<details>
<summary>/etc/doas.d/doas.confの中身</summary>

``` docker container /etc/doas.d/doas.conf
# This file is actually located at /etc/doas.d/doas.conf, and reflects
# the system doas configuration.  It may have been migrated from its
# previous location, /etc/doas.conf, automatically.
```

</details>

<details>
<summary>doasの設定</summary>

``` docker container
echo -e "permit nopass :wheel\npermit nopass :wheel as root cmd /usr/bin/*\n" >> /etc/doas.d/doas.conf && \
chown -c root:root /etc/doas.d/doas.conf && \
chmod -c 0400 /etc/doas.d/doas.conf && \
doas -C /etc/doas.d/doas.conf && echo "config ok" || echo "config error"
config ok
```

</details>

<details>
<summary>adduserコマンドヘルプ</summary>

``` docker container
/ # adduser --help
BusyBox v1.34.1 (2022-04-04 10:19:27 UTC) multi-call binary.

Usage: adduser [OPTIONS] USER [GROUP]

Create new user, or add USER to GROUP

        -h DIR          Home directory
        -g GECOS        GECOS field
        -s SHELL        Login shell
        -G GRP          Group
        -S              Create a system user
        -D              Don't assign a password
        -H              Don't create home directory
        -u UID          User id
        -k SKEL         Skeleton directory (/etc/skel)
```

</details>

<details>
<summary>adduserでユーザー追加</summary>

``` docker container
USER=docker_alpine
UID=1000

adduser \
    -D \
    -S \
    -s /bin/sh \
    -u $UID \
    -G wheel \
    -g $USER \
    $USER
su $USER
whoami
```

</details>

<details>
<summary>作成した新規ユーザーでログイン</summary>

``` docker container
/ # exit

# PowerShell
$ docker exec -it -u [new_username] alpine sh
/ $
```

</details>


## Dockerfile / docker build

<details>
<summary>Dockerfileの中身</summary>


``` Dockerfile
FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add tzdata vim doas && \
    cp usr/share/zoneinfo/Asia/Tokyo etc/localtime && \
    echo -e "permit nopass :wheel\npermit nopass :wheel as root cmd /usr/bin/*\n" >> /etc/doas.d/doas.conf && \
    chown -c root:root /etc/doas.d/doas.conf && \
    chmod -c 0400 /etc/doas.d/doas.conf && \
    doas -C /etc/doas.d/doas.conf && echo "config ok" || echo "config error" && \
    USER=docker_alpine && UID=1000 && \
    adduser \
        -D \
        -S \
        -s /bin/sh \
        -u $UID \
        -G wheel \
        -g $USER \
        $USER
```

</details>

<details>
<summary>docker buildでimageを作成</summary>

``` PowerShell
$ docker build --no-cache -t enginearn/alpine:latest -f ./Dockerfile .
[+] Building 11.1s (6/6) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                         0.1s 
 => => transferring dockerfile: 638B                                                                                                                                                                                                                                         0.0s 
 => [internal] load .dockerignore                                                                                                                                                                                                                                            0.0s 
 => => transferring context: 2B                                                                                                                                                                                                                                              0.0s 
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                                                                                             0.0s 
 => CACHED [1/2] FROM docker.io/library/alpine:latest                                                                                                                                                                                                                        0.0s 
 => [2/2] RUN apk update && apk upgrade &&     apk add tzdata vim doas                                                                                                                                                                                                       9.0s 
 => exporting to image                                                                                                                                                                                                                                                       1.7s 
 => => exporting layers                                                                                                                                                                                                                                                      1.7s 
 => => writing image sha256:fbcef02be9214dbf1bc641307861437161e0cfc2fe07303a12f7b373dd0957c2                                                                                                                                                                                 0.0s
 => => naming to docker.io/enginearn/alpine:latest
 $ docker images
 REPOSITORY                   TAG         IMAGE ID       CREATED         SIZE  
enginearn/alpine             latest      fbcef02be921   5 minutes ago   39.4MB
```

</details>

<details>
<summary>作成したimageを起動</summary>

``` PowerShell
$ docker run -it -d --name alpine enginearn/alpine
$ docker exec -it -u docker_alpine alpine sh
/ $

```

</details>

<details>
<summary>containerをdocker hubへプッシュ</summary>

まずはdocker hub上でRepositoryを作成しておく

``` PowerShell
$ docker commit 4552f804710d enginearn/alpine-latest-jst
sha256:9f09994f1e07442c4af0dd35bf1b5857ffdbf5af24871c5b64a823324da64bbc
$ docker tag <IMAGE ID> enginearn/alpine-latest-jst
$ docker push enginearn/alpine-latest-jst:latest
he push refers to repository [docker.io/enginearn/alpine-latest-jst]
5f70bf18a086: Mounted from ambassador/telepresence-docker-runtime
6b8a1ccd16ec: Pushed
cc2447e1835a: Mounted from library/alpine
latest: digest: sha256:351f0b586d90825f12f715f7079c24d9a66fde91f708fd557bde5ceca231e676 size: 946

```

</details>

<details>
<summary>docker imageが削除できない時</summary>

``` PowerShell
$ docker rmi -f ee0a3a132b38
Error response from daemon: conflict: unable to delete ee0a3a132b38 (cannot be forced) - image has dependent child images

# docker rmi -f <REPOSITORY>:<TAG>で削除
$ docker rmi -f enginearn/alpine:latest
Untagged: enginearn/alpine:latest
```

</details>

---

## Ref

[alpine linux wiki: 4. Post-Install](https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos#Post-Install)

[alpine linux wiki: Setting up a new user](https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user)

[alpine packages](https://pkgs.alpinelinux.org/packages)

[archlinux: doas](https://wiki.archlinux.jp/index.php/Doas#.E8.A8.AD.E5.AE.9A)

[archlinux: DOAS.CONF(5)](https://man.archlinux.org/man/doas.conf.5)

[ログインできないユーザでコマンドを実行する方法](https://qiita.com/riekure/items/27e07258a5a3ac4bd3fa)

[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

[Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
