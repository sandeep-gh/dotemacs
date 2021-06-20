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

(key-chord-define-global "qg" 'eww-new)


(defun eww-new ()
  (interactive)
  (let ((url (read-from-minibuffer "Enter URL or keywords: ")))
    (switch-to-buffer (generate-new-buffer "eww"))
    (eww-mode)
    (eww url)))
(key-chord-define-global "wn" 'eww-new)


;; navigating links in eww
(use-package ace-link
  :straight t
  :init
  )

(ace-link-setup-default)

;;(define-key org-mode-map (kbd "M-o") 'ace-link-org)
