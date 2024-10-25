# Kill-legacyScreenSaver

ZH:
解决 macOS 屏幕保护程序内存泄漏的bug 

自 macOS 14 Sonoma 以来，屏幕保护程序出现了内存泄漏的问题（详情见以下链接）

具体表现为legacyScreenSaver (Wallpaper) 进程在每次进入屏幕保护程序后都会占用1G以上的内存，多次在我的 32GB 内存的 MacBook Pro (M1 Pro) 触发硬盘虚拟内存写入。
之前有多次反馈问题无果，因此编写一个定时脚本，监控legacyScreenSaver (Wallpaper)进程的内存用量，并在超过限额后杀掉该进程。
目前没有发现强制结束legacyScreenSaver (Wallpaper)进程会导致系统崩溃等不良影响。

此脚本在Chatgpt的帮助下完成。

EN:
Resolve macOS screensaver memory leak bugs

Screensaver has had a memory leak since macOS 14 Sonoma (see link below for details)
https://discussions.apple.com/thread/255256761?sortBy=rank
https://discussionschinese.apple.com/thread/255193067?sortBy=rank

Specifically, the legacyScreenSaver (Wallpaper) process takes up over 1G of memory after each screen saver entry, repeatedly triggering a hard disk Swap memory write on my 32GB RAM MacBook Pro (M1 Pro).

Having previously fed back on the problem several times to no avail, I wrote a timed script that monitors the memory usage of the legacyScreenSaver (Wallpaper) process and kills the process when it exceeds its limit.

No adverse effects such as system crashes have been found as a result of forcing the legacyScreenSaver (Wallpaper) process to end.

This script is done with the help of Chatgpt.

详情链接 Link to more details：
https://discussions.apple.com/thread/255256761?sortBy=rank
https://discussionschinese.apple.com/thread/255193067?sortBy=rank
