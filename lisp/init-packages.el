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
(require 'package)

(package-initialize) ;; You might already have this line
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                        ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
;; (when (>= emacs-major-version 24)
;;     (require 'package)
;;     (package-initialize)
;;     (setq package-archives
;;          '(("melpa-cn" . "~/emacs_plugins/melpa/")
;;          ("org-cn"   . "~/emacs_plugins/org/")
;;          ("gnu-cn"   . "~/emacs_plugins/gnu/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
               benchmark-init
               exec-path-from-shell
               evil
               evil-leader
               evil-nerd-commenter
               use-package
               dashboard
               ripgrep
               magit
               ;;evil-magit
               posframe
               ivy
               ivy-posframe
               switch-window
               ;;symbol-overlay
               ;; project
               projectile
               counsel-projectile
               find-file-in-project
               ;; ui
               all-the-icons
               treemacs
               treemacs-evil
               treemacs-projectile
               ;; theme
               doom-modeline
               srcery-theme
               tao-theme
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
               flymake-rust
               ;; --- Major Mode ---
               org
               org-bullets
               org-download
               go-mode
               python-mode
               rust-mode
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
