# win10 flutter vscode环境搭建
## 下载vscode开发工具
> 直接给下载链接:[vscode下载链接](https://code.visualstudio.com/)
## 下载flutter
> 按照flutter中文网下载安装即可：[flutter中文网](https://flutterchina.club/setup-windows/)
## vscode中安装flutter插件
> 在vscode中，安装插件flutter，安装flutter插件的同时，会自动安装dart插件，无需手动再次安装dart插件
## 安装android emulator
> 我之前是用android studio 开发flutter程序的，android studio太慢，换用vscode,所以本机上有之前通过androidstudio安装的androi模拟器，换用vscode后，每次都要打开androistudio才能启动vscode中的虚拟设备，因此，做了以下简单的处理。
-  查看已经安装的emulator路径
    > 在androidsdk目录C:\androidsdk\emulator\qemu 下存放了我们已经安装的虚拟机;
-  查看已经命名的虚拟机名称
    > 在C:\Users\Administrator\.android\avd下面
- 编写一个runMyEmulator.bat
    > 编写一个bat,里面存放C:\androidsdk\emulator\emulator.exe -netdelay none -netspeed full -avd Pixel_2_API_26，其中Pixel_2_API_26为虚拟机名称；在运行一个vscode fulltter项目之前，先运行一下runMyEmulator.bat,然后就在不打开androidStudio的情况下直接使用vscode开发，查看fluteer应用了！           
-  需要自己手动安装android 模拟器的可以参看此文章！
> [android Emulator](https://blog.csdn.net/huanhuan59/article/details/80281509) 