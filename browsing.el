(use-package sx
  :straight t
  :init
  )

(key-chord-define-global "qs" 'my-get-stackoverflow-answers)

(use-package google-this
  :straight t
  :init
  )

(google-this-mode 1)

(key-chord-define-global "qg" 'google-this-search)


(defun eww-new ()
  (interactive)
  (let ((url (read-from-minibuffer "Enter URL or keywords: ")))
    (switch-to-buffer (generate-new-buffer "eww"))
    (eww-mode)
    (eww url)))
(key-chord-define-global "wn" 'eww-new)

;; gold mine: https://protesilaos.com/dotemacs/


;; navigating links in eww
(use-package ace-link
  :straight t
  :init
  )

(ace-link-setup-default)

;;(define-key org-mode-map (kbd "M-o") 'ace-link-org)

;; eww and org mode
(use-package org
  :straight t
  :init
  )

;; (require 'format-spec)
;; (require 'org-macs)

;; (require 'org-compat)
(add-to-list 'load-path "~/eww_emacs.d/custom")
(use-package ol
  )

(require 'ol)


(use-package ol-eww
  )

(require 'ol-eww)
(key-chord-define-global "eo" 'org-eww-copy-for-org-mode)

(defun endless/toggle-image-display ()
  "Toggle images display on current buffer."
  (interactive)
  (setq endless/display-images
        (null endless/display-images))
  (endless/backup-display-property endless/display-images))

(defun endless/backup-display-property (invert &optional object)
  "Move the 'display property at POS to 'display-backup.
Only applies if display property is an image.
If INVERT is non-nil, move from 'display-backup to 'display
instead.
Optional OBJECT specifies the string or buffer. Nil means current
buffer."
  (let* ((inhibit-read-only t)
         (from (if invert 'display-backup 'display))
         (to (if invert 'display 'display-backup))
         (pos (point-min))
         left prop)
    (while (and pos (/= pos (point-max)))
      (if (get-text-property pos from object)
          (setq left pos)
        (setq left (next-single-property-change pos from object)))
      (if (or (null left) (= left (point-max)))
          (setq pos nil)
        (setq prop (get-text-property left from object))
        (setq pos (or (next-single-property-change left from object)
                      (point-max)))
        (when (eq (car prop) 'image)
          (add-text-properties left pos (list from nil to prop) object))))))

;;https://emacs.stackexchange.com/questions/5889/how-to-highlight-text-permanently-in-org-mode
(setq org-emphasis-alist
  '(("*" (bold :foreground "Orange" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("+" (:strike-through t))))

(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "/home/kabira/Development/WebpageReadablePipeline/org/"
         :base-extension "org"
         :publishing-directory "/home/kabira/Development/WebpageReadablePipeline/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )
       ;; ... add all the components here (see below)...
        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "/home/kabira/Development/WebpageReadablePipeline/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))



;;; TBD
;; (require 'elisp-slime-nav)
;; (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
;;   (add-hook hook 'elisp-slime-nav-mode))
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
 
