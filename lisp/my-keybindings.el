

(evil-leader/set-leader ",")
(evil-leader/set-key
  "pa" 'projectile-discover-projects-in-directory
  "pf" 'counsel-projectile-find-file
  "pp" 'projectile-switch-project
  "pr" 'counsel-recentf
  ;"s" 'projectile-ripgrep
  "ps" 'color-rg-search-symbol-in-project
  "r" 'counsel-recentf
  "o"  'counsel-imenu
  "fr" 'xref-find-references
  "fd" 'xref-find-definitions
  ;"f" 'counsel-find-file
  ;"fp" 'switch-to-buffer
  "bd" 'kill-buffer-and-window
  "mm" 'counsel-bookmark
  "md" 'bookmark-delete
  "gs" 'magit-status
  "gb" 'magit-blame
  "k" 'symbol-overlay-put
  "K" 'symbol-overlay-remove-all
  "a" 'org-agenda
  "t" 'goto-tmp
  "nn" 'treemacs
  "cc" 'evilnc-comment-or-uncomment-lines
  "ww" 'toggle-maximize-buffer
  "ee" 'org-edit-src-code
  )

(global-set-key (kbd "C-x o") 'switch-window)

(global-set-key (kbd "C-h") #'windmove-left)
(global-set-key (kbd "C-l") #'windmove-right)
(global-set-key (kbd "C-k") #'windmove-up)
(global-set-key (kbd "C-j") #'windmove-down)

(define-prefix-command 'leader-key)
(global-set-key (kbd "C-q") 'leader-key)

;; 文件末尾
(provide 'my-keybindings)
