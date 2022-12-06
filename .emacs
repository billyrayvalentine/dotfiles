;; Load stuff in here 
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; Enable https://github.com/purcell/emacs-hcl-mode
(require 'hcl-mode) 

;; disable menu
(menu-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "brightcyan"))))
 '(font-lock-function-name-face ((t (:foreground "brightcyan" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "brightyellow"))))
 '(font-lock-string-face ((t (:foreground "brightmagenta"))))
 '(font-lock-type-face ((t (:foreground "green" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "white")))))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil))
