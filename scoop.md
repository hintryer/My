# Scoop 安装、使用与卸载

## Scoop 安装

### 一键脚本

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$env:SCOOP='D:\scoop' 
[Environment]::SetEnvironmentVariable('USERSCOOP', $env:SCOOP, 'User')
# $env:SCOOP_GLOBAL='D:\scoop' 
# [Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
irm get.scoop.sh | iex
scoop bucket rm main
scoop bucket add main https://mirror.nju.edu.cn/git/scoop-main.git

scoop bucket rm extras
scoop bucket add extras https://mirror.nju.edu.cn/git/scoop-extras.git
```

### 允许运行本地脚本执行命令（仅当前用户生效，安全）

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 修改默认安装路径

```powershell
$env:SCOOP='D:\scoop' 
[Environment]::SetEnvironmentVariable('USERSCOOP', $env:SCOOP, 'User')
```

### 安装 Scoop

```powershell
irm get.scoop.sh | iex
```

### 配置 bucket

```powershell
scoop bucket rm main
scoop bucket add main https://mirror.nju.edu.cn/git/scoop-main.git

scoop bucket rm extras
scoop bucket add extras https://mirror.nju.edu.cn/git/scoop-extras.git
```

## Scoop 卸载

### 卸载所有软件

```powershell
scoop list | ForEach-Object { scoop uninstall $_.Name }
```

```powershell
scoop uninstall scoop
```

## Scoop 恢复

### 一键脚本（保留 D:\scoop）

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
$env:SCOOP="D:\scoop"
[Environment]::SetEnvironmentVariable("SCOOP","D:\scoop","User")
$shim = Join-Path $env:SCOOP "shims"
$p = [Environment]::GetEnvironmentVariable("PATH","User")
if (-not $p.Contains($shim)) {
  [Environment]::SetEnvironmentVariable("PATH","$p;$shim","User")
}
. "$env:SCOOP\apps\scoop\current\lib\core.ps1"
scoop reset *
scoop update
scoop checkup
```

## Scoop安装软件

```powershell
scoop install My/7zip
scoop install My/Git
scoop install My/Aria2
scoop config aria2-warning-enabled false
scoop install My/Steamcommunity
scoop install My/Karing
scoop install My/GeekUninstaller
scoop install My/Chrome-Plus     
scoop install My/Chrome   
scoop install My/EmEditor      
scoop install My/Bili23downloader
scoop install My/KillerPDF
scoop install My/Linux.do-Accelerator
scoop install My/LocalSend
scoop install My/Notepad4
scoop install My/Nomo
scoop install My/UMI-OCR
scoop install My/Typora
scoop install My/Typora_Plugin
scoop install My/Mp3tage
scoop install My/FFmpeg
scoop install My/lx-music-desktop
scoop install My/VSCode

```

## Scoop 常用命令

```powershell
Usage: scoop <command> [<args>]  
  
Some useful commands are:  
  
alias       Manage scoop aliases # 管理指令的替身  
bucket      Manage Scoop buckets # 管理软件仓库  
cache       Show or clear the download cache # 查看与管理缓存  
checkup     Check for potential problems # 做个体检  
cleanup     Cleanup apps by removing old versions # 清理缓存与旧版本软件包  
config      Get or set configuration values # 配置Scoop  
create      Create a custom app manifest # 创建自定义软件包  
depends     List dependencies for an app # 查看依赖  
export      Exports (an importable) list of installed apps # 导出软件包列表  
help        Show help for a command # 显示帮助指令  
hold        Hold an app to disable updates # 禁止软件包更新  
home        Opens the app homepage # 打开软件包主页  
info        Display information about an app # 显示软件包信息  
install     Install apps # 安装软件包的指令  
list        List installed apps # 列出所有已安装软件包  
prefix      Returns the path to the specified app # 查看软件包路径  
reset       Reset an app to resolve conflicts # 恢复软件包版本  
search      Search available apps # 搜索软件包  
status      Show status and check for new app versions # 查看软件包更新状态  
unhold      Unhold an app to enable updates # 启动软件包更新  
uninstall   Uninstall an app # 卸载软件包的指令  
update      Update apps, or Scoop itself # 更新软件包  
virustotal  Look for app hash on virustotal.com # 查看哈希值  
which       Locate a shim/executable (similar to 'which' on Linux) # 查看可执行程序路径
```

## Scoop 问题

### 任务栏点击软件、出现第二个图标：完整解决

根本原因是你固定到任务栏的是 shim 垫片脚本（`shims\xxx.ps1` / `shim.exe`），Windows 识别启动程序是 PowerShell / 垫片进程；垫片中转启动真实 exe 主程序，进程父进程不同、AppID 不一致，系统判定为两个程序，就会新开图标。

解决方法

1. 先打开软件，窗口正常运行。
2. 右键任务栏已经打开的软件窗口图标 → 选择“固定到任务栏”。

### 取消以管理员身份运行 PowerShell

1. 打开“本地安全策略”，或按 `Win + R`，运行：

   ```powershell
   secpol.msc
   ```

2. 展开 **本地策略 → 安全选项**。找到并双击：   **用户帐户控制：以管理员批准模式运行所有管理员**

3. 将 **本地安全设置** 修改为：**已禁用**。
