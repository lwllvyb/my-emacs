;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives 
      	'(("melpa-cn" . "~/OneDrive/bin/emacs_plugins/melpa/")
       	("org-cn"   . "~/OneDrive/bin/emacs_plugins/org/")
       	("gnu-cn"   . "~/OneDrive/bin/emacs_plugins/gnu/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
			   benchmark-init
			   exec-path-from-shell
			   evil
			   evil-leader
			   use-package
			   dashboard
			   ripgrep
			   magit
			   evil-magit
			   company
			   company-go
			   posframe
			   ivy
			   ivy-posframe
			   projectile
			   counsel-projectile
			   switch-window
			   symbol-overlay
			   
				;; theme
			   srcery-theme
			   ;; --- Auto-completion ---
			   company
			   ;; --- Better Editor ---
			   smooth-scrolling
			   hungry-delete
			   swiper
			   counsel
			   smartparens
			   popwin
			   ;; --- Major Mode ---
			   org
			   org-bullets
			   go-mode
			   python-mode
			   ;; lsp
			   eglot
			   eldoc-box
			   ) "Default packages")

(setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (setq exec-path-from-shell-check-startup-files nil)
   (exec-path-from-shell-initialize))
;; ...

;; 文件末尾
(provide 'init-packages)
