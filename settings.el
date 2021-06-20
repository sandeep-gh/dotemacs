;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; universal packages and configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "Bits" :slant normal :weight normal :height 128 :width normal))))
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

(use-package key-chord
  :straight t
  :init
  )
(key-chord-mode t)

(use-package origami
  :straight t
  :init
  )
(key-chord-define-global "ft" 'origami-recursively-toggle-node)
(key-chord-define-global "fn" 'origami-show-only-node)


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
;; disable ido faces to see flx highlights.
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

;; https://github.com/nonsequitur/smex
(straight-use-package '(smex  :type git  :host github  :repo "nonsequitur/smex"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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




;;(tabbar-mode t)

;;(global-linum-mode t)


;; something about eww not able to access port 433
;;(require 'tls)
;;(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;;use mobile version of websites
;;(setq url-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")





(key-chord-define-global "v2" 'avy-goto-char-2)
(key-chord-define-global "vl" 'avy-goto-line)
(key-chord-define-global "vw" 'avy-goto-word-1)
;; TBD org-mode binding
