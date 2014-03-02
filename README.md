# This is my dotfiles.

---

## setup git
### for MacOS
```
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
$ brew update
$ brew install git
```
### for Linux
```
$ sudo yum update
$ sudo yum install -y git
```
## setup dotfiles
### git clone
```
$ mkdir Devel && cd Devel
$ git clone git@github.com:ykawamot/dotfiles.git
```
### add symlink
```
$ cd dotfiles
$ ./setup.sh
$ ./deploy-home.pl | sh
```
### get php manual (optional)
```
$ mkdir -p $HOME/Devel/phpmanual
$ wget http://jp2.php.net/get/php_manual_ja.tar.gz/from/jp.php.net/mirror
$ brew install wget nkf w3m
```
## perlbrew
```
$ curl -LO http://xrl.us/perlbrew
$ chmod a+x perlbrew
$ ./perlbrew install
```
## cpanm
```
$ curl -L http://cpanmin.us/ | perl - App::cpanminus
$ cpanm App::cpanoutdated
```
