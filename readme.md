## setp1:
useradd jijing
vim /etc/sudousers
jijing ALL=(ALL)     ALL

## step2:
sudo yum upgrade
sudo yum install git

ssh-keygen -t rsa -C "goco.v@163.com"
cat ~/.ssh/id_rsa.pub
// copy past to github
git clone git@github.com:jijingg/homize.git

## step3:
// install java1.8
yum list java*
sudo yum -y install java-1.8.0-openjdk-devel.x86_64

// install sbt
sudo rm -f /etc/yum.repos.d/bintray-rpm.repo
curl -L https://www.scala-sbt.org/sbt-rpm.repo > sbt-rpm.repo
sudo mv sbt-rpm.repo /etc/yum.repos.d/
sudo yum install -y sbt

## step4:
sudo yum install -y git make autoconf g++ flex libfl-dev bison  # First time prerequisites
git clone http://git.veripool.org/git/verilator   # Only first time
unset VERILATOR_ROOT  # For bash
cd verilator
git pull        # Make sure we re up-to-date
git checkout v4.218
autoconf        # Create ./configure script
./configure --prefix ~/tools
make -j$(nproc)
make install
cd ..

## step5:
git clone git@github.com:magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
vim ~/.bashrc
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_THEME=Single_line_NoExitState_openSUSE
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

## step6:
set color git
git config --global color.ui true


## step7:
sftp
get xxx.file
put
