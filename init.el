(when (version< emacs-version "27.0") (package-initialize))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
;;(global-linum-mode 1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 最近打开的文件
(recentf-mode)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 130)

(setq auto-save-default nil)
(setq make-backup-files nil)



(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "linux"
      c-basic-offset 4)

(delete-selection-mode 1)

;; (if (featurep 'cocoa)
;;     (progn
;;       (setq ns-use-native-fullscreen nil)
;;       (setq ns-use-fullscreen-animation nil)

;;       (set-frame-parameter (selected-frame) 'fullscreen 'maximized)

;;       (run-at-time "2sec" nil
;;                    (lambda ()
;;                      (toggle-frame-fullscreen)
;;                      )))
;;   (require 'fullscreen)
;;   (fullscreen))


;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-basic)
(require 'my-packages)
(require 'my-keybindings)
(require 'init-ui)
;;(require 'init-company)
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
 '(all-the-icons-blue ((t (:foreground "light green"))))
 '(company-box-annotation ((t (:inherit comapny-tooltip-annotation :foreground "blue"))) t)
 '(company-box-selection ((t (:inherit company-tooltip-selection :background "#288dee"))) t)
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes
   (quote
    ("835d5718b4457591384aac56ce76ab2230813388459d8353e5602b3fa5d1ece7" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" default)))
 '(dired-posframe-size-limit 104857600 t)
 '(dired-use-ls-dired nil)
 '(emojify-emojis-dir "~/.emacs.d/var/emojis")
 '(package-selected-packages
   (quote
    (meow chocolate-theme all-the-icons-ivy-rich shell-command+ company-statistics nyan-mode modus-operandi-theme tabbar centaur-tabs beacon which-key doom-themes gotest tao-theme yasnippet-snippets evil-smartparens yasnippet rust-mode go-complete evil-nerd-commenter cider protobuf-mode plantuml-mode counsel-etags graphviz-dot-mode doom-modeline ivy-xref yaml-mode markdown-mode treemacs-magit neotree treemacs-evil rainbow-delimiters highlight-parentheses treemacs ranger benchmark-init exec-path-from-shell evil evil-leader use-package dashboard ripgrep magit evil-magit company company-go posframe ivy ivy-posframe projectile counsel-projectile switch-window symbol-overlay all-the-icons srcery-theme company smooth-scrolling swiper counsel smartparens popwin org org-bullets go-mode python-mode eldoc-box)))
 '(posframe-mouse-banish nil)
 '(which-key-popup-type (quote side-window)))
