(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 最近打开的文件
(recentf-mode)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 130)

(setq auto-save-default nil)
(setq make-backup-files nil)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux"
      c-basic-offset 4)

(delete-selection-mode 1)

(if (featurep 'cocoa)
    (progn
      (setq ns-use-native-fullscreen nil)
      (setq ns-use-fullscreen-animation nil)

      (set-frame-parameter (selected-frame) 'fullscreen 'maximized)

      (run-at-time "2sec" nil
                   (lambda ()
                     (toggle-frame-fullscreen)
                     )))
  (require 'fullscreen)
  (fullscreen))


;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'my-packages)
(require 'my-keybindings)
; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(org-agenda-files
;    (quote
;     ("~/OneDrive/resource/600-todo/gtd.org" "~/OneDrive/resource/600-todo/someday.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-blue ((t (:foreground "light green")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-use-ls-dired nil)
 '(package-selected-packages
   (quote
    (ivy-xref yaml-mode markdown-mode treemacs-magit neotree treemacs-evil rainbow-delimiters highlight-parentheses treemacs ranger benchmark-init exec-path-from-shell evil evil-leader use-package dashboard ripgrep magit evil-magit company company-go posframe ivy ivy-posframe projectile counsel-projectile switch-window symbol-overlay all-the-icons srcery-theme company smooth-scrolling hungry-delete swiper counsel smartparens popwin org org-bullets go-mode python-mode eglot eldoc-box))))
