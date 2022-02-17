;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add-on functions/keybindings to customize emacs behaviour  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message
   (if (let (window (get-buffer-window (current-buffer)))
     (set-window-dedicated-p window (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))
(global-set-key (kbd "C-c d") 'toggle-window-dedicated)

(defun green-ansi-term ()
  "Show an existing buffer called \"*ansi-term*\" if one exists, otherwise
call function ansi-term interactively."
  (interactive)
  (let ((existing-buffer (get-buffer "*ansi-term*")))
    (if existing-buffer
        (switch-to-buffer-other-frame existing-buffer)
      (call-interactively 'ansi-term))))

(global-set-key [f3] 'green-ansi-term)


;; shell 2 is for remote machine
(defun green-ansi-term2 ()
  "Show an existing buffer called \"*ansi-term*\" if one exists, otherwise
call function ansi-term interactively."
  (interactive)
  (let ((existing-buffer (get-buffer "*ansi-term*<2>")))
    (if existing-buffer
        (switch-to-buffer-other-frame existing-buffer)
      (call-interactively 'ansi-term))))

(global-set-key [f6] 'green-ansi-term2)


(defun green-eww ()
  "Show an existing buffer called \"*eww*\" if one exists, otherwise
call function eww interactively."
  (interactive)
  (let ((existing-buffer (get-buffer "*eww*")))
    (if existing-buffer
        (switch-to-buffer-other-frame existing-buffer)
      (call-interactively 'eww))))

(global-set-key [f4] 'green-eww)


(defun green-python ()
  "Show an existing buffer called \"*eww*\" if one exists, otherwise
call function eww interactively."
  (interactive)
  (let ((existing-buffer (get-buffer "*Python*")))
    (if existing-buffer
        (switch-to-buffer-other-frame existing-buffer)
      (call-interactively 'elpy-shell-switch-to-shell))))

(global-set-key [f5] 'green-python)



(defun er-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(key-chord-define-global "pb" #'er-switch-to-previous-buffer)

(key-chord-mode +1)


;; copy current file path to clipboard/kill ring.
(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

(key-chord-define-global "xp" #'xah-copy-file-path)
(key-chord-mode +1)
(key-chord-define-global "gf" 'globalff)

(key-chord-define-global "sb" 'ido-buffer-switch)
(key-chord-define-global "pf" 'projectile-find-file)
(key-chord-define-global "//" 'isearch-forward)
(key-chord-define-global "vl" 'visual-line-mode)

;;https://emacs.stackexchange.com/questions/37354/a-single-key-binding-for-several-commands

;;http://ergoemacs.org/emacs/elisp_examples.html
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (let ((pos (line-beginning-position)))
    (end-of-line)
    (set-mark pos)))
;; http://ergoemacs.org/emacs/elisp_basics.html
