;; File              : lisp/init-packages.el
;; Author            : liwenlong03 <liwenlong03>
;; Date              : 2020.09.05
;; Last Modified Date: 2020.09.05
;; Last Modified By  : liwenlong03 <liwenlong03>
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
      	'(("melpa-cn" . "~/emacs_plugins/melpa/")
       	("org-cn"   . "~/emacs_plugins/org/")
       	("gnu-cn"   . "~/emacs_plugins/gnu/"))))

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
			   posframe
			   ivy
			   ivy-posframe
			   projectile
			   counsel-projectile
			   switch-window
			   symbol-overlay
               evil-nerd-commenter
         all-the-icons
         treemacs
         treemacs-evil
         treemacs-projectile
         doom-modeline
				;; theme
			   srcery-theme
			   ;; --- Auto-completion ---
			   company
			   company-go
			   yasnippet
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
			   ;;eglot
			   ;;eldoc-box
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
