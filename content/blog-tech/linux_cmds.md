---
title: Linux Commands
description:
date: 2022-07-25
tags: ["linux"]
---
## Chapter 1

```
set|grep PS1  
```

| 快捷键                 | 功能说明                                                     |
| ---------------------- | ------------------------------------------------------------ |
| 最有用快捷键           |                                                              |
| tab                    | 命令或路径等的补全键，Linux最有用快捷键*                     |
| 移动光标快捷键         |                                                              |
| Ctrl+a                 | 光标回到命令行首*                                            |
| Ctrl+e                 | 光标回到命令行尾*                                            |
| Ctrl+f                 | 光标向右移动一个字符（相当于方向键右键）                     |
| Ctrl+b                 | 光标向左移动一个字符（相当于方向键左键）                     |
| 剪切、粘贴、清除快捷键 |                                                              |
| Ctrl+Insert            | 复制命令行内容*                                              |
| Shift+Insert           | 粘贴命令行内容*                                              |
| Ctrl+k                 | 剪切（删除）光标处到行尾的字符*                              |
| Ctrl+u                 | 剪切（删除）光标处到行首的字符*                              |
| Ctrl+w                 | 剪切（删除）光标前的一个单词                                 |
| Ctrl+y                 | 粘贴Ctrl+u，Ctrl+k，Ctrl+w删除的文本                         |
| Ctrl+c                 | 中断终端正在执行的任务或者删除整行*                          |
| Ctrl+h                 | 删除光标所在处的前一个字符（相当于退格键）                   |
| 重复执行命令快捷键     |                                                              |
| Ctrl+d                 | 退出当前Shell命令行*                                         |
| Ctrl+r                 | 搜索命令行使用过的历史命令记录*                              |
| Ctrl+g                 | 从执行Ctrl+r的搜索历史命令模式退出                           |
| Esc+.(点)              | 获取上一条命令的最后的部分（空格分隔）*                      |
| 控制快捷键             |                                                              |
| Ctrl+l                 | 清除屏幕所有内容，并在屏幕最上面开始一个新行，等同clear命令* |
| Ctrl+s                 | 锁定终端，使之无法输入内容                                   |
| Ctrl+q                 | 解锁执行Ctrl+s的锁定状态                                     |
| Ctrl+z                 | 暂停执行在终端运行的任务*                                    |
| !号开头的快捷命令      |                                                              |
| !!                     | 执行上一条命令                                               |
| !pw                    | 执行最近以pw开头的命令*                                      |
| !pw:p                  | 仅打印最近pw开头的命令，但不执行                             |
| !num                   | 执行历史命令列表的第num(数字)条命令*                         |
| !$                     | 上一条命令的最后一个参数，相当于Esc+.(点)                    |
| ESC相关                |                                                              |
| Esc+.(点)              | 获取上一条命令的最后的部分（空格分隔）*                      |
| Esc+b                  | 移动到当前单词的开头                                         |
| Esc+f                  | 移动到当前单词的结尾                                         |
| Esc+t                  | 颠倒光标所在处及其相邻单词的位置                             |

```
man 参数选项 命令/文件
help   bash命令
info ls

shutdown [Option]... TIME [Message]
	shutdown -h now
	shutdown -h +1
	shutdown -r 11:00
	halt
	poweroff
	reboot
	init 0
	init 6
	logout
	exit
```

## Chapter 2

```
pwd: show current dir
cd: switch dir
tree: display content
	tree -F 显示特殊的符号
	tree -d 只显示目录
mkdir: create folder
	mkdir -p 递归创建目录
touch: create blank file, change the time
ls:
	ls -l    or   ll
	ls -a 显示隐藏文件
	ls -t 按最后修改时间排序
	ls -r 按照相反的次序排序
	ls -F 加上特殊符号
	ls -d 查看目录本身的信息
	ls -h 人类可读文件或目录大小
	ls --time-style=long-iso
	ls -lrt
cp:
	cp -r 递归复制
	cp -a 不知道用处
mv
rm: 
	rm -f 强制删除
	rm -r 递归删除
rmdir
ln: 
	ln 硬链接
	ln -s 软连接（快捷方式）
	ll -hi 查看链接
readlink
find: 查找目录下的文件
	find [-H] [-L] [-P] [-D debugpots] [-Olevel] [pathname] [expression]
	-maxdepth levels 最大目录级数
	-mtime [-n|n|+n] -n 是n天以内修改时间
	-atime 访问时间
	-name 只支持特殊通配符 如 * ? []
	-type 某一类型的文件 d目录 
	-exec
	! 取反
	-a 交集
	-o 并集
	find . -atime -2
	find /data/ -mtime -5
	find /var/log/ -mtime +5 -name '*.log'
	find . ! -type d
	find /data/ -perm 755
	find . -size +1000c
	find /data -path '/data/dir3' [-a] -prune -o -print
	find /data \( -path /data/dir2 -o -path /data/dir3 \) -prune -o -print
	find . -nouser
	find . -newer file1.txt ! -newer file2.txt
	find . -maxdepth 1 -type d ! -name '.' -o -name 'oldboy'
	find / -regex '.*/find'
    find . -type f -exec ls -ls {} \;
    find . -mtime +15 -exec rm {} \;
    find . -type f|xargs ls -l;
    find . -name '*.txt' | xargs -i mv {} dir2/
xargs: 将标准输入转换为命令行参数
	-n 每行最大参数量n，默认空格分割
	-i 用 {} 代替前面的结果
	xargs < test.txt
	xargs -n 3 < test.txt
	echo splitXsplitXsplitXsplitX|xargs -d X -n 2
	find . -type f -name '*.txt' -print0 | xargs -0 rm -f
rename
	rename .jpg .oldboy *.jpg
basename
dirname
chattr
lasttr
file
md5sum
	md5sum oldboy.txt >md5.log
	md5sum -c md5.log
	echo 'oldboy'>oldboy.txt
    md5sum --status -c md5.log
    echo $?
chown
chmod
chgrp
umask
```

## Chapter 3

```
cat 合并文件或者查看文件内容
	cat file1.txt
	cat file1.txt file2.txt > newfile.txt
	cat >file1.txt
	cat >>file1.txt<<EOF
	abcdefg
	EOF
	cat /dev/null >file1.txt
	-n 显示行编号
	-b 显示行编号并且忽略空行
tac
	每行不动，最后一行变成第一行
more 分页显示文件内容
	+num 从num行开始显示
less
	-N 显示行号
	查看交互式命令文档
	less is more
head
	head -n 20 
tail
	tail -n
	tail -f 实时输出文件变化后追加的数据
tailf
	几乎等同于 tail -f 但是更好
cut
	-c 以字符为单位分割
	-d 自定义分隔符
	-f 与-d一起使用，指定显示哪个区域
	N 第N个字节，字符，字段
	N- 从第N个一直到行尾
	N-M （含M）
	-M （含M）
	cut -d : -f 3-5 /etx/passwd
split
	-l 每几行分一次
	-a 后缀长度
	-d 数字后缀
	split -l 10 inittab new_
	split -l 10 -a 3 inittab new2_
	split -l 10 -d inittab num_
	split -b 500K -d lvm lvm_
paste
	-d 制定分隔符
	-s 每个文件占用一行
	paste -s test.txt
	paste -sd '=/n' test.txt
	paste -d '=' - - < test.txt
sort
	文本排序
	-n 按照数值大小排序
	-r 倒序
	-t 制定分隔符
	-k 指定区间排序
	-u 去除重复行
	sort oldboy.txt
	sort -t ' ' -k2 oldboy1.txt
	sort -n -t. -k3,3 -k4.1,4.3 arp.txt
join 排序后合并文件
uniq 只能处理相邻的重复行
	-c 计算重复行次数
	-d 只显示重复行
	-u 只显示唯一的行
wc
	-c 字节数
	-l 行数
	-w 单词数
	无参数即 行数+单词数+字符数
	-L 最长行长度
iconv
	touch 2.txt;iconv -f gbk -t utf-8 -o 2.txt 1.txt
dos2unix
diff
	两个文件之间的区别/目录之间的区别￥￥ 参数比较神奇 -u / -y -W 20
vimdiff
rev
	行的顺序不变，每行颠倒过来了
tr
	替换或者删除字符没有串，-d 删除， -s 保留第一个删除剩下的， -c 使用补集
	tr '[a-z]' '[A-Z]' <
	tr -d '\n\t' < 
od
	可以用来查看二进制文件
tee
	标准输出的同时写入（覆盖）文件 ls | tee ls.txt 
	-a 追加而不覆盖
```

## Chapter 4

```
grep: 文本过滤工具
	-v 显示不匹配的行
	-n 显示匹配行和行号
	-i 单字符不区分大小写
	-c 只统计匹配的行数，不是次数
	-E 使用扩展的egrep命令
	--color=auto
	-w 只匹配过滤的单词
	-o 只输出匹配的内容
	grep -Ev "^$|#" nginx.conf 过滤空行和注释行
```

```
sed: 字符流编辑器
	-n 取消默认输出
	-i 直接修改文件内容
	a 追加文本
	d 删除匹配行的文本
	i 插入文本
	p 打印匹配行内容
	sed '2a 106,babakdj\nflad,sdf,sdfa' persons.txt
	sed '2,5d' persons.txt
	sed 's#zhangyao#dandan#g persons.txt
	sed -n '2,4p' persons.txt
```

```
awk: linux最强大的文本处理工具
	-F 指定字段分隔符
	-v 定义或者修改一个awk内部的变量
	用处：制定分隔符显示某几列；通过正则表达式取出你想要的内容；显示出某个范围的内容；通过awk进行统计计算；awk数组计算与去重
	
	awk 'NR=5' oldboy.txt 取出第五行
	awk 'NR=2,NR=6' 取出2-6行
	awk '{print NR,$0}' oldboy.txt 每行显示行号
	awk ’NR=2,NR=6 {print NR,$0}‘ oldboy.txt
	awk -F ":" '{print $1,$3,$NF}' oldboy,txt
	awk '{gsub("/sbin/nologin","/bin/bash",$0);print $0}' oldboy.txt 替换功能
	awk "(addr:)|{  Bcast:}" 'NR==2{print $2}'
	awk -F "[ :]+" 'NR==2{print $4}' 使用冒号和空格作为分隔符，多个分隔符连续视为一个分隔符
	awk -F '/' '{hotel[$3]++;print $3,hotel[$3]}' oldgirl.txt 使用awk创建一个叫做hotel的数组
	
```

## Chapter 5

```
uname: display system info
	have options 
	-a all info
	-n internet node hostname
	-r kernel release
hostname: 
	-i display IP address, with DNS
	-I display IP address, without DNS, recommend
	直接写需要改成的临时主机名，登录生效，重启失效
dmesg:
	dmesg|less 查看硬件故障，环形缓冲区
stat: 
	stat -c %a shadowsocks.json
	可以通过-c加上对应的%。来取出文件某个特定的信息，比文字处理更好用
du: 
	du -sh /ust/local/
	-s 总大小
	-h 以人类可读模式显示大小
	--max-depth=2
date:
	-d 时间字符串 显示字符串描述的时间
	-s 日期时间 设置系统时间
	date +%F -d "-1day" 显示昨天
	date -d "Thu Jul 6 21:41:16 CST 2017" "+%Y-%m-%d %H:%M:%S"
	date +%T%n%D
echo: 显示一行文本
	-n 不要自动换行
	-e 特殊处理字符，如
		\'
		\n
		\f
	echo hello world >>echo.txt
	echo $PATH
watch
which: 显示命令的全路径
	-a 显示左右匹配而不是默认的第一个
locate:
	locate pwd
	locate -c pwd
	locate /etc/sh
	locate /etc/sh*
updatedb
```

## Chapter 6

``` 
tar:
	z 通过gzip压缩和解压
	c 创建新的tar包
	v 显示详细的过程
	f 指定压缩文件的名字
	t 不解压查看包中的内容
	x 解开tar包
	C 指定解压的目录
	--exclude=PATTERN 打包时排除的文件和目录
	-h 打包软连接文件指向的真实源文件
	
	tar zcvf www.tar.gz ./html/
	tar ztvf www.tar.gz
	tar zxvf www.tar.gz -C /tmp/
gzip: 先用tar打包成一个文件，再使用gzip将其变小
	-d 解开压缩文件
	-c 内容输出到标准输出，不改变原始文件
	gzip *.html
	gzip -l *.gz
	gzip -dv *.gz
	gzip -dc services.gz >services2
	zcat, zgrep, zless, zdiff
zip: 
	-r 将指定目录下面的所有文件和子目录一并压缩
	-x 排除某个文件
	zip services.zip ./services
unzip: 
	-l 不解压显示压缩包内容
	-d 解压至指定目录
scp: 
	-P port 指定传输的端口号
	-p 传输后保留文件原始属性
	-r 递归复制整个目录
	scp -rp /tmp 10.0.0.9:/tmp/ 从本地往上传输
	scp -rp 10.0.0.9:/tmp/ .  往下复制到本地
rsync:
	rsync [options] [SRC] [DEST] 本地模式
	rsync [options] [USER@]HOST:SRC [DEST] 远程shell访问模式拉取Pull
	rsync [options] [SRC] [USER@]HOST:DEST 远程shell访问模式推送Push
	rsync [options] [USER@]HOST::SRC [DEST] rsync守护进程模式Pull
	rsync [options] rsync://[USER@]HOST[:PORT]/SRC [DEST] rsync守护进程模式Pull
	rsync [options] SRC [USER@]HOST::DEST rsync守护进程模式Push
	rsync [options] SRC rsync://[USER@]HOST[:PORT]/DEST rsync守护进程模式Push
	-v 显示传输进度
	-z 压缩传输以提高效率
	-a 递归方式传输文件并且保留所有文件属性
	-r 递归传输文件
	快速删除目录下的几十万个文件的方法：
	rsync -av --delete /null/ /tmp/
	rsync -av -e 'ssh -p 22' /tmp 10.0.0.9:/tmp/ 借助SSH加密传输
```

## Chapter 7

```
useradd:
	不加 -D
	-g initial_group 指定对应的用户组
	-s shell 用户登录之后使用的shell名称
	-u uid 用户的ID值，必须非负唯一
	加上 -D
	用来修改默认值，/etc/default/useradd
usermod:
userdel:
	userdel -r zuma 删除一切有关文件
groupadd
groupdel
passwd: 修改用户密码
	--stdin 从标准输入读取密码字符串（Ubuntu和debian没有）
	echo "123456"|passwd --stdin oldgirl
	passwd -n 7 -x 60 -w 10 -i 30 oldgirl 要求7天内不能更改密码，60天后必须更改密码，过期前10天通知用户，过期后30天禁止用户登录。
	echo stu{01..10}|tr " " "\n" | sed -r 's#(.*)#useradd \1; pass=$((RANDOM+10000000)); echo "$pass"|passwd --stdin \1; echo -e "\1 `echo "$pass"`">>/home/darwin/oldboy.log#g'|bash
chage: 查看修改用户密码的有效期
	chage -l 显示账号有效期的信息
	chage -E 2018-12-31 oldboy 设定账户密码过期时间
chpasswd: 
	-e 使用加密的密码
	echo stu{01..10}|xargs -n 1 useradd
	echo stu{01..10}:$((RANDOM+10000000))|tr " " "\n" >pass.txt
	chpasswd < pass.txt
su: 切换用户
	su - root 这样能够切换环境变量（用户初始化）
	su - oldboy -c '/bin/sh /service/scripts/deploy.sh'
visudo: 编辑/etc/sudoers文件
sudo:
	sudo -l 列出可执行的命令（sudoers文件）
id: 
	-g 用户组id
	-u 用户id
	-r 实际id
	-n 显示名称而非数字
w: 显示已登录用户的信息
who: 显示已登录用户信息
	who -a 显示所有信息
	who -H 显示标题
	who -b 显示启动时间
	名称 【状态】 线路 时间 【活动】 【进程标识】 （主机名）
users 显示已登录用户
whoami 显示当前登录的用户名
last 显示用户登录列表
	last -10 显示10行
lastb 显示用户登录失败的记录
lastlog 显示所有用户的最近登录记录
```

## Chapter 8

```
fdisk: 磁盘分区工具
	小于2TB
	-l 显示所有磁盘分区的信息
partprobe: 更新内核中的硬盘分区表数据
	最好加上具体的磁盘，例
	partprobe /dev/sdb
tune2fs: 可以调整开机自检的周期
	tune2fs -c 40 /dev/sda1 挂载40次自检 0则是关闭
	tune2fs -i 10 /dev/sda1 每十天检查一次 0是关闭
	tune2fs -l /dev/sda1 查看状态
parted:
	-l 查看信息
	直接输入则进入交互式分区
	也可以非交互式
mkfs: 
	-t 指定要创建的文件系统类型
	-b 显示详细信息
	mkfs -t ext4 -v /dev/sdb
	mkfs.ext4 /dev/sdb
dumpe2fs: 导出文件系统信息
	dumpe2fs /dev/sda1|egrep -i 'inode size|inode count|block size|block count'
resize2fs
fsck: 检查并修复Linux文件系统
	注意1，文件系统必须是卸载状态；2，不要对正常的分区进行fsck
dd: 转换或复制文件
	if=<输入文件> 从指定文件中读取
	of=<输出文件> 写入到指定文件
	bs=<字节数> 一次读写的字节数
	count=<块数> 指定block块的个数
	dd if=/dev/sda1 of=dev_sda1.img
	dd if=/dev/cdrom of=C.iso
	dd if=test.txt conv=ucase of=test.txt_u 小写转换为大写
mount: 挂载文件系统
	-l 显示已经挂载的信息
	-a 根据/etc/fstab挂载
	-t 指定挂载的文件系统类型
	-o 可接选项
	-r 只读挂载
	-w 读写挂载
	async 异步处理，性能高，可靠性低
	sync 同步处理，相反
	noatime 不改变inode时间，提升性能
	nodiratime 不改变目录inode时间，提升性能
	defaults
	exec 允许执行二进制程序
	noexec 不允许执行二进制程序
	nosuid 不允许suid生效
	nouser 禁止普通用户挂载该文件系统
	remount 重新挂载一个已经挂载的文件系统
	ro 只读挂载
	rw 读写挂载
	
	mount -o remount,rw /
umount:
	umount -lf /mnt/ 强制卸载
df: 显示文件系统磁盘空间的使用情况
	-a 显示所有文件系统
	-h 以容易理解的格式显示
	-i 显示inode信息
	-T 列出文件系统的类型
	-t 显示指定类型的磁盘
mkswap: 创建交换分区
	-f 强制
swapon: 激活交换分区
	-s 显示所有交换分区的信息
swapoff: 关闭交换分区
	-a 关闭所有交换分区
sync: 刷新文件系统缓冲区	
```

xargs与|的区别

## Chapter 9

```
ps: 查看进程
	a 显示与终端有关的所有进程，包含每个进程的完整路径
	x 显示与终端无关的所有进程
	u 显示进程的用户信息
	-e 显示所有进程
	-f 额外显示UID PPID C 与 STIME 栏位
	f 显示进程树
	-l 显示详细格式
	PID 进程的标识号
	PPID 进程的父进程的标识号
	TTY 终端控制台
	C CPU使用的百分比
	STIME 进程开始时间
	ps -ef|grep ssh
	ps aux
	VSZ 使用的虚拟内存量
	RSS 占用的固定内存量
	STAT: 
		R 正在运行、可以运行
		S 正在中断睡眠中，可以被唤醒
		D 不可中断睡眠
		T 正在侦测、停止
		Z 已经终止但是父进程无法正常终止，成为僵尸进程
		+ 前台进程
		l 多线程进程
		N 低优先进程
		> 高优先进程
		s 进程领导者
		L 已经将页面锁定到内存中
	ps -l
	SZ 使用的内存大小
	ADDR 进程在内存中的位置
	可以输出指定的字段
	ps -eo pid,ppid,pgrp,session,tpgid,comm
	ps -eo "%C : %p : %z : %a" --sort -vsz

pstree: 显示进程状态树
	pstree 
	pstree 用户名
pgrep: 查找匹配条件的进程
	-u 显示指定用户的所用进程号
	-l 同时显示用户名
kill:
	-l 列出全部信号名称
	-s 指定要发送的信号
	HUP(1) 挂起，终端掉线、用户退出
	INT(2) 终端，Ctrl+c
	QUIT(3) 退出，Ctrl+\
	KILL(9) 立即结束
	TERM(15) 终止，关机时候发送
	TSTP(20) 暂停，Ctrl+z
	更多 man 7 signal
	kill 进程号
	kill 2203
	kill -s 15 2203
	kill -15 2203
	kill -9 2203
	kill -0 xxxx 不发送任何信号，如果进程存在，则返回0，若不存在，则返回1
killall: 通过进程名终止进程
	-e 准确匹配很长（15+）的名字
	-v 报告信号是否发送成功
	-u 终止指定用户的进程
	-I 不区分大小写
	-w 等待所有被终止的进程死去
pkill: 通过进程名终止进程
	-t 终端 
	-u 用户
top: 实时显示进程
	-a 按照内存排序
	-b 以批处理的模式显示信息
	-c 显示命令的绝对路径
	-d 刷新间隔
	-n 更新的次数，之后退出
	交互式命令
	z 打开关闭颜色
	b 打开关闭加粗
	x 高亮显示排序列
	d或者s 刷新频率
	R 切换正常反转排序
	l 是否显示平均负载和启动时间信息
	t 是否显示进程和CPU状态
	m 是否显示内存信息
	1 数字1用于多核CPU
	CPU 信息
	us 用户空间占用CPU百分比
	sy 内核空间。。。
	ni 改变过优先级的进程。。。
	id 空闲。。。
	wa IO等待。。。
	hi 硬中断。。。
	si 软中断。。。
	st 虚拟机。。。
	进程信息
	PID 进程ID
	USER 进程所有者
	PR 进程优先级
	NI nice值，负值高优先级，正值低优先级
	VIRT 使用的虚拟内存量，kb
	RES 使用的物理内存量，kb
	SHR 共享内存量，kb
	S 进程状态：D，不可中毒的睡眠；R，运行；S，睡眠；T，跟踪或停止；Z，僵尸进程
	TIME+ CPU占用时间总计，1/100 秒
nice 调整程序优先级
	-n num nice增加的数值，默认10
	-20~19 越低优先级越高
	root可以随意调整
	普通用户只能调整自己程序的，而且范围是0~19，而且只能往高调
	nice 
	0
	nice nice
	10
	nice nice nice
	19
	PRI+nice得到最终的优先级
	PR是实际的，nice只是用户层面的调整
	PRI并不是在上一次基础上变化，而是一直在初始默认值上面变化
renice 调整运行中的进程的优先级
	-n num 
	-g 用户组进程
	-u 指定用户的
	-p 指定pid的进程
nohup: 用户退出系统继续工作
	nohup ping www.oldboyedu.com
	标准输出写到当前目录的nohup.txt或者$HOME.nohup.txt
	一般使用直接在后台运行
	nohup ping www.oldboyedu.com &
strace: 
	跟踪进程的系统调用
	程序调试工具，是高级运维和开发人员的杀手锏
	-f 跟踪目标进程以及其所创建的所有子进程
	-tt 在输出的每一行前面加上时间信息，精确到微秒
	-e expr 输出过滤器
		expr是表达式 [qualifier=][!]value1[,value2]
		- qualifier 只能是 trace, abbrev, verbose, raw, signal, read, write 其中之一
		- value是用来限定的符号 或者数字
		- 默认的qualifier是trace
		- 感叹号是否定
		常见选项：
		-e trace=[set]    只跟踪指定的系统调用
		-e trace=file     只跟踪与文件操作有关的系统调用
		-e trace=process  只跟踪与进程控制有关的系统调用
		-e trace=network  只跟踪与网络有关的系统调用
		-e trace=signal   只跟踪与系统信号有关的系统调用
		-e trace=disc     只跟踪与文件描述符有关的系统调用
		-e trace=ipc      只跟踪与进程通信有关的系统调用
		-e abbrev=[set]   设定strace输出的系统调用的结果集
		-e raw=[set]      将指定的系统调用的参数以16进制显示
		-e singal=[set]   指定跟踪的系统信号
		-e read=[set]     输出从指定文件中读出的数据
		-e write=[set]    输出写入到指定文件中的数据
	-p pid 指定要跟踪的进程pid，同时跟踪多个则重复多次-p
	strace -tt -f /application/nginx/sbin/nginx
	strace -tt -f -e trace=file /application/nginx/sbin/nginx
	strace -tt -f -e trace=file -p 1109
	strace -c /application/nginx/sbin/nginx  为所有的系统调用做一个统计分析
	strace -c -o tongji.log /application/nginx/sbin/nginx
	strace -T /application/nginx/sbin/nginx  输出每个系统调用花费的时间
ltrace: 跟踪进程调用库函数
	-e expr 输出过滤器，例如 -e printf  -e !printf
	-p pid 跟踪指定pid进程
runlevel: 输出当前运行级别
	--quite 不输出结果，用于通过返回值判断的场合
	0 停机
	1 单用户模式
	2 无网络的多用户模式
	3 多用户模式
	4 未使用
	5 图形界面多用户模式
	6 重启
init: 初始化Linux进程
	是所有Linux进程的父进程，主要任务是根据配置文件/etc/inittab创建Linux进程
	init 0 关键
	init 6 重启
service: 管理系统服务
	service --status-all
	service crond status
	service crond start
```

## Chapter 10

```
ifconfig: 配置或显示网络接口信息
	yum -y install net-tools
	-a 显示所有网络接口信息
	up 激活指定的网络接口
	down 关闭指定的网络接口
	hw 设置网络接口的MAC地址
	HWaddr表示硬件的MAC地址
	UP 网卡开启状态
	RUNNING 网线连接状态
	MULTICAST 支持组播
	MTU:1500 最大传输单元为1500字节
	ifconfig eth1 up
	ifconfig eth1 down
	ifconfig eth1 192.168.120.56 为网卡配置IP地址
	ifconfig eth1:0 10.0.0.8 netmask 225.225.225.0 up 配置IP别名
	ifconfig eth1:0 10.0.0.8/24 up 和上面一样的意思
	ifconfig eth0 hw ether 00:AA:BB:CC:DD:EE
	网卡重启或者机器重启之后配置都没了，想要永久就用
	eth0  /etc/sysconfig/network-scripts/ifcfg-eth0
	eth0:0 /etc/sysconfig/network-scripts/ifcfg-eth0:0
ifup: shell 脚本 激活网络接口 
	ifup eth1
ifdown: shell 脚本 禁用网络接口
	ifdown eth1
route: 显示管理路由表
	-n 直接使用IP地址，不进行DNS解析主机名
	add 添加路由信息
	del 删除路由信息
	-net 到一个网络的路由，后接网络号地址
	-host 到一个主机的路由，后接主机地址
	netmask NM 为添加的路由指定网络掩码
	gw GW 为发往目标网络或者主机的任何分组指定网关
	dev If 指定由哪个网络设备出去，后接网络设备名 （eth1）
	结果说明：
	Destination 网络号network
	Gateway 连出网关地址，如果是0.0.0.0，则说明路由直接从本机出去
	Genmask 子网掩码地址netmask
	Flags 路由标记信息
		U 启动状态
		H 目标路由是主机IP而不是网络
		R 使用动态路由时，恢复路由的信息标示
		G 表示需要通过外部主机来转接传递数据
		M 路由已经被修改了
		D 已经由服务设定为动态路由
		! 这个路由将不会被接受，抵挡不安全的网络
	Metric 需要经过几个网络节点hops才能到达路由的目标网络地址
	Ref 参考到此路由规则的数目
	Use 有几个转送数据包参考到了此路由规则
	Iface 路由对应的网络设备接口
	0.0.0.0代表所有的地址，路由表从上向下读，最后一条是默认网关
	删除和添加默认网关
	route del default
	route -n
	route add default gw 10.0.0.2
	route del default gw 10.0.0.2
	route add default gw 10.0.0.2 dev eth0
	route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.0.0.2
	
	
arp: 管理系统的arp内存
	arp命令用于操作本机的arp缓存区，它可以显示arp缓存区中的所有条目，删除指定条目或者添加静态的IP地址与MAC地址的对应关系
	Address Resolution Protocol
	-n 显示数字IP地址
	-s <主机> <MAC地址> 设置指定主机的IP地址与MAC地址的静态映射
	-d <主机> 从arp缓存区删除指定主机的arp条目

ip: 网络配置工具
	ip help
	ip [选项] [网络对象] [操作命令]
	选项:
	-s 详细信息
	网络对象及操作命令
	link: set, show;
	address: add, del, flush, show;
	addrlabel: add, del, list, flush;
	neighbour: add, change, replace, delete, show, flush;
	route: add, change, replace, delete, show, flush, get;
	rule: add, delete, flush, show;
	maddress: show, add, delete;
	mroute: show;
	tunnel: add, change, delete, prl, show;
	xfrm: state, policy, monitor;
	
	ip link show dev eth1
	ip -s -s link show dev eth1
	ip link set eth1 up
	ip set eth1 address 0:0c:29:13:10:11
	ip a show eth1
	ip a add 172.16.1.12/24 dev eth1
	ip a add 172.16.1.13/24 dev eth1 创建辅助ip
	ip a add 172.16.1.14/32 dev eth1 label eth1:1 创建别名IP
	
	ip route 
	ip route|column -t
	route -n
	ip route add 10.1.0.0/24 via 10.0.0.253 dev eth0
	ip route del 10.1.0.0/24
	
	ip neighbour 查看arp缓存
	
netstat: 查看网络状态
	-r =route，ip route
	-g =ip maddr
	-i =ip -s link
	-s 显示各类协议的统计信息
	-n 显示数字形式的地址而不是解析主机端口或者用户名
	-a 显示处于监听状态和非监听状态的socket信息
	-c <秒数> 每隔几秒刷新一次
	-t 显示左右tcp连接
	-u 显示所有udp连接
	-p 显示左右socket所属进程的PID和名称
	
	netstat -an 所有连接信息
	netstat -lntup 所有tcp udp信息
	netstat -rn  等同于 route -n
	netstat -i
	Flg
		L 接口是回环设备
		B 设置了广播地址
		M 接受所有数据包
		R 接口正在运行
		U 接口正在处于活动状态
		O 该接口上禁用arp
		P 一个点到点的连接
ss: 类似并将会取代netstat的工具
	-n 显示IP地址，不进行DNS解析
	-a 显示所有socket连接
	-l 显示所有监听socket
	-p 显示使用socket的进程
	-t 仅显示tcp的socket
	-u 仅显示udp的socket
	-r 尝试解析数字IP地址和端口
	ss -an
	ss -lntup| column -t
	ss -s
	
ping: 测试主机之间的连通性，使用ICMP协议
	-c 发送报文的次数
	-i 发送报文的时间间隔
	
traceroute: 追踪数据传输路由状况
	加快查询时间
	traceroute -I www.oldboy.com 使用icmp协议
	traceroute -In www.oldboy.com 不解析主机名

arping: 发送arp请求
	-c <次数> 发送指定次数报文后退出命令
	-f 收到第一个应答后立即退出命令，用于检测主机是否存活

telnet: 远程登录主机
	telnet 10.0.0.12 22 测试端口是否开放
nc: 多功能网络工具
	-l 指定监听端口然后一直等待网络连接
	-z 扫描时不发送任何数据
	-v 显示详细输出
	-w 设置超时时间
	
	nc -l 12345 >oldboy.nc 监听12345端口并且将数据写入oldboy.nc
	nc 10.0.0.12 12345 <oldboy.log 向10.0.0.12的12345端口发送oldboy.log文件
	nc -l 80 < test.txt 一直监听80端口，并发送test.txt文件内容
	
	手动与HTTP服务器建立连接
	nc blog.oldboyedu.com 80
	GET /about-us/ HTTP/1.1 粘贴这两行语句，要快
	host:blog.oldboyedu.com
	
	利用nc进行端口扫描
	nc -z 10.0.0.12 20-30
	nc -v -z 10.0.0.12 20-30
	
ssh: 安全的远程登录主机
	-p 指定登录端口
	-t 强制分配伪终端，可以执行任何全屏幕程序
	-v 调试模式，用于解决登录慢的问题
wget: 命令行下载工具
	-O 指定保存的文件名
	--limit-rate 限速下载
	-c 断点续传
	
	wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
	wget --limit-rate=3k http://www.oldboyedu.com/favicon.ico
	后台下载
	wget -b
	tail wget-log
	伪装代理名称下载
	wget --user-agent="Mozilla/5.0 (Windows; U ; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16" http://www.oldboyedu.com/favicon.ico
	监控网站URL是否正常的案例
	wget -q -T 3 --tries=1 --spider www.baidu.com
	echo $?
	0代表正常

mailq: 显示邮件传输队列
	-v 调试模式，可以显示详细信息，如
	postqueue: dect_eval: expand $myhostname -> blablabla
	可以看到邮箱域名并且用来加入白名单
mail: 发送和接收邮件
	-s 指定邮件主题
	-a 邮件附件
	使用范例
	/etc/init.d/postfix start
	mail -s "Hello from oldboyedu" zhangyao@oldboyedu.com
	紧接着可以输入内容
	EOT结束输入
	
	echo -e "hello...blabla/nblabla"|mail -s "subject" zhaoying@hahah.com
	mail -s "subject" zyjsdjf@hh.com <install.log
	
	使用第三方邮箱发送邮件
	vim /etc/mail.rc
	在最后一行添加
	set from=zhangyao@163.com smtp=stmp.163.com smtp-auth-user=zhangyao smtp-auth-password=xxxxxxxx smtp-auth=login
	
nslookup: 域名查询工具
	直接输入nslookup进入交互模式，默认域名服务器/etc/resolv.conf
	交互命令
	exit
	server <> 指定解析域名的服务器地址 or nslookup - 223.5.5.5
	set 关键字=值，值可以是“ANY”
		domain=name 指定查询的域名
		port=端口号 指定域名服务器的端口号
		type=类型名 指定域名查询的类型（A, HINFO, PTR, NS, MX）
		retry=<次数> 指定查询时的重定向次数
		timeout=秒数 指定查询的超时时间
	非交互式命令
	nslookup www.oldboyedu.com 223.5.5.5
dig: 域名查询工具
	@ 指定DNS服务器
	-x 反向域名解析
	-t 指定DNS查询类型，默认A，可以MX，PTR
	-b 指定本机那个IP发送请求
	+trace 从根域开始跟踪查询结果
	+nocmd 精简输出
host: 域名查询工具
	-a 显示详细
	-t 指定域名信息类型
nmap: 网络探测工具和安全，端口扫描器
	-sS TCP同步扫描
	-sn 不进行端口扫描，只检查主机正在运行
	-sT TCP连接扫描
	-v 显示详细信息
	-p 端口，可以逗号隔开或者-表示范围（默认扫描1-1000）
	-n 不进行DNS解析，加快速度
	namp -p 1024-65535 10.0.0.12
	nmap 10.0.0.0/24 扫描局域网所有IP
	nmap -sn 10.0.0.0/24
	nmap -sn 10.0.0.1-10
	nmap -O -sV 10.0.0.12 探测主机的操作系统版本
	在网络安全性要求较高的主机上，最好屏蔽版本号，防止黑客利用漏洞攻击
	
tcpdump: 监听网络流量
	tcpdump命令是一个解惑网络数据包的包分析工具。tcpdump可以将网络中传送的数据包的“头”完全截获下来以提供分析。它支持针对网络层，协议，主机，端口等的过滤，支持与或非逻辑语句协助过滤有效信息。
	tcpdump命令工作时要先把网卡的工作模式切换到混杂模式，因为要修改网络接口的工作模式，所以tcpdump命令需要以root身份运行。
	-c <数据包数目> 接收到指定的数目后退出命令
	-i <网络接口> 指定要监听数据包的网络接口
	-n 不进行dns解析
	-nn 不将协议和端口数字等转换为名字
	-q 以快速输出的方式运行，输出信息短
	
	tcpdump -i eth0
	
	输出说明：
	IP 10.0.0.12.ssh > 10.0.0.1.56425 从ssh端口发送到56425端口
	Flags[P.] TCP包中的标识信息，S是SYN标志的缩写, F(FIN), P(PUSH), R(RST), '.'(没有标记)
	seq 数据的顺序号
	ack 下次期望的顺序号
	win 接受缓存的窗口大小
	length 数据包的长度
	
	tcpdump -n host 10.0.0.1
	tcpdump -n src host 10.0.0.1 只监听从10.0.0.1发出的数据包
	tcpdump -n dst host 10.0.0.1
	tcpdump -nn port 22
	tcpdump -n arp
	tcpdump -n icmp
	tcpdump -n tcp(ip, udp)
	过滤条件
	tcpdump -n ip host 10.0.0.12 and ! 10.0.0.1
	
	正常tcp连接的三个阶段
		tcp三次握手
		数据传输
		tcp四次断开
	tcp状态标示
		syn三次握手时有效，标示一个新的请求
		ack确认tcp请求，成功接受所有数据
		fin端口仍然开放，准备结束
	
	tcpdump tcp dst port 80 or src 12.130.132.30 -i eth1 -n	
```

```
模拟简单的web服务器效果
>>cat test.txt
>>cat web.sh
#!/bin/bash
while ture
	do
		nc -l 80 < test.txt
done
>>sh web.sh &>/dev/null &
>>netstat -lntup|grep 80
>>curl 127.0.0.1
```

```
模拟QQ聊天
首先在第一个窗口执行
nc -l 12345
第二个窗口执行
nc 127.0.0.1 12345
第三个窗口
netstat -ntp|grep nc
```

## Chapter 11

```
lsof: 查看进程打开的文件
	可以找到文件对应的进程和进程对应的文件
	-c 进程名
	-p 进程号
	-u 指定用户
	-U 所有socket文件
	显示文件对应的进程：
		lsof /var/log/messages
		FID 文件描述符
		0 标准输出
		1 标准输入
		2 标准错误
		u 读取写入模式
		r 只读模式
		w 写入模式
	显示进程号打开的文件：
		lsof -p 1277
	
	lsof -i [46] [protocol][@hostname][:service|port]
	46: 4 IPv4, 6 IPv6
	protocol: TCP or UDP
	service: NFS or SSH or FTP
	
uptime: 显示系统的运行时间及负载
free: 查看系统内存信息
	-m 以MB为单位显示内存的使用状况
	-h 以人类可读的形式显示
	-s <间隔秒数> 持续变化显示
iftop: 动态显示网络接口流量信息
	-i 指定监听的网络接口
	-n 不进行DNS解析
	-N 不将端口号解析为服务名
	-B 以Byte单位显示流量，默认是bit
	-P 显示端口号
	iftop -nMBP
vmstat: 虚拟内存统计
	vmstat 5 6 每五秒钟更新一次信息，统计六次后停止
	-a 显示活跃内存和非活跃内存
	-s 显示内存相关统计信息及多种系统活动数量
	-d 显示磁盘相关统计信息
	-p 显示磁盘分区统计信息
	
	结果说明：
	第一列procs
		r 运行和正在等待的CPU时间片的资源数
		b 正在等待资源的进程数
	第二列memory
		swpd 使用虚拟内存的大小
		free 空闲的物理内存数量
		buff buffers的内存数量
		cache cache的内存数量
	第三列swap
		si 由磁盘调入内存，内存进入内存交换区的数量
		so 相反
	第四列I/O
		bi 从块设备读入数据总量
		bo 写入块设备的数据总量
	第五列system的中断数
		in 某一时间间隔中每秒设备间断数
		cs 每秒产生的上下文切换次数
	第六列CPU
		us 用户进程消耗CPU时间百分比
		sy 系统内核进程消耗CPU时间百分比
		id CPU空闲时间百分比
		wa I/O等待所占用的CPU时间百分比
		st 虚拟机占用CPU时间的百分比
	
mpstat: CPU信息统计
	-P 指定CPU编号如 
		-P 0
		-P 1
		-P ALL
	mpstat 5 6 每五秒钟更新一次信息，统计六次后停止

iostat: I/O 信息统计
	-c 显示CPU使用情况
	-d 显示磁盘使用情况
	-k 以KB为单位
	-m 以MB为单位
	
	结果说明：
	%user 用户进程消耗的CPU时间百分比
	%nice 改变过优先级进程占用的CPU时间百分比
	%system 系统（内核）进程消耗的CPU时间百分比
	%iowait IO等待进程消耗的CPU时间百分比
	%steal 虚拟机强制CPU等待的CPU时间百分比
	%idle 空闲的CPU时间百分比
	tps 该设备每秒传输次数
	Blk_read/s 每秒读取的数据块数
	Blk_wrtn/s 每秒写入的数据块数
	Blk_read 读取的总块数
	Blk_wrtn 写入的总块数

iotop: 动态显示磁盘的I/O信息
	-o 显示正在使用I/O的进程或者线程，默认是显示所有
	-d 设置显示的间隔秒数
	-p 只显示指定的PID信息
	
	结果说明：
	Total DISK READ 总磁盘读取速度
	Total DISK WRITE 总磁盘写入速度
	TID 进程的PID值
	PRIO 优先级
	SWAPIN 从swap分区读取数据占用的百分比
	I/O IO消耗的百分比
	COMMAND 消耗IO的进程名

sar: 收集系统信息
	-u 显示所有CPU在采样时间内的负载状态
	-d 所有硬盘在采样时间内的负载状态
	-r 系统内存在采样时间内的负载状态
	-b 缓冲区在采样时间内的负载状态
	-n 网络运行状态
	-q 显示运行队列的大小，与系统的平均负载相同
	
	结果说明：
	runq-sz 运行队列的长度（等待运行的进程数）
	plist-sz 进程列表中进程和线程的数量
	ldavg-1 过去一分钟系统的平均负载
	kbmemfree 空闲物理内存量
	kbmemused 使用中的物理内存量
	%memused 物理内存量的使用率
	kbbuffers 内科中作为缓冲区使用的物理内存容量
	kbcached 内核中作为缓存使用的物理内存量
	kbcommit 应用程序当前使用的内存大小
	%commit 应用程序当前使用的内存大小占总大小的百分比
	
	tps 每秒钟物理设备的io总量
	rtps 每秒钟从物理设备读入的数据总量
	wtps 每秒钟从物理设备写入的数据总量
	bread/s 每秒钟从物理设备读入的数据量，单位是块/s
	bwrtn/s 每秒钟向物理设备写入的数据量，单位是块/s
	
	IFACE 网络接口
	rxpck/s 每秒钟接收的数据包
	txpck/s 每秒钟发送的数据包
	rxKB/s 每秒钟接收的字节数
	txKB/s 每秒钟发送的字节数
	rxcmp/s 每秒钟接收的压缩数据包
	txcmp/s 每秒钟发送的压缩数据包
	rxmcst/s 每秒钟接收的多播数据包
	
	sar -n EDEV 2 3
	rxerr/s 每秒钟接收的坏数据包
	txerr/s 每秒钟发送的坏数据包
	coll/s 每秒钟的冲突数
	rxdrop/s 因为缓冲充满，每秒钟丢弃的已接受数据包数
	txdrop/s 因为缓冲充满，每秒钟丢弃的已发送数据包数
	txcarr/s 发送的每秒载波错误数
	rxfram/s 每秒接收数据包的帧对其错误数
	rxfifo/s 接收的数据包每秒FIFO过速的错误数
	txfifo/s 发送的数据包每秒FIFO过速的错误数
	
	sar -n SOCK 2 3
	totsck 使用的套接字总数量
	tcpsck 使用的tcp套接字总数量
	udpsck 使用的udp套接字总数量
	rawsck 使用的raw套接字数量
	ip-frag 使用的IP段数量
	tcp-tw 处于TIME_WAIT状态的TCP套接字数量
	
	sar -d 2 3
	DEV 磁盘的设备名称
	tps 每秒传输次数
	rd_sec/s 每秒从设备读取的扇区数
	wr_sec/s 每秒写入设备的扇区数
	avgrq-sz 设备平均每次IO操作的数据大小（扇区）
	avgqu-sz 平均IO队列长度
	await 设备平均每次IO操作的等待时间（毫秒）
	svctm 设备平均每次IO操作的服务时间（毫秒）
	%util 每秒钟用于IO的百分比
	
chkconfig: 管理开机服务
	--list 显示不同运行级别下服务的启动状态
	--add 添加一个系统服务
	--del 删除一个系统服务
	--level 指定运行级别
	0 关机
	1 单用户模式
	2 没有网络的多用户模式
	3 完全的多用户模式
	4 没有使用的级别
	5 图形界面多用户模式
	6 重启
	chkconfig sshd on(off) 开启或者关闭2,3,4,5级别开机自启动
	chkconfig --level 3 sshd on
	
	chkconfig的原理是runlevel级别的/etc/rc.d/rc*.d目录中对应服务做一个以S或者开头的软连接。
	S01sysstat 是on
    K99sysstat 是off
    rm -f S01sysstat
    ln -s ../init.d/sysstat K99sysstat
    
    写一个能被chkconfig的脚本
    开头必须要有以下2行
    # chkconfig: 2345 20 80 20是开机启动服务顺序，80是关机停止服务顺序
    # description : Save and restore system entropy pool for
    
ntsysv: 管理开机服务
	使用空格键切换开启关闭，tab切换保存不保存
setup: 系统管理工具
ethtool: 查询网卡参数
	ethtool eth0
mii-tool: 管理网络接口的状态
	默认网卡自动协商但是有时候不正常，用mii-tool
	-v 显示详细信息
	-r 重启自动协商
dmidecode: 查询系统硬件信息
	-t 只显示指定条目
	-s 只显示指定DMI字符串的信息
	-q 精简输出
	dmidecode -s system-product-name
	dmidecode -s system-serial-number
	dmidecode -t memory
lspci: 显示所有PCI设备
	-v 详细信息
	-vv 更详细信息
	-s 指定总线的信息
	lspci -s 02:04.0
ipcs: 显示进程间通信设施的状态
ipcrm: 清除ipc相关信息
rpm: rpm包管理器
	Red Hat Package Manager
	-q 查询安装包
	-p 后接软件包
	-i 与qp配合使用则info显示信息；否则安装install
	-l 显示软件包所有文件列表
	-R 显示软件包依赖环境
	-v 显示详细信息
	-h 显示安装进度条
	-a 与q搭配使用，查询所有的软件包
	-e 卸载软件包
	-f 查询命令或文件属于哪个软件包
	-U 升级软件包
	
	查看信息 -qpi
	查看内容 -qpl
	查看依赖 -qpR
	安装 -ivh
	查询 -qa lrzsz 或者 -qpa lrzsz.rpm
	卸载 -e lrzsz
	查询 -qf $(which ifconfig)
yum: 自动化RPM包管理工具
	Yellow Dog Updater Modified
	-y 确认操作
	常用命令
	yum install httpd
	yum localinstall httpd-2.2.15-54.el6.centos.x86_64.rpm
	yum remove httpd
	yum update httpd
	yum list httpd
	yum search httpd 不记得软件包确切名称
	yum info httpd 
	yum deplist httpd 查看软件包的依赖
	yum list 列出所有可用软件
	yum list installed 列出已安装软件
	yum provides /etc/my.cnf 查找某个特定文件属于哪个软件包
	yum check-update 
	yum update
	yum grouplist 列出所有可用群组
	yum groupinstall "MySQL Database" 安装群组软件包，通过yum grouplist 查询组包名
	yum groupupdate "DNS Name Server" 更新群组软件包，通过yum grouplist 查询组包名
	yum groupremove "DNS Name Server" 移除群组软件包，通过yum grouplist 查询组包名
	yum repolist 列出启用的YUM源
	yum repolist all 列出所有包括禁用的YUM源
	yum --enablerepo=local install httpd 安装来自某个特定源的软件包
	yum --enablerepo=local --disablerepo=base,extras, install LNMP
	yum clean all 清除缓存
	yum history 查看历史记录
```

## Chapter 12

```
: 执行不会造成任何影响
. 在当前的Shell环境中执行Shell脚本，和source功能一样
[ 构建条件测试表达式，常用于Shell脚本，功能类似于命令test
alias 显示和创建已有命令的别名
	alias rm='echo "Do not us rm."'
	unalias rm
bg 把任务放到后台
bind 显示和设置命令号的键盘序列绑定功能
break 跳出循环
builtin 运行一个内置Shell命令
caller 返回所有活动子函数调用的上下文
cd 切换目录
command 即使有同名函数，也仍然执行该命令
compgen 筛选补全结果
complete 指定可以补全的参数
compopt 修改补全设置
continue 忽略本次循环剩余代码，直接进入下一次循环
declare 声明一个变量或者变量类型
dirs 显示当前储存目录的列表
disown 从任务表中删除一个活动任务
echo 显示一行文本
enable 启用或者禁用内置命令
eval 读入参数，并将它们组成一个新的命令，然后执行
	echo `hostname -I`
	echo '`hostname -I`'
	eval echo '`hostname -I`'
exec 用指定命令替换Shell进程
exit 退出Shell
export 设置或者显示环境变量
	-p 显示所有全局变量
false 
fc 查看历史命令
fg 后台任务放到前台
getopts 分析指定的位置参数
hash 查找并记住指定命令的全路径名
help 显示帮助信息
	-d 简单描述
	-m man格式显示文档
	-s 只输出命令使用语法
history 显示带行号的历史记录
	-d 删除记录
	-c 清除所有记录
	history 10 最近10条记录
jobs 显示后台任务
kill 杀死进程
let 用来计算算术表达式的值，并把算术运算的结果赋值给变量
local 用在函数中，把变量的作用域限制在函数内部
logout 退出Shell
mapfile 从标准输入读取数据并写入数组
popd 从目录栈中删除项
printf 使用格式化字符串显示文本
pushd 像目录栈中增加项
pwd 当前工作目录
read 从标准输入中读取一行，保存到变量中
	-p 设置提示信息
	-t 设置输入超时时间
	-s 关闭回显
	-n 最长输入
	read
	echo $REPLY
	read one
	echo $one
	read one two
	echo $one
	echo $two
readonly 将变量设为只读，不允许重置该变量
return 从函数中退出
set 设置并且显示环境变量的值
shift 将位置变量左移n位
shopt 打开关闭控制Shell可选行为的变量值
source 在当前的Shell环境当中执行Shell脚本，与.的功能一样
suspend 终止当前Shell的运行
test 构造条件测试表达式
times 显示累计的用户和系统时间
trap 抓取到Shell收到的信号
true
type 显示命令的类型
	-a 详细信息
	-t 精简信息
typeset 同declare，设置变量并赋予其属性
ulimit 显示或设置进程可用资源的最大限额
	-a 显示当前所有系统资源使用限制
	-n 显示或设置最多打开的文件数目
umask 为新建的目录或文件设置默认权限
unalias 取消指定的命令别名设置
unset 取消指定变量的值或者函数的定义
	OLDBOY=1
	export OLDGIRL=2
	echo $OLDBOY $OLDGIRL
	unset OLDBOY OLDGIRL
	echo $OLDBOY $OLDGIRL
wait 等待指定的进程完成，并返回退出状态码
```

```
if [ $i -eq 1 ]
	then
		:
else
	echo "Hello World"
fi
```

```
加载和执行Shell脚本
第一种
	bash scriptname 或者 sh scriptname 是当脚本没有可执行权限，或者脚本开头没有解释器
第二种
	source scriptename 或者 . scriptname 甚至可以在父进程中执行子脚本而且带着返回值
```

```
nc -l 12345
Ctrl+Z
jobs
bg 1
jobs 
kill %1
```

```
#!/bin/bash
for ((i=0; i<=5; i++))
do
	if [ $i -eq 3 ] ; then
		break;
	fi
	echo $i
done
echo "ok"
```

```
echo `hostname -I`
echo '`hostname -I`'
eval echo '`hostname -I`'
```



