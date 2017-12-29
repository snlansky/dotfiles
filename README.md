dotfiles
========

Dotfiles of my development environment. Working with Linux.

Deploy
------

The deployment will overwrite your configuration file, be sure to backup your existing configuration.

*   i3wm:

    ```
    $ ./deploy/i3wm.sh
    ```

*   zsh:

    ```
    $ ./deploy/zsh.sh && . ~/.zshrc
    ```

*   tmux:

    ```
    $ ./deploy/tmux.sh
    ```

Table Of Contents
-----------------

* [i3wm](#i3wm)
* [zsh](#zsh)
* [tmux](#tmux)

i3wm
----

> $mod => `Win`

常用

| key                | description |
|:-------------------|:------------|
| `$mod + Return`    | 启动终端 |
| `$mod + d`         | 启动 dmenu 程序启动器 |
| `$mod + q`         | 关闭窗口 |
| `$mod + z`         | 锁屏 |
| `$mod + Shift + c` | 重新加载配置文件 |
| `$mod + Shift + r` | 重新启动 |
| `$mod + Shift + e` | 退出 |

工作区

| key                  | description |
|:---------------------|:------------|
| `$mod + <n>`         | 焦点移动到第 n 个工作区 |
| `$mod + Shift + <n>` | 将当前焦点所在窗口移动到第 n 个工作区 |

窗口

| key                | description |
|:-------------------|:------------|
| `$mod + h`         | 焦点向左移动 |
| `$mod + l`         | 焦点向右移动 |
| `$mod + j`         | 焦点向下移动 |
| `$mod + k`         | 焦点向上移动 |
| `$mod + Shift + h` | 将当前焦点所在窗口向左移动 |
| `$mod + Shift + l` | 将当前焦点所在窗口向右移动 |
| `$mod + Shift + j` | 将当前焦点所在窗口向下移动 |
| `$mod + Shift + k` | 将当前焦点所在窗口向上移动 |

父子

| key        | description |
|:-----------|:------------|
| `$mod + a` | 焦点移动到父级容器 |
| `$mod + c` | 焦点移动到子级容器 |

分割

| key        | description |
|:-----------|:------------|
| `$mod + m` | 水平分割 |
| `$mod + n` | 垂直分割 |

布局

| key        | description |
|:-----------|:------------|
| `$mod + s` | 堆叠 |
| `$mod + w` | 标签 |
| `$mod + e` | 分割 |

浮动

| key                    | description |
|:-----------------------|:------------|
| `$mod + f`             | 全屏 |
| `$mod + space`         | 浮动/取消浮动 |
| `$mod + Shift + space` | 焦点在浮动窗口和平铺窗口间移动 |

调整大小

| key              | description |
|:-----------------|:------------|
| `$mod + r`       | 进入 resize 模式（调整大小） |
| resize: `h`      | 减小宽度 |
| resize: `l`      | 增大宽度 |
| resize: `j`      | 减小高度 |
| resize: `k`      | 增大高度 |
| resize: `Escape` | 退出 resize 模式（返回到 default 模式） |

zsh
----

常用命令

| command     | description |
|:------------|:------------|
| `alias`     | 查看别名列表 |
| `zsh_stats` | 查看使用最频繁的命令 |

常用脚本

| command       | description      |
|:--------------|:-----------------|
| `todo`        | 添加待办事项 |
| `ok`          | 完成待办事项 |
| `x`           | 解压 |
| `fs`          | 输出当前目录文件大小 |
| `fbi-warning` | 输出 FBI WARNING |

tmux
----

> prefix => `Ctrl-s`

客户端（client）

| key        | description |
|:-----------|:------------|
| `prefix D` | 选择并挂起一个客户端 |
| `prefix d` | 挂起当前客户端 |

会话（session）

| key        | description |
|:-----------|:------------|
| `prefix s` | 选择会话 |
| `prefix $` | 重命名会话 |
| `prefix L` | 切换到最近选择的会话 |
| `prefix (` | 切换到上一个窗口 |
| `prefix )` | 切换到下一个窗口 |

窗口（window）

| key          | description |
|:-------------|:------------|
| `prefix w`   | 选择窗口 |
| `prefix <n>` | 选择第 n 个窗口 |
| `prefix c`   | 新建窗口 |
| `prefix ,`   | 重命名窗口 |
| `prefix l`   | 切换到最近选择的窗口 |
| `prefix p`   | 切换到上一个窗口 |
| `prefix n`   | 切换到下一个窗口 |
| `prefix &`   | 关闭当前窗口 |

窗格（pane）

| key                     | description |
|:------------------------|:------------|
| `prefix │`              | 左右分割 |
| `prefix _`              | 上下分割 |
| `prefix k,j,h,l`        | 上下左右切换窗格 |
| `Ctrl + k,j,h,l`        | 上下左右切换窗格 |
| `prefix Ctrl + k,j,h,l` | 上下左右调整窗格大小 |
| `prefix o`              | 切换到下一个窗格 |
| `prefix z`              | 最大化/取消最大化当前窗格 |
| `prefix x`              | 关闭当前窗格 |
| `prefix !`              | 将当前窗格弹出当前窗口 |

复制模式（copy mode）

| key                       | description |
|:--------------------------|:------------|
| `prefix Ctrl + u`         | 进入复制模式 |
| `prefix PageUp, PageDown` | 进入复制模式，上下翻页 |
| copy-mode: `v`            | 选择内容 |
| copy-mode: `y`            | 复制 |
| `prefix p`                | 粘贴 |

插件：[tpm](https://github.com/tmux-plugins/tpm)
> 作用：插件管理

| key                | description |
|:-------------------|:------------|
| `prefix + I`       | 安装插件 |
| `prefix + U`       | 更新插件 |
| `prefix + alt + u` | 卸载插件 |

插件：[resurrect](https://github.com/tmux-plugins/tmux-resurrect)
> 作用：保存和恢复快照

| key               | description |
|:------------------|:------------|
| `prefix + Ctrl-s` | 保存快照 |
| `prefix + Ctrl-r` | 恢复 |

Tool Box
=========

*   [systemd](https://github.com/systemd/systemd)
*   [i3](https://github.com/i3/i3)
*   [dmenu](https://github.com/michaelforney/dmenu)
*   [zsh](https://github.com/zsh-users/zsh)
*   [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
*   [tmux](https://github.com/tmux/tmux)
*   [vim](https://github.com/vim/vim)
*   [ctags](https://sourceforge.net/projects/ctags/)
*   [git](https://github.com/git/git)
*   [git-extras](https://github.com/tj/git-extras)
*   [autojump](https://github.com/wting/autojump)
*   [ack](https://github.com/beyondgrep/ack2)
*   [zeal](https://github.com/zealdocs/zeal)
*   [thefuck](https://github.com/nvbn/thefuck)
*   [ss-qt5](https://github.com/shadowsocks/shadowsocks-qt5)
*   [polipo](https://github.com/jech/polipo)
*   [ksnapshot](https://github.com/KDE/ksnapshot)
*   [transmission](https://github.com/transmission/transmission)
*   [vlc](https://github.com/videolan/vlc)
*   [mycli](https://github.com/dbcli/mycli)
*   [ansible](https://github.com/ansible/ansible)
*   [docker-compose](https://github.com/docker/compose)
*   [docker](https://github.com/docker/docker-ce)
    *   [syncthing](https://github.com/syncthing/syncthing)
    *   [nginx](https://github.com/nginx/nginx)
    *   [mysql](https://github.com/mysql/mysql-server)
    *   [mongo](https://github.com/mongodb/mongo)
    *   [redis](https://github.com/antirez/redis)
*   [nvm](https://github.com/creationix/nvm)
    *   [http-server](https://github.com/indexzero/http-server)
    *   [tldr](https://github.com/tldr-pages/tldr)
*   [gvm](https://github.com/moovweb/gvm)
    *   [skm](https://github.com/TimothyYe/skm)
    *   [croc](https://github.com/schollz/croc)
    *   [geth](https://github.com/ethereum/go-ethereum)
    *   [dep](https://github.com/golang/dep)
    *   [delve](https://github.com/derekparker/delve)
    *   [lf](https://github.com/gokcehan/lf)
    *   [s](https://github.com/zquestz/s)
    *   [gops](https://github.com/google/gops)

