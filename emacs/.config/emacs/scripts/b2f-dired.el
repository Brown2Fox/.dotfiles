;; -*- lexical-binding: t; -*-
(defun b2f/dired-move-item-up ()
  "Move dired item down in buffer."
  (interactive)
  (unless (dired-get-filename nil t)
    (error "Not a dired draggable item"))
  (when (= (line-number-at-pos) 2)
    (error "Already at top"))
  (let* ((inhibit-read-only t)
         (col (current-column))
         (item-start (line-beginning-position))
         (item-end (1+ (line-end-position)))
         (item (buffer-substring item-start item-end)))
    (delete-region item-start item-end)
    (forward-line -1)
    (beginning-of-line)
    (insert item)
    (forward-line -1)
    (move-to-column col))
)

(defun b2f/dired-move-item-down ()
  "Move dired item down in buffer."
  (interactive)
  (unless (dired-get-filename nil t)
    (error "Not a dired draggable item"))
  (when (save-excursion
          (forward-line 1)
          (eobp))
    (error "Already at bottom"))
  (let* ((inhibit-read-only t)
         (col (current-column))
         (item-start (line-beginning-position))
         (item-end (1+ (line-end-position)))
         (item (buffer-substring item-start item-end)))
    (delete-region item-start item-end)
    (forward-line 1)
    (beginning-of-line)
    (insert item)
    (forward-line -1)
    (move-to-column col))
)

(defun b2f/dired-from-marked-items ()
  "Create a new dired buffer containing only the marked files.
  Also allow dragging items up and down via M-<up> and M-x<down>."
  (interactive)
  (let ((marked-files (dired-get-marked-files))
        (buffer-name (generate-new-buffer-name
                      (format "*%s (selection)*"
                              (file-name-nondirectory
                               (directory-file-name default-directory))))))
    (unless marked-files
      (error "No dired marked files"))
    (dired (cons buffer-name
                 (mapcar (lambda (path)
                           (file-relative-name path default-directory))
                         marked-files))))
)

(defun b2f/dired-refresh-preview ()
  (when dired-preview-global-mode
    (dired-preview-mode -1)
    (dired-preview-mode 1)))

(defun b2f/dired-enter-directory ()
  "Enter directory under cursor, do nothing if it's a file."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (when (file-directory-p file)
      (dired-find-file)
      (b2f/dired-refresh-preview))))

(defun b2f/dired-up-directory ()
  (interactive)
  (dired-up-directory)
  (b2f/dired-refresh-preview))

(defun b2f/dired-create-file-or-dir (name)
  "Create file or directory in current dired directory.
If NAME ends with /, create a directory; otherwise create a file."
  (interactive "sCreate (end with / for dir): ")
  (let ((path (expand-file-name name (dired-current-directory))))
    (if (string-suffix-p "/" name)
        (make-directory path t)
      (unless (file-exists-p path)
        (make-empty-file path t)))
    (revert-buffer)
    (dired-goto-file (if (string-suffix-p "/" name)
                         (directory-file-name path)
                       path))))

(defun b2f/dired-jump ()
    "Open Dired inplace"
    (interactive)
    (dired-jump)
  )

(defun b2f/dired-jump-v ()
    "Open Dired in new vertical split"
    (interactive)
    (evil-window-vsplit)
    (dired-jump)
  )

(defun b2f/dired-jump-h ()
    "Open Dired in new horizontal split"
    (interactive)
    (evil-window-split)
    (dired-jump)
  )

(provide 'b2f-dired)
