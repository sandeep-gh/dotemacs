;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; universal packages and configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-screen t)


;; for straight package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(straight-use-package '(nano-emacs :type git :host github :repo "rougier/nano-emacs")
;;                      :init
;;                      )
(use-package kaolin-themes
  :straight t
  :init
  )

(use-package zenburn-theme
  :straight t
  :init
  )

(use-package all-the-icons
  :straight t
  :init
  )



(load-theme 'kaolin-galaxy t)
;; Apply treemacs customization for Kaolin themes, requires the all-the-icons package.
(kaolin-treemacs-theme)

(setq zenburn-use-variable-pitch t)

;; ;; scale headings in org-mode
(setq zenburn-scale-org-headlines t)

;; discarding this <--> contrast in minibuffer is messed up
;;(straight-use-package '(color-theme :local-repo "~/DesktopSetting/dotemacs/color-theme")
;;  :init
;;  )
;;(load-file "~/DesktopSetting/dotemacs/color-theme/color-theme.el")
;;(require 'color-theme)
;;(color-theme-gnome2) -- some bug-- breaks emacs initialization; manuall call color-theme-gnome2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(use-package rainbow-delimiters
    :straight t
    :init
    (rainbow-delimiters-mode))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cascadia Code" :foundry "SAJA" :slant normal :weight semi-bold :height 113 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red" :height 2.0))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "orange" :height 1.8))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "yellow" :height 1.6))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green" :height 1.4))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "blue" :height 1.2))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "violet" :height 1.1))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "purple" :height 1.0))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "black" :height 0.9))))
 '(rainbow-delimiters-unmatched-face ((t (:background "cyan" :height 0.8)))))


;; rainbow-delimiters-mode setup, with decreasing bracket size
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)



(use-package globalff
  :straight t
  :init
  )



;; currently not working
(setq visual-line-mode t)


;; newline mode --  https://stackoverflow.com/a/23589470

(setq whitespace-style '(face newline-mark))
(whitespace-mode t)
(setq whitespace-display-mappings
      '((newline-mark 10 [172 10])))
(add-hook 'prog-mode-hook
          (lambda ()
            (whitespace-newline-mode t)))
(global-whitespace-newline-mode)


;; directory/file navigation
;; https://github.com/lewang/flx
(use-package ido
  :straight t
  :init
  )

(use-package flx-ido
  :straight t
  :init
  )

(use-package ido-hacks
  :straight t
  :init
  )

(use-package ido-vertical-mode
  :straight t
  :init
  )

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq gc-cons-threshold 20000000)

;;;;; end file/directory navigation ;;;;;;;;;;;


;; https://github.com/technomancy/better-defaults
(use-package better-defaults
  :straight t
  :init)


;;;;;;;;;;;;;;;;;;;;;;;;;; M-x enhancements ;;;;;;;;;;;;;;;;;;;;;;;;;;
;============= turning it off due to very heavy cpu usage ============
;; https://github.com/nonsequitur/smex
;; (straight-use-package '(smex  :type git  :host github  :repo "nonsequitur/smex"))
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;=====================================================================

;;lnmd' matches 'line-number-mode'. C-s/C-r switches to the next/previous match. Enter executes the selected command.
;; C-h f, while Smex is active, runs describe-function on the currently selected command.

;; M-. jumps to the definition of the selected command.

;; C-h w shows the key bindings for the selected command. (Via where-is.)

;;;;;;;;;;;;;;;;;;;;;;;; end M-x enhancements ;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;; volatile-highlights ;;;;;;;;;;;;;;;;;;;;;;;;;
;;https://github.com/k-talo/volatile-highlights.el
;; which brings visual feedback to some operations by highlighting portions relating to the operations.
(use-package volatile-highlights
  :straight t
  :init)
;;;;;;;;;;;;;;;;;;;;;; end volatile-highlights ;;;;;;;;;;;;;;;;;;;;;;;


;;;;TBD;;
;;markdown-mode, markdown-mode+, markdown-preview-mode
;;google-this
;; kaolin-themes, gruvbox-theme, solarized-theme, dark-mint-theme, material-theme, leuven-ther, zenburn-theme, 
;;tab-group, tabbar-ruler,
;;eww-lnum, markdown-preview-eww
;;shrface
;; magit,
;; ein : emacs-ipython-notebook (not required)
;;, semi -- not-sure about it
;; zygospore lets you revert C-x 1 (delete-other-window) by pressing C-x 1 again : not needed
;;  undo-tree, iedit, dtrt-indent, clean-aindent-mode anzu
;; 

;;; Todo: seems useful but has annoying highlighting in top bar
;; (use-package tab-group
;;   :straight t
;;   :init)

;; (use-package tabbar
;;   :straight t
;;   :init)

;; (use-package tabbar-ruler
;;   :straight t
;;   :init)


;; (tabbar-mode t)

;;(global-linum-mode t)


;; something about eww not able to access port 433

;;; tabs again
;;(straight-use-package '(awesome-tab  :type git  :host github  :repo "manateelazycat/awesome-tab"))

(use-package key-chord
  :straight t
  :init
  )
(key-chord-mode t)


(use-package awesome-tab
    :straight (:host github :repo "manateelazycat/awesome-tab")
    )
(require 'awesome-tab)
(awesome-tab-mode t)

(key-chord-define-global "ab" 'awesome-tab-backward-tab)
(key-chord-define-global "af" 'awesome-tab-forward-tab)

(key-chord-define-global "a;" 'awesome-tab-backward-group)
(key-chord-define-global "a." 'awesome-tab-forward-group)


(use-package gnutls
  :straight t
  :init)

(require 'gnutls)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;;use mobile version of websites
(setq url-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")




(key-chord-define-global "yc" 'avy-goto-char-2)
(key-chord-define-global "yl" 'avy-goto-line)
(key-chord-define-global "yw" 'avy-goto-word-1)

(defun insertspace ()
  "Insert space"
  (interactive)
  (insert " ")) 
   
(key-chord-define-global ";;" 'insertspace)
(key-chord-define-global "jj" 'save-buffer)
(key-chord-define-global "uu" 'grep-find)
(key-chord-define-global "mm" 'set-mark-command)
(key-chord-define-global "yy" 'kill-ring-save)

(key-chord-define-global "qq" 'backward-delete-char-untabify)
(key-chord-define-global "gg" 'other-window)
(key-chord-define-global ",," 'point-to-register)
(key-chord-define-global ".." 'jump-to-register)
(key-chord-define-global "cc" 'comment-or-uncomment-region)


;; TBD org-mode binding
(global-set-key [f1] 'previous-multiframe-window)  ;; not working as expected
(global-set-key [f2] 'next-multiframe-window)

(key-chord-define-global "pw" 'previous-multiframe-window)

(use-package yaml-mode
  :straight t
  :init)


;;dtache run commands outside of emacs
;; unable to install via straight
;; openbsd doesn't seem to have dtache
;; (use-package dtache
;;   :hook (after-init . dtache-setup)
;;   :bind (([remap async-shell-command] . dtache-shell-command)))

;; (use-package dtache-shell
;;   :straight
;;   :after dtache
;;   :config
;;   (dtache-shell-setup)
;;   (setq dtache-shell-history-file "~/.bash_history"))
