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

(provide 'dired-b2f)
