
[Codrwall - Add git branch name to bash prompt](https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt)
```shell
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```

```shell
[root@centos1 NetApp-ONTAP-Testplan]# vi ~/.bashrc 
[root@centos1 NetApp-ONTAP-Testplan]# source ~/.bashrc 
root@centos1 ~/NetApp-ONTAP-Testplan (insight) $ ll
total 20
-rw-r--r-- 1 root root  243 Oct  9 15:48 ansible.cfg
drwxr-xr-x 3 root root   72 Oct  9 15:48 init
drwxr-xr-x 3 root root   25 Oct  9 15:48 inventories
drwxr-xr-x 2 root root 4096 Oct  9 15:48 playbooks
-rw-r--r-- 1 root root 4594 Oct  9 15:48 README.md
drwxr-xr-x 2 root root 4096 Oct  9 16:30 scripts
drwxr-xr-x 4 root root   42 Oct  9 15:48 vars
root@centos1 ~/NetApp-ONTAP-Testplan (insight) $
```