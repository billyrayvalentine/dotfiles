;; Load stuff in here                                                                                                         
(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Enable https://github.com/purcell/emacs-hcl-mode                                                                           
(require 'hcl-mode)

(use-package vterm
    :ensure t)

(load (expand-file-name "~/quicklisp/slime-helper.el"))                           
(setq inferior-lisp-program "sbcl")      


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
 '(font-lock-variable-name-face ((t (:foreground "white"))))

 '(rainbow-delimiters-depth-1-face ((t (:foreground "white"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "sienna1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Pimp up the mode line                                                                                                      
(set-face-foreground 'mode-line "white")
(set-face-background 'mode-line "dark blue")
(set-face-background 'mode-line-inactive "brightblack")

;; Taken from https://github.com/abrochard/emacs-config/blob/2928a15d3352edc711fb954570c60e0ac6153840/configuration.org#L734
(set-face-background 'mode-line "#4692d5")
(set-face-background 'mode-line-inactive "#212020")

;; Disable auto backups e.g. file~                                                                                            
(setq make-backup-files nil)

;; Make meta-o other window                                                                                                   
;; unset a key                                                                                                                
(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'other-window)

;; unset mail command which is uneeded
(global-unset-key (kbd "C-x m"))

;; use y/n over yes/no                                                                                                        
(defalias 'yes-or-no-p 'y-or-n-p)

;; disable auto save #YUCK#                                                                                                   
(setq auto-save-default nil)

;; enable save space  in file like vim                                                                                        
(save-place-mode 1)

(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages '(rainbow-delimiters vterm slime)))
