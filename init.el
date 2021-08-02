(when (version< emacs-version "27.0") (package-initialize))



; (add-to-list 'load-path "~/.emacs.d/packages/benchmark-init-el") ; add nox to your load-path
; (let (
;       ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
;       (gc-cons-threshold most-positive-fixnum)
;       ;; 清空避免加载远程文件的时候分析文件。
;       (file-name-handler-alist nil))
;   (require 'benchmark-init-modes)
;   (require 'benchmark-init)
;   (benchmark-init/activate)
;
;     ;; 下面才写你的其它配置
; )

;; Package Management
;; -----------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-startup)
(require 'init-packages)
(require 'init-basic)
(require 'my-packages)
(require 'my-keybindings)
(require 'init-ui)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-company)
(require 'init-eaf)
(require 'init-private)
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
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white"))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande" :height 2.0 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Lucida Grande")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-align-annotations t)
 '(custom-safe-themes
   '("f4876796ef5ee9c82b125a096a590c9891cec31320569fc6ff602ff99ed73dca" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "835d5718b4457591384aac56ce76ab2230813388459d8353e5602b3fa5d1ece7" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" default))
 '(dired-posframe-size-limit 104857600 t)
 '(dired-use-ls-dired nil)
 '(emojify-emojis-dir "~/.emacs.d/var/emojis")
 '(package-selected-packages
   '(org-roam ivy-yasnippet find-file-in-project company-ctags lsp-mode fzf meow chocolate-theme all-the-icons-ivy-rich shell-command+ company-statistics nyan-mode modus-operandi-theme tabbar centaur-tabs beacon which-key doom-themes gotest tao-theme yasnippet-snippets evil-smartparens yasnippet rust-mode go-complete evil-nerd-commenter cider protobuf-mode plantuml-mode counsel-etags graphviz-dot-mode doom-modeline ivy-xref yaml-mode markdown-mode treemacs-magit neotree treemacs-evil rainbow-delimiters highlight-parentheses treemacs ranger benchmark-init exec-path-from-shell evil evil-leader use-package dashboard ripgrep magit evil-magit company company-go posframe ivy ivy-posframe projectile counsel-projectile switch-window symbol-overlay all-the-icons srcery-theme company smooth-scrolling swiper counsel smartparens popwin org org-bullets go-mode python-mode eldoc-box))
 '(posframe-mouse-banish nil)
 '(safe-local-variable-values
   '((eval progn
           (require 'find-file-in-project)
           (setq ffip-prune-patterns
                 `("*/.ccls-cache" ,@ffip-prune-patterns))
           (setq ffip-prune-patterns
                 `(delete "*/bin" ,@ffip-prune-patterns)))))
 '(which-key-popup-type 'side-window))
