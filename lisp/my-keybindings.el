(evil-leader/set-leader ",")
(evil-leader/set-key
  "pa" 'projectile-discover-projects-in-directory
  ;;"pf" 'counsel-projectile-find-file
  "pf" 'find-file-in-project
  "pp" 'projectile-switch-project
  "pr" 'counsel-recentf
  ;"s" 'projectile-ripgrep
  "ps" 'color-rg-search-project
  "r" 'counsel-recentf
  "o"  'counsel-imenu
  "fr" 'xref-find-references
  "fd" 'xref-find-definitions
  ;;"fd" 'counsel-etags-find-tag-at-point
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
  "t" 'lwl/goto-resource
  "nn" 'treemacs
  "cc" 'evilnc-comment-or-uncomment-lines
  "ww" 'toggle-maximize-buffer
  "wn" 'switch-window
  "ee" 'org-edit-src-code
  "," 'execute-extended-command
  )

(global-set-key (kbd "C-x o") 'switch-window)

(global-set-key (kbd "C-h") #'windmove-left)
(global-set-key (kbd "C-l") #'windmove-right)
(global-set-key (kbd "C-k") #'windmove-up)
(global-set-key (kbd "C-j") #'windmove-down)
(global-set-key (kbd "M-1") #'awesome-tab-backward)
(global-set-key (kbd "M-2") #'awesome-tab-forward)


;; 字体调整
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(define-prefix-command 'leader-key)
(global-set-key (kbd "C-q") 'leader-key)

;; https://emacs.stackexchange.com/a/10588/22102
(eval-after-load 'color-rg
  '(progn
     (evil-make-overriding-map color-rg-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'color-rg-mode-hook #'evil-normalize-keymaps)))

;; 文件末尾
(provide 'my-keybindings)
