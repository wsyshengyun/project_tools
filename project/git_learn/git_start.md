## GIT准备

 

 

### 安装git

直接下载再安装，成功后在开始菜单可以找到Git Bash命令行窗口。

 

配置本机的git

$ git config -- global user.name “Your Name” 

$ git config – global user.email [email@example.com](mailto:email@example.com) 

 

查看本机的配置

$ git config –global –list 

​    查看某一项的配置

$ git config –global user.name 

$ git config –global user.email

 

分布式版本控制系统

每个机器自报家门：名字和email

 

### 工作区 working Directory 

就是你电脑里能看到的目录

 

### 版本库 Repository 也叫仓库  

创建一个空目录 -> 进入 目录  -- > git init 

> 如果是在当前目录 git  init  name ， 那么将创建一个name目录，仓库建立在name目录里面。

目录里面多了一个.git 目录，默认是隐藏的， 用命令ls -ah 可以看见  

 

添加一个文件 ： readme.txt 

第一步 命令git add readme.txt 

第二步 git commit 把文件提交到仓库 

​    git commit –m “wrote a readme file” 

 

版本库就是工作区的一个隐藏目录.git

#### 版本库的东西

最重要的就是【暂存区】了-stage（或者叫index索引）

Git为我们新建的一个【分支】-master，以及指向分支的一个指针叫HEAD

 

git add ------ 把文件提交到暂存区

git commit --- 把文件提交到当前分支，只负责提交暂存区（index）

可以多次暂存一次提交分支 

多次提交就是多次add，然后保存一个快照，即commit；

commit: 对应快照，对应一个新的版本；

恢复：从最近的一次commit恢复

版本号：1094adb7b9b3807259d8cb349e7df1d4d6477073

### 忽略

> .gitignore文件 

【大家一定要养成在项目开始就创建.gitignore文件的习惯，否则一旦push，处理起来会非常麻烦】

在主目录下建立".gitignore"文件，此文件有如下规则：

 

忽略文件中的空行或以井号（#）开始的行将会被忽略。

可以使用Linux通配符。例如：星号（*）代表任意多个字符，问号（？）代表一个字符，方括号（[abc]）代表可选字符范围，大括号（{string1,string2,...}）代表可选的字符串等。

如果名称的最前面有一个感叹号（!），表示例外规则，将不被忽略。

如果名称的最前面是一个路径分隔符（/），表示要忽略的文件在此目录下，而子目录中的文件不忽略。

如果名称的最后面是一个路径分隔符（/），表示要忽略的是此目录下该名称的子目录，而非文件（默认文件或目录都忽略）。

### 别名

git config –global alias.ss status 

git config –global alias.co checkout 

git config –global alias.ci cimmit 

git comfig –global alias.br branch 

git config –global alias.unstage “reset HEAD”  # 可以把暂存区的内容撤消掉

git config –global alias.last ‘log -1’# 显示最后一次提交的信息

git config --global alias.lp "log --pretty=oneline"  # git log --pretty=oneline

疯狂的lg 

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

 

配置时加了global是对当前用户起作用，如果不加只对当前仓库起作用。

每个仓库的配置文件放在.git/config文件中



##  名词

HEAD^  上一个版本 

暂存区stage 

### 分支

合并分支时文件内容也会相应的融合。

 

 

###  远程仓库

权限控制

​	比如所有人都不准直接 git push origin master ，只有 admin 能 merge develop 或 master 分支；

和远端相关的Git 指令，我认为最基础的就是 **fetch** 和 **push** 

克隆版本库 >对版本库之间进行关联（通过远程版本库）

“远程版本库”

​	是一个引用或句柄（remote）

​	推模式和拉模式  -> 传输数据 

“原始版本库”

“克隆版本库”

“远程追踪分支”（remote-tracking branch）

“本地追踪分支“ local-tracking branch 

”发布版本库“ publishing a  repository  -- 将你的版本库提供给他人

### 版本库的概念

裸版本库和开发版本库   bare 和 development，nobare 

#### 开发版本库  

​	用一常规的日常开发。保持当前分支的概念。

#### 裸版本库

​	没有工作目录，没有检出分支的概念，简单的看作.git目录的内容。

​	不应该在裸版本库中进行提交操作

​	作用：作为协作开发的权威焦点。其它开发人员从~中克隆、抓取、推送更新。 	

​	建立命令：git init --bare dirname 

​	注：裸版本库中不能建立远程版本库。如果你要创建一个版本库供开发人员推送修改，那么它应该是裸版本库。

​	发布的版本库应该是一个裸版本库。

> 工作目录是一个包含版本库历史目录.git和源文件的目录
>
> 工作目录是通过git  init   或者  git  clone 创建本地项目的拷贝。

#### 版本库的克隆

git clone 



#### 分布式工作流程

集中式工作流程 和集成管理者工作流

##### 集中式工作流

这意味着如果两个开发者从中心仓库克隆代码下来，同时作了一些修改，那么只有第一个开发者可以顺利地把数据推送回共享服务器。 第二个开发者在推送修改之前，必须先将第一个人的工作合并进来，这样才不会覆盖第一个人的修改。 这和 Subversion （或任何 CVCS）中的概念一样，而且这个模式也可以很好地运用到 Git 中。



##### 集成管理者工作流

1. 项目维护者推送到主仓库。
2. 贡献者克隆此仓库，做出修改。
3. 贡献者将数据推送到自己的公开仓库。
4. 贡献者给维护者发送邮件，请求拉取自己的更新。
5. 维护者在自己本地的仓库中，将贡献者的仓库加为远程仓库并合并修改。
6. 维护者将合并后的修改推送到主仓库



## 命令

### 配置

```bash
# 查看配置
git config --list 

#　配置名字　
git conifg --global user.name "" 
git config --global user.email "" 

# 直接修改配置  
git config -e ; 
git config -e --global; 

```



 

### commit

git add 文件名

git add . 

​    git add –a 

git commit –m “” 

​    git commit –am “” 直接提交；

 

### 标签

git tag –a  tagname –m “”  附注标签

git tag 标签名  创建轻量标签

 

git tag  查看标签

git show tagname 查看标签 

git tag –a tagname 9fceb02  #后期打标签

​       git tag  -a tagname 9fcebo2 # 

git push origin - - tags 把不在远仓的标签推上去 

git push origin v1.5 显示推 

 	

git tag -d v1.4 删除标签 

​    git push <remote> :refs/tags/<tagname> 删除远仓标签

​    git push <remote> - - delete <tagname> 同上

 

 

### 分支

​    git branch 查看分支

​    git checkout name 切换分支

​       git checkout – 切换上一次的分支

```
  git checkout –b name 新建分支并切换

  git switch –c name 同上
```

​    git switch name 切换分支

​    

​    git merge name 快速合并；合并分支（主分支 git merge 子分支name） 

​    git merge –no-ff name  -m“”

 

​    git checkout –d name 删除分支

​       git branch –d name 

​	未合并的分支需要强制删除  git branch -D <name>

 

### 查看

git log  

git log -1 

git log --pretty=oneline

git log --graph --pretty=oneline --abbrev-commit

git reflog 

git log <分支名>  查看分支的提交

​      

 

git diff：是查看working tree与index的差别的。

git diff --cached：是查看index与repository的差别的。

git diff HEAD：是查看working tree和repository的差别的。其中：HEAD代表的是最近的一次commit的信息。

#### diff两个分支的比较

 git diff dev featureA --stat

​	比较featureA分支相对于dev分支有哪些文件改变（以及单个文件是增加行数还是减少了行数）；



​     

### 版本回退

提交后发现文件漏了可以使用如下

​	git add . 

​	git commit --amend ; 然后修改打开的文件注释



暂存区 - > 工作区（撤销）

git reset HEAD <filename>  ；把文件从暂存区回退到工作区 

​	git reset HEAD .   ;  把所有文件从暂存区回退到工作区



暂存区->上一次暂存（或上一个版本） 

​	git reset HEAD file1;  将文件从暂存区撤回到工作区

​	git checkout -- file1;  



git reset - - hard HEAD 

​    gir reset - - hard 版本号

git reset HEAD filename 暂存区的修改撤销掉（unstage），重新放回工作区

git reset --hard HEAD^

git reset --hard HEAD~1

git reset – 59cf9334cf957535cb328f22a1579b84db0911e5 



git checkout -- file1  （--左右要有空格）；将file1在工作区的修改撤回到上次暂存之前

git revert <commit-id >

这条命令会把指定的提交的所有修改回滚，并同时生成一个新的提交。

 

 





 

### **git  stash**~~

git stash   #执行存储

​	**git stash save** "save message"    并添加备注  



git stash list   # 查看stash了哪些存储  

git stash show ；查看堆栈中最新保存的stash与当前目录的差异，默认show第一个存储，如果要显示其他存贮，后面加stash@{$num}，

```bash
git stash show -p #　 显示第一个存储的改动  

git stash apply  @{0}　#　应用某个存储，但不会把存储从列表中删除。

git stash pop #　参数同上; 应用并删除

git stash drop stash@{$num}　#　 丢弃存储，从列表中删除。

git stash clear　　#　删除所有缓存的stash  
```

作用就是将目前还不想提交的蛤是已经修改的内容进行保存至堆栈中，后续可以在某个分支上恢复出堆栈的内容。

stash中的内容不仅可以恢复到原先开发的分支，还可以恢复到其他任意的分支。

git stash的作用范围包括工作区和暂存区中的内容，也就是没有提交的内容都会保存 堆栈。

git add 只是把文件添加到git版本控制里，并不等于就被stash起来了，git add和git  stash并没有必然的关系，但是执行git stash的前提必须在git版本控制中才行。



### git cherry-pick

git cherry -pick <commitHash>  就是把指定的提交应用于当前分支；

> 原来的提交还在；

git cherry-pick feature;  就是把分支feature的最近一次提交转移到当前分支；

git cherry-pick commit_A (空格）commit_B ；转移多个提交（两个）到当前分支；

git cherry-pick commit_A..commit_B; 转移连续的提交，但不包含commit_A；

> 如果要包含~A，可以git cherry-pick commit_A^..commit_B 

实验：

如果要cherry-pick A分支上的提交，A分支有1，2，3，4个提交；

如果1，2，3，4没有文件的更新，那么仅pick 4 的效果与 pick 2,3,4或3，4或1，2，3，4的效果是一样的；

如果有文件的删除或增加，上述结果不一定正确。



### git checkout 

```bash
# 从2到1 检出暂存区的修改到工作区 
git co -- file 

# 从历史版本中检出一个commit，这时多了一个匿名分支，这时候可以以此处创建一个新的分支；
git co commit_id 
git switch -c new  
```



### git revert 

取消上次提交的内容

> 当讨论 revert 时，需要分两种情况，因为 commit 分为两种：一种是常规的 commit，也就是使用 `git commit` 提交的 commit；另一种是 merge commit，在使用 `git merge` 合并两个分支之后，你将会得到一个新的 merge commit



### 变基 git rebase~~

merge的结果是生成一个新的快照并提交。

> - pick：正常选中
> - reword：选中，并且修改提交信息；
> - edit：选中，rebase时会暂停，允许你修改这个commit（参考[这里](https://schacon.github.io/gitbook/4_interactive_rebasing.html)）
> - squash：选中，会将当前commit与上一个commit合并
> - fixup：与squash相同，但不会保存当前commit的提交信息
> - exec：执行其他shell命令

变基的两个应用

一、变基就是把提交到某一分支上的所有修改都移到另一个分支上。

​	在A分支上 执行  git  rebase B，就是将A变基到B；

变基之后,A分支的基点已经移动到B分支的末端了，现在它们在一条直线上了，只是A在前，B在后，HEAD在A的末；现在再执行再切换到B分支上了，HEAD在B的末，然后再执行  git merge A  ; 把A合并到B上，这样B和A的末在同一点了，HEAD在这一点上；

> 总结，git rebase B -  是把当前分支变基到B上，是To B；
>
> git merge A - 是把A合并到当前分支上，是Form A；
>
> 合并或变基后，HEAD还在当前分支上；
>
>  -- 变基到近处， 合并到远处；

问题之：如A分支有1，2，3，4快照

可以将1，2，3，4变基到某分支上  -- 对

可以将2，3变基到某分支上 -- 错

可以将2，3，4变基到某分支上 --对   如何操作呢？？

二、在一个分支上合并多个commit为一个完整commit

git rebase -i  [startpoint] [endpoint]  ; endpoint 默认值是当前HEAD；合并startpoint到	endpoint,且该区间是前开后闭即(startpoint, endpoint] 



## 描述事项

工作区新加一个文件后，工作区就变化了，就要以向index区提交了，当add后，工作区就和index区一样了，这时候index区相对于版本库有更新了，就可以向版本库提交了。

当工作区和index区一样，此时



## 远程仓库

1    git remote add [仓库的名字:origin]  git@ github.com:michaeliao/learngit.git

2    git push –u origin master 

3    git clone git@github.com:hirocastest/first-pr.git

删除远程分支

git push origin --delete dev(分支名)

git push origin :<remote-branchname>



在本地删除远程分支

## 其它

在cmd命令行上更新windows下的git（git的版本>2.16.1）

​    git update-git-for-windows

 

distributed 分布式



如何查看本地是否比远程新呢？





### 使用git的一些原则

1. 永远记得 git st 和 git logl 来确认当前分支的状态
2. 宁愿临时制造一些无用的 commit 来保证代码不会丢失，也不要轻信自己的记忆力
3. 谨慎（最好能避免）使用 git stash ，极易造成代码丢失
4. 认真对待、编写每次的 commit message —— 它们能在关键时刻救你一命
5. 必要的时候可以创建一些临时的分支写实验性的代码，而不是依赖 git reset 撤销 commit —— 大多数人在 git reset 的时候容易犯错误



### 查看所有分支日志

"git reflog"中会记录这个仓库中所有的分支的所有更新记录，包括已经撤销的更新。

![https://images2017.cnblogs.com/blog/63651/201709/63651-20170906213836397-1160093052.png](file:///C:/Users/w3986/AppData/Local/Temp/msohtmlclip1/02/clip_image004.png)

 

### 未分类

> "---"表示变动前的文件，"+++"表示变动后的文件。
> 变动的位置
>
> ​	用两个@作为起首和结束，@@ -1,7 +1,7 @@
> ​	前面的"-1,7"分成三个部分：减号表示第一个文件（即f1），"1"表示第1行，"7"表示连续7行。合在一起，就表示下面是第一个文件从第1行开始的连续7行。
>
> 同样的，"+1,7"表示变动后，成为第二个文件从第1行开始的连续7行。





## github

下载代码的两种方式，一种是GUI另一种是通过命令行gitbash；

在gitbash上下载首先要获得ssh密钥，方法如下

> 1.右键Git Bash Here
> 2.**ssh-keygen -t rsa -C** “450402389@qq.com”
> 3.cat ~/.ssh/id_rsa.pub
> 4.复制key，添加到GitHub

>  带PUb的为公钥
>
> **[ ssh-keygen -t rsa -C]**

 关于ssh和gpg

[SSH、GPG学习与使用 | Zcp's Zone (chengpengzhao.com)](https://chengpengzhao.com/2020-03-04-ssh-yu-gpg-de-xue-xi-yu-shi-yong/)

gitlab的使用方法 

[如何使用gitlab - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/47823511)



token权限

至少要选择repo

[(27条消息) github的token使用方法_chengwenyang的专栏-CSDN博客_github token 使用](https://blog.csdn.net/chengwenyang/article/details/120060010)



