# Setup/Installation
## Compiling python
- install dependencies
sudo aptitude install libsqlite3-dev libffi-dev
- download python source and extract the files
- configure and compile
./configure --prefix=/opt --enable-optimizations --enable-shared
make -j4
- make install

## install mlocate/locate (for globalff search)
sudo apt install mlocate
sudo systemctl start mlocate
updatedb

## install cascadia-code font
sudo aptitude install fonts-cascadia-code

## Clone dotemacs in ~/DesktopSetting folder
```
cd 
mkdir DesktopSetting
cd DesktopSetting
git clone https://github.com/sandeep-gh/dotemacs.git
```

## Manual modifications
- If using compiled python binary then edit development.el and
change
`
(setq elpy-rpc-python-command "/opt/bin/python3")
`
to point to correct python3 executable. 
Or else, comment out the line

-  Add below lines in ~/.emacs.d/init.el

(add-to-list 'load-path "~/.emacs.d/custom")
(load "~/DesktopSetting/dotemacs/init.el")


- install python dependencies
```
source ~/.emacs.d/elpy/rpc-venv/bin/activate
pip install pyflakes mypy black importmagic yapf epc  autopep8 flake8 jedi virtualenv ipython
```

- M-x pyvenv-activate
choose ~/.emacs.d/elpy/rpc-venv 

- M-x elpy-config
to make sure all configs are in place

- M-x jedi:install-server






# Features
## color-theme
using color-theme-gnome2 from color-theme.el. Needs to be loaded manually M-x color-theme-gnome2.
If using alternative theme, edit settings.el. For example, if using kaolin-galaxy, add the lines
(load-theme 'kalion-galaxy t)
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

## code folding
key-chord ft: hs-toggle-hiding
;;   hs-hide-block                      C-c @ C-h  
;;   hs-show-block                      C-c @ C-s  
;;   hs-hide-all                        C-c @ C-M-h  
;;   hs-show-all                        C-c @ C-M-s  
;;   hs-hide-level                      C-c @ C-l  
;;   hs-toggle-hiding                   C-c @ C-c  
;;   hs-toggle-hiding                   [(shift mouse-2)]  
;;   hs-hide-initial-comment-block  

## Features no incorporated due to performance or usability issues
global-linum-mode 
tabbar-mode
origami
helm
py-isort
sx








- 
