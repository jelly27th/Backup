# 定时备份使用
1. 修改对应部分路径

   bz是压缩软件路径的变量,Code、Blog这些是要压缩的文件夹路径变量,修改这些变量后面的bz命令相同名称的也要替换,targetPath是备份文件夹的路径的变量, originalPath是检索备份文件夹设置的变量,可以根据实际情况自行更改。

2. 打开cmd,输入taskschd.msc进入任务计划程序面板
3. 创建基本任务,设置好名称、触发器、操作
4. 添加backup.dat路径至你的定时任务中
5. 改变定时任务属性,用户选为SYSTEM,安全选项选不管用户是否登录都要运行和勾选最高权限运行,操作步骤如下图:

![](https://cdn.jsdelivr.net/gh/jelly27th/personal-picture-bed@master/writing/backup/backup.jpg)

第四步不设置每次运行就会弹出cmd窗口,那么我想要的后台静默运行效果就没了。