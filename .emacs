;; Load stuff in here                                                                                                         
(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; Enable https://github.com/purcell/emacs-hcl-mode                                                                           
(require 'hcl-mode)
(require 'rust-mode)

(use-package vterm
    :ensure t)

(setq inferior-lisp-program "/usr/bin/sbcl")

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
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(rust-mode pyvenv rainbow-delimiters rainbow-delimiters\  ## slime scala-mode)))

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

;; Set vterm to a key
(global-set-key (kbd "C-c v") 'vterm)
(setq vterm-max-scrollback 3000)
;; unset mail command which is uneeded
(global-unset-key (kbd "C-x m"))

;; use y/n over yes/no                                                                                                        
(defalias 'yes-or-no-p 'y-or-n-p)

;; disable auto save #YUCK#                                                                                                   
(setq auto-save-default nil)

;; enable save space  in file like vim                                                                                        
(save-place-mode 1)


;; Use generic-mode to create a simple mode for Gherkin                                                                       
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Generic-Modes.html                                               
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Faces-for-Font-Lock.html

(setq-default indent-tabs-mode nil)

(require 'generic-x)
(define-generic-mode 'gherkin-generic
  '("#")
  '("Feature" "Rule" "Example" "Scenario" "Given" "When" "Then" "And" "But" "Background" "Scenario Outline" "Scenario Templat\
e" "Examples" "Scenarios")
  '(("\\@" . 'font-lock-builtin))
  '("\\.feature$")
  nil
  "A generic mode for Gherkin"
)

(setq python-shell-interpreter "python3.11")

;; Emacs 29 - use tree sitter modes instead of old major modes
(setq major-mode-remap-alist
      '((js-json-mode . json-ts-mode)))

(require 'm68k-mode)
