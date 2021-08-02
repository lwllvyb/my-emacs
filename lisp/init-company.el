;; 通用的补全、tag 方案
(add-to-list 'load-path "~/.emacs.d/packages/citre") ; add nox to your load-path
(use-package citre
  :defer t
  :init
  ;; This is needed in `:init' block for lazy load to work.
  (require 'citre-config)
  ;; Bind your frequently used commands.
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
  :config
  (setq
   ;; Set these if readtags/ctags is not in your path.
   ;; citre-readtags-program "/usr/local/bin/readtags"
   ;; citre-ctags-program "/usr/local/bin/ctags"
   ;; Set this if you use project management plugin like projectile.  It's
   ;; used for things like displaying paths relatively, see its docstring.
   citre-project-root-function #'projectile-project-root
   ;; Set this if you want to always use one location to create a tags file.
   ;;citre-default-create-tags-file-location 'global-cache
   ;; See the "Create tags file" section above to know these options
   ;;citre-use-project-root-when-creating-tags t
   ;;citre-prompt-language-for-ctags-command t
   ))


(provide 'init-company)
