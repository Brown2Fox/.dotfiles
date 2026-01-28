;; Don't flicker GUI elements on startup
(setq default-frame-alist
      '((font . "Lilex Nerd Font")
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars)))

;; (toggle-frame-maximized)

;; (setq default-frame-alist '((background-color . "#181818")))
;; (add-to-list 'initial-frame-alist '(background-color . "#000000"))

;; We're using straight.el instead of package.el, no need to load it
(setq package-enable-at-startup nil)
