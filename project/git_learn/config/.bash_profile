# Show Git branch name in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# 显示 用户 @ 主机
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# 隐藏用户 @ 主机，显示当前文件夹 
#export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]"

# 只显示当前文件夹
export PS1="\[\e[32;1m\]\W $\[\e[0m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

# 显示全路径
#export PS1="\[\e[32;1m\]\w $\[\e[0m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

# https://zhuanlan.zhihu.com/p/418321777  一个配置gitbash的网址(知乎)

source ~/.bashrc