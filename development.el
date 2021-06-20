;;; general

;; https://www.seas.upenn.edu/~chaoliu/2017/09/01/python-programming-in-emacs/
;; https://emacsredux.com/blog/2021/04/19/configuring-minibuffer-completion-in-projectile/
;; https://docs.projectile.mx/projectile/usage.html
;;https://www.reddit.com/r/emacs/comments/ijmgtx/tip_how_to_use_a_stable_and_fast_environment_to/

(use-package line-comment-banner
  :straight t
  :init
  )
(global-set-key (kbd "C-;") 'line-comment-banner)
(use-package ggtags
  :straight t
  :init
  )

(add-hook 'python-mode-hook 'gtags-mode)
(dolist (map (list ggtags-mode-map))
  (define-key map (kbd "C-c g s") 'ggtags-find-other-symbol)
  (define-key map (kbd "C-c g h") 'ggtags-view-tag-history)
  (define-key map (kbd "C-c g r") 'ggtags-find-reference)
  (define-key map (kbd "C-c g f") 'ggtags-find-file)
  (define-key map (kbd "C-c g c") 'ggtags-create-tags)
  (define-key map (kbd "C-c g u") 'ggtags-update-tags)
 ;; (define-key map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
  (define-key map (kbd "M-.") 'ggtags-find-tag-dwim)
  (define-key map (kbd "M-,") 'pop-tag-mark)
  (define-key map (kbd "C-c <") 'ggtags-prev-mark)
  (define-key map (kbd "C-c >") 'ggtags-next-mark))


(use-package projectile
  :straight t
  :init
  )

(use-package counsel-projectile
  :straight t
  :init
  (counsel-projectile-mode
   )
  )
;; https://docs.projectile.mx/projectile/configuration.html
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-sort-order 'recently-active)
(setq projectile-completion-system 'ido)
(key-chord-define-global "pf" 'projectile-find-file)


;;TBD
;; (use-package counsel
;;   :bind
;;   (("M-x" . counsel-M-x)
;;    ("M-y" . counsel-yank-pop)
;;    ("C-c r" . counsel-recentf)
;;    ("C-x C-f" . counsel-find-file)
;;    ("<f1> f" . counsel-describe-function)
;;    ("<f1> v" . counsel-describe-variable)
;;    ("<f1> l" . counsel-load-library)
;;    ("C-h f" . counsel-describe-function)
;;    ("C-h v" . counsel-describe-variable)
;;    ("C-h l" . counsel-load-library)))
;; https://github.com/galsterGH/Emacs-configs/blob/master/setup-editing.el
;;;
;; https://github.com/rememberYou/.emacs.d/blob/master/config.org#python ;;blacken;isort, pyenve, etc

;; (defhydra hydra-projectile (:color blue)
;;   "
;;   ^
;;   ^Projectile^        ^Buffers^           ^Find^              ^Search^
;;   ^──────────^────────^───────^───────────^────^──────────────^──────^────────────
;;   _q_ quit            _b_ list            _d_ directory       _r_ replace
;;   _i_ reset cache     _k_ kill all        _D_ root            _R_ regexp replace
;;   ^^                  _S_ save all        _f_ file            _s_ search
;;   ^^                  ^^                  _p_ project         ^^
;;   ^^                  ^^                  ^^                  ^^
;;   "
;;   ("q" nil)
;;   ("b" counsel-projectile-switch-to-buffer)
;;   ("d" counsel-projectile-find-dir)
;;   ("D" projectile-dired)
;;   ("f" counsel-projectile-find-file)
;;   ("i" projectile-invalidate-cache :color red)
;;   ("k" projectile-kill-buffers)
;;   ("p" counsel-projectile-switch-project)
;;   ("r" projectile-replace)
;;   ("R" projectile-replace-regexp)
;;   ("s" counsel-rg)
;;   ("S" projectile-save-project-buffers))
;; https://www.seas.upenn.edu/~chaoliu/2017/09/01/python-programming-in-emacs/

;; https://elpy.readthedocs.io/en/latest/ide.html#profiling  ;; refactoring, profiling, etc
;;;;;;;;;;;;;;;;
;; python ide ;;
;;;;;;;;;;;;;;;;

(use-package company
  :straight t
  :init
  )
(use-package company-jedi
  :straight t
  :init
  )
(use-package flycheck
  :straight t
  :init
  )
(add-hook 'after-init-hook 'global-flycheck-mode)
;;(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

;;(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)


(use-package py-autopep8
  :straight t
  :init
  )
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)


(use-package pyvenv
  :straight t
  :init
  )

(use-package elpy
    :straight t
    :bind
    (:map elpy-mode-map
          ("C-M-n" . elpy-nav-forward-block)
          ("C-M-p" . elpy-nav-backward-block))
    :hook ((elpy-mode . flycheck-mode)
           (elpy-mode . (lambda ()
                          (set (make-local-variable 'company-backends)
                               '((elpy-company-backend :with company-yasnippet))))))
    :init
    (elpy-enable)
    :config
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    ; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
    (setq elpy-shell-echo-output nil)
    (setq elpy-rpc-python-command "python3")
    (setq elpy-rpc-timeout 2))


(use-package company
  :straight t
  :diminish company-mode
  :init
  (global-company-mode)
  :config
  ;; set default `company-backends'
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf)  ; completion-at-point-functions
          (company-abbrev company-dabbrev)
          ))
(use-package company-statistics
    :straight t
    :init
    (company-statistics-mode))
(use-package company-web
    :straight t)
(use-package company-try-hard
    :straight t
    :bind
    (("C-<tab>" . company-try-hard)
     :map company-active-map
     ("C-<tab>" . company-try-hard)))
(use-package company-quickhelp
    :straight t
    :config
    (company-quickhelp-mode))
)



(use-package buftra
    :straight (:host github :repo "humitos/buftra.el"))
(use-package py-pyment
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :config
    (setq py-pyment-options '("--output=numpydoc")))
(use-package py-isort
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-isort-enable-on-save)
    :config
    (setq py-isort-options '("--lines=88" "-m=3" "-tc" "-fgw=0" "-ca")))
(use-package py-autoflake
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-autoflake-enable-on-save)
    :config
    (setq py-autoflake-options '("--expand-star-imports")))
(use-package py-docformatter
    :straight (:host github :repo "humitos/py-cmd-buffer.el")
    :hook (python-mode . py-docformatter-enable-on-save)
    :config
    (setq py-docformatter-options '("--wrap-summaries=88" "--pre-summary-newline")))
(use-package blacken
    :straight t
    :hook (python-mode . blacken-mode)
    :config
    (setq blacken-line-length '88))
(use-package python-docstring
    :straight t
    :hook (python-mode . python-docstring-mode))

(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'company-jedi-setup)

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(key-chord-define-global "jd" 'jedi:goto-definition)
(setq elpy-rpc-backend "jedi") ;;elpy-jedi integration not working


;; use ipython3
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i")

;;;;;;;;;;;;;;;;;;;;;;;;;
;; end python settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;
