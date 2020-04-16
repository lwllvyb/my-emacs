;; auto save desktop status
(desktop-save-mode 1)
(require 'use-package)
;;==========================================================================
(defcustom centaur-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set Centaur logo. nil means official logo."
  :group 'centaur
  :type 'string)
(defcustom centaur-icon (display-graphic-p)
  "Display icons or not."
  :group 'centaur
  :type 'boolean)
(defun dashboard-goto-recent-files ()
      "Go to recent files."
      (interactive)
      (let ((func (local-key-binding "r")))
        (and func (funcall func))))
;;==========================================================================
;; dashboard
; (require 'dashboard)
; (dashboard-setup-startup-hook)
; (use-package dashboard
;   :ensure t
;   :config
;   (dashboard-setup-startup-hook))
; (setq dashboard-startup-banner 3)
; (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard"
;       dashboard-startup-banner  1
;       dashboard-center-content t
;       dashboard-show-shortcuts nil
;       dashboard-items '((recents  . 10)
;                         (bookmarks . 5)
;                         (projects . 5))
;
;       dashboard-set-init-info t
;       dashboard-set-file-icons centaur-icon
;       dashboard-set-heading-icons centaur-icon
;       dashboard-heading-icons '((recents   . "file-text")
;                                 (bookmarks . "bookmark")
;                                 (agenda    . "calendar")
;                                 (projects  . "briefcase")
;                                 (registers . "database"))
;       )
;
; ;; Jump to the first section
;       (dashboard-goto-recent-files)

;;(setq dashboard-set-heading-icons t)
;;(setq dashboard-set-file-icons t)

(load-theme 'srcery t)

(require 'ivy)
(require 'counsel-projectile)
(counsel-projectile-mode 1)

;; projectile
(require 'projectile)
(setq projectile-project-search-path '("~/work"))

(evil-mode 1)
(global-evil-leader-mode)
(add-to-list 'load-path "~/.emacs.d/packages/snails") ; add snails to your load-path
;;(require 'snails)
;;(snails '(snails-backend-recentf snails-backend-projectile))


(defun my-switch-project-hook ()
  "Perform some action after switching Projectile projects."
  (message "Project changed...")
  ;; Do something interesting here...
  ;;
  ;; `projectile-current-project-files', and `projectile-current-project-dirs' can be used
  (setenv "GOPATH" 'projectile-current-project-dirs)
  ;; to get access to the new project's files, and directories.
  )

;;(add-hook 'projectile-after-switch-project-hook #'my-switch-project-hook)

(setenv "GOPATH" "/Users/lesswish/work/mebs")

;;(add-to-list 'load-path "~/.emacs.d/packages/nox") ; add nox to your load-path
;;(require 'nox)

;;(dolist (hook (list
  ;              'go-mode-hook
  ;              'rust-mode-hook
  ;              'python-mode-hook
  ;              'sh-mode-hook
  ;              'c-mode-common-hook
  ;              'c-mode-hook
  ;              'c++-mode-hook
  ;              ))
  ; (add-hook hook '(lambda () (nox-ensure))))

(require 'eglot)
(set eglot-put-doc-in-help-buffer nil)
(setq eglot-auto-display-help-buffer nil)

; (add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/awesome-tab"))
; (require 'awesome-tab)
; (awesome-tab-mode t)
; (setq awesome-tab-show-tab-index t)
; (global-set-key (kbd "s-1") 'awesome-tab-backward-tab)
; (global-set-key (kbd "s-2") 'awesome-tab-forward-tab)

(dolist (hook (list
			   'go-mode-hook
			   'rust-mode-hook
			   'python-mode-hook
			   'sh-mode-hook
			   'c-mode-common-hook
			   'c-mode-hook
			   'c++-mode-hook
			   ))
  (add-hook hook '(lambda () (eglot-ensure))))

(require 'evil-magit)

(add-hook 'after-init-hook 'global-company-mode)
(require 'company)
(require 'company-go)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .2)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(require 'switch-window)

(require 'org)
(setq org-src-fontify-natively t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq inhibit-compacting-font-caches t)
;; 文件末尾
(provide 'my-packages)
