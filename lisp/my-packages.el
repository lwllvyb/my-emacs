(require 'cl)
(require 'use-package)

(evil-mode 1)
(global-evil-leader-mode)
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

;;(add-to-list 'load-path "~/.emacs.d/packages/snails") ; add snails to your load-path
;;(require 'snails)
;;(snails '(snails-backend-recentf snails-backend-projectile))

;;==========================================================================
;; auto save desktop status
(desktop-save-mode 1)
;;==========================================================================
; (add-to-list 'load-path "~/.emacs.d/packages/projectile") ; add snails to your load-path
(require 'projectile)
(require 'ivy)
(require 'counsel-projectile)
(counsel-projectile-mode 1)

;; projectile
(setq projectile-project-search-path '("~/work"))

(defun my-switch-project-hook ()
  "Perform some action after switching Projectile projects."
  (message "Project changed...")
  ;; Do something interesting here...
  ;;
  ;; `projectile-current-project-files', and `projectile-current-project-dirs' can be used
  (setenv "GOPATH" 'projectile-current-project-dirs)
  ;; to get access to the new project's files, and directories.
  )
(defun lwl/projectile-after-switch-action()
  (projectile-project-p (projectile-project-root))
  (setq desktop-dir "~/.emacs.d/.desktop/")
  (message (concat "after action: " (projectile-project-root)))
  (setq desktop-project-dir (concat desktop-dir (projectile-project-name) "/"))
  (make-directory desktop-project-dir t)
  (setq desktop-project-file (concat desktop-project-dir ".emacs.desktop"))
  (message (concat "before:" desktop-project-file))
  (cond 
	((file-exists-p desktop-project-file)
		(message (concat "exist:" desktop-project-file))
		)
	(t 
		(desktop-save desktop-project-dir)
		)
	)
  (message (concat "after:" desktop-project-dir))
  (desktop-read desktop-project-file)

  ; (desktop-change-dir desktop-project-dir)
  )
(defun lwl/nil()
  (message (concat "nil action: " (projectile-project-root)))
  (projectile-project-p (projectile-project-root))
  )
(counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("." dired
           "open ‘dired’ at the root of the project")
          1)))

(defun lwl-tmp()
  	(interactive)
	(let* ((b (get-buffer "hulk_crash.org")))
	  (if b
        (progn
          (switch-to-buffer-other-frame b))
  		(switch-to-buffer-other-frame (find-file "~/work/tmp/hulk_crash.org")))))


; (setq projectile-switch-project-action 'lwl/projectile-after-switch-action)
; (add-hook 'projectile-find-file-hook 'lwl/projectile-after-switch-action)
(add-hook 'projectile-after-switch-project-hook 'lwl/projectile-after-switch-action)

;;==========================================================================
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

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-show-tab-index t)
(global-set-key (kbd "s-1") 'awesome-tab-backward-tab)
(global-set-key (kbd "s-2") 'awesome-tab-forward-tab)

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

;;==========================================================================
(require 'org)
(setq org-src-fontify-natively t)

;;==========================================================================
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq inhibit-compacting-font-caches t)


;;==========================================================================
;; symbol-overlay
(let ((map (make-sparse-keymap)))
  (define-key map (kbd "n") 'symbol-overlay-jump-next)
  (define-key map (kbd "p") 'symbol-overlay-jump-prev)
  (setq symbol-overlay-map map))
(setq symbol-overlay-map (make-sparse-keymap))

;;==========================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)

;;==========================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/all-the-icons.el"))
(require 'all-the-icons)

;;==========================================================================
(require 'ivy-posframe)
;; display at `ivy-posframe-style'
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
(ivy-posframe-mode 1)

;;==========================================================================
;;(require 'eldoc-box)
;;==========================================================================
 (setq org-agenda-files
   (quote
    ("~/OneDrive/resource/600-todo/gtd.org" "~/OneDrive/resource/600-todo/someday.org")))
(setq org-capture-templates
      '(("g" "GTD" entry (file+headline "~/OneDrive/resource/600-todo/gtd.org" "工作安排")
			"* TODO [#B] %?\n  %i\n"
			:empty-lines 1)
		("s" "someday" entry (file+headline "~/OneDrive/resource/600-todo/someday.org" "some day")
                               "* TODO [#C] %U %i%?" :empty-lines 1)
		))
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "BLOCKED" "DONE")))
;; 设置关键字的字体颜色
(setq org-todo-keyword-faces
   (quote (("TODO" :foreground "red" :weight bold)
           ("DOING" :foreground "yellow" :weight bold)
           ("BLOCKED" :foreground "red" :weight bold)
           ("DONE" :foreground "forest green" :weight bold)
           )))


(setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "project")
            (tags-todo "daily")
            (tags-todo "weekly")
            (tags-todo "school")
            (tags-todo "code")
            (tags-todo "theory")
            ))
          ))
;;==========================================================================
;; 文件末尾
(provide 'my-packages)
