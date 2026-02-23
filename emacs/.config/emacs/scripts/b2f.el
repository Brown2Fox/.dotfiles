;; -*- lexical-binding: t; -*-
;; Kill other buffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc #'(lambda (buf) (if (not (equal buf (current-buffer))) (kill-buffer buf))) (buffer-list))
)

(defun pp-path-env-var ()
  "Path Pretty Print: Display current PATH environment variable in a formatted temporary buffer."
  (interactive)
  (let* ((path-str (getenv "PATH"))
         (path-list (when path-str (split-string path-str path-separator)))
         (buf-name "*PATH*"))

    (if (not path-str)
        (message "PATH environment variable is not set")
      (with-current-buffer (get-buffer-create buf-name)
        (let ((inhibit-read-only t))  ; Temporarily disable read-only
          (erase-buffer)
          (insert "=== Current PATH Environment Variable ===\n\n")
          (insert (format "Total directories: %d\n\n" (length path-list)))

          (dolist (path-item path-list)
            (insert (format "%s;\n" path-item)))

          (insert "\n--- End of PATH ---\n")
          (goto-char (point-min))))

      (display-buffer buf-name)))
)

(defun transparent(alpha-level no-focus-alpha-level)
  "Let's you make the window transparent"
  (interactive "nAlpha level (0-100): \nnNo focus alpha level (0-100): ")
  (set-frame-parameter (selected-frame) 'alpha (list alpha-level no-focus-alpha-level))
  (add-to-list 'default-frame-alist `(alpha ,alpha-level))
)

(provide 'b2f)
