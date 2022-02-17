# Setup/Installation
## install python dependencies
pip install pyflakes mypy black importmagic yapf epc  autopep8 flake8 jedi virtualenv
source /home/kabira/.emacs.d/elpy/rpc-venv

## Clone dotemacs in ~/DesktopSetting folder
```
cd 
mkdir DesktopSetting
cd DesktopSetting
git clone https://github.com/sandeep-gh/dotemacs.git

## Add below lines in ~/.emacs.d/init.el

(add-to-list 'load-path "~/.emacs.d/custom")
(load "~/DesktopSetting/dotemacs/init.el")

# Features
## globalff
## rainbow delimiters
## newline mode
## ido/ido-vertical mode
## better-defaults
https://github.com/technomancy/better-defaults
## M-x enhancements
https://github.com/nonsequitur/smex

## kaolin and zenburn themes

## volatile highlights
https://github.com/k-talo/volatile-highlights.el

## key-chord-mode

## avy mode

## yaml mode

## keystrokes for switching across windows
see keystrokes.org

## one keystroke to jump to terminal, browser, and python-shell
see keystrokes.org

## visual-line-mode
for readable content

## banner-comment
C-;

## git support using git-emacs

M-x git-status

## shell
https://stackoverflow.com/questions/2886184/copy-paste-in-emacs-ansi-term-shell

# IDE

## importmagic
git repo: anachronic/importmagic.el

## elpy

### refactoring
C-c C-e 
C-c C-r r (elpy-refactor-rename)¶
C-c C-r v (elpy-refactor-extract-variable)¶
C-c C-r f (elpy-refactor-extract-function)¶
C-c C-r i (elpy-refactor-inline)¶

## company

## jedi

## blacken mode

## python-docstring mode

## py-docformatter
humitos/py-cmd-buffer.el

## py-autoflake
humitos/py-cmd-buffer.el

## buftra
humitos/buftra

## py-autopep8

## ace-link

## Features no incorporated due to performance or usability issues
global-linum-mode 
tabbar-mode
origami
helm
py-isort
sx


# dotemacs
pip install epc virtualenv jedi autopep8 flake8 ipython importmagic yapf

* On Debian/Ubuntu/etc
sudo aptitude install fonts-cascadia-code


- 
