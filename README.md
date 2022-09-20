# 何より重要なEmacsの設定
Emacsないと何もできないマン,Caskからstraight.elに乗り換えた  
[Python2と縁を切れた](https://qiita.com/yoooz/items/8a97642086611892f4c3)

## 初期設定
不要！
全部勝手にgit clone && buildする

でもないか
### Emacs:
```
./setup_emacs.sh
```

### Vim:
To install,
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

To install plugins, type on command mode:
```
:PluginInstall
```
or type in shell:
```
vim +PluginInstall +qall
```

- [raw markdown](https://boneandrea.github.io/dotfiles/newpage.md)  
- [rendered markdown](https://boneandrea.github.io/dotfiles/newpage)  
- [rendered markdown.html](https://boneandrea.github.io/dotfiles/newpage.html)

## ページのカスタム

このテーマはCaymanなので、[https://github.com/pages-themes/cayman](https://github.com/pages-themes/cayman)から`_layouts`などを持ってきて配置、カスタムする

(Github: [https://github.com/boneandrea/dotfiles](https://github.com/boneandrea/dotfiles/))  
(Github page: [https://boneandrea.github.io/dotfiles/](https://boneandrea.github.io/dotfiles/))
