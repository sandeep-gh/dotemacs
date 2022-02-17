import os

os.system("sudo aptitude install fonts-cascadia-code")
if os.path.exists("~/.emacs.d/init.el"):
    os.system("mv ~/.emacs.d/init.el ~/.emacs.d/init.el.bak")
    with open("~/.emacs.d/init.el", "w") as fh:
        fh.write("""
        (add-to-list 'load-path "~/.emacs.d/custom")
        (load "~/DesktopSetting/dotemacs/init.el")
        """)
