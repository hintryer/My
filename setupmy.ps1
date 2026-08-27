# setup-my-env.ps1

# 安装My常用工具
scoop install My/7zip
scoop install My/Git
scoop install My/Aria2
scoop config aria2-warning-enabled false
scoop install My/Steamcommunity
scoop install My/EmEditor
scoop install My/Bili23downloader
scoop install My/Lanzouyun
scoop install My/LocalSend
scoop install My/Notepad4
scoop install My/UMI-OCR
scoop install My/GeekUninstaller
scoop install My/Chrome-Plus
scoop install My/Chrome
scoop install My/Mp3tag
scoop install My/FFmpeg
scoop install My/Nomo
scoop install My/KillerPDF

scoop install My/Clash-Verge-Rev
scoop install My/FSViewer
reg import "D:\Scoop\apps\vscode\current\install-context.reg"
scoop install My/Typora
scoop install Typora_Plugin

scoop install My/lx-music-desktop
scoop install My/VSCode
scoop install My/yt-dlp
scoop install My/SciTE

# 清理旧版本
scoop cleanup *

Write-Host "环境配置完成！"

scoop install My/Notepad4
reg import "D:\Scoop\apps\Notepad4\current\install-context.reg"

 scoop uninstall Typora_Plugin
 scoop install Typora_Plugin
 
scoop uninstall Typora
scoop install my/Typora
 