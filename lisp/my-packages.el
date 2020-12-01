;; File  : lisp/my-packages.el
;; Author: liwenlong03 <liwenlong03>
;; Date  : 2020.09.05
;; Last Modified Date  : 2020.09.05
;; Last Modified By  : liwenlong03 <liwenlong03>
(define-prefix-command 'leader-key)
(global-set-key (kbd "C-,") 'leader-key)
(require 'cl)
(require 'use-package)

;;==========================================================================
;; auto refresh file
(global-auto-revert-mode t)
;;==========================================================================
;;==========================================================================
(doom-modeline-mode 1)
(setq doom-modeline-vcs-max-length 50)
;;==========================================================================
(evil-mode 1)
(global-evil-leader-mode)
;;==========================================================================
(show-paren-mode)
(highlight-parentheses-mode)
;;==========================================================================
;; disable
(add-to-list 'load-path "~/.emacs.d/packages/awesome-pair") ; add awesome-pair to your load-path
;; 括号匹配，不再使用这个，转为使用smartparens
(use-package awesome-pair
  :disabled 
  :load-path "~/.emacs.d/packages/awesome-pair" 
  :config (dolist (hook (list 'c-mode-common-hook 'c-mode-hook 'c++-mode-hook 'java-mode-hook 'haskell-mode-hook 'emacs-lisp-mode-hook 'lisp-interaction-mode-hook 'lisp-mode-hook 'maxima-mode-hook 'ielm-mode-hook 'sh-mode-hook 'makefile-gmake-mode-hook 'php-mode-hook 'python-mode-hook 'js-mode-hook 'go-mode-hook 'qml-mode-hook 'jade-mode-hook 'css-mode-hook 'ruby-mode-hook 'coffee-mode-hook 'rust-mode-hook 'qmake-mode-hook 'lua-mode-hook 'swift-mode-hook 'minibuffer-inactive-mode-hook)) 
            (add-hook hook '(lambda () 
                              (awesome-pair-mode 1)))) 
  :bind (:map awesome-pair-mode-map
              ("(" . #'awesome-pair-open-round) 
              ("(" . #'awesome-pair-open-round) 
              ("[" . #'awesome-pair-open-bracket) 
              ("{" . #'awesome-pair-open-curly) 
              ("" . #'awesome-pair-close-round) 
              ("]" . #'awesome-pair-close-bracket) 
              ("}" . #'awesome-pair-close-curly) 
              ("=" . #'awesome-pair-equal) 
              ("%" . #'awesome-pair-match-paren) 
              ("\"" . #'awesome-pair-double-quote) 
              ("SPC" . #'awesome-pair-space) 
              ("M-o" . #'awesome-pair-backward-delete) 
              ("C-d" . #'awesome-pair-forward-delete) 
              ("C-k" . #'awesome-pair-kill) 
              ("M-\"" . #'awesome-pair-wrap-double-quote) 
              ("M-[" . #'awesome-pair-wrap-bracket) 
              ("M-{" . #'awesome-pair-wrap-curly) 
              ("M-(" . #'awesome-pair-wrap-round) 
              ("M-)" . #'awesome-pair-unwrap) 
              ("M-p" . #'awesome-pair-jump-right) 
              ("M-n" . #'awesome-pair-jump-left) 
              ("M-:" . #'awesome-pair-jump-out-pair-and-newline)
              ))
;;==========================================================================
;;(load-theme 'tao-yin t)
;;==========================================================================

;;(add-to-list 'load-path "~/.emacs.d/packages/snails") ; add snails to your load-path
;;(require 'snails)
;;(snails '(snails-backend-recentf snails-backend-projectile))

;;==========================================================================
;; auto save desktop status
;;(desktop-save-mode 1)
;;==========================================================================
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

(defun lwl/goto-other-frame(path)
  ""
  	(interactive)
	(let* ((name (file-name-nondirectory path))
           (b (get-buffer name))
           (w (get-buffer-window name)))
	  (if b
		(progn
                 (if w
                     (switch-to-buffer b)
                   (switch-to-buffer-other-frame b 'norecord)))
		(switch-to-buffer-other-frame (find-file path)))))
(defun goto-tmp()
  (interactive)
  (lwl/goto-other-frame "~/work/tmp/hulk_crash.org")
  )
; (setq projectile-switch-project-action 'lwl/projectile-after-switch-action)
; (add-hook 'projectile-find-file-hook 'lwl/projectile-after-switch-action)
(defun my-switch-project-hook ()
  "Perform some action after switching Projectile projects."
  (message "Project changed...")
  ;; Do something interesting here...
  ;;
  ;; `projectile-current-project-files', and `projectile-current-project-dirs' can be used
  ;; to get access to the new project's files, and directories.
  )
(add-hook 'projectile-after-switch-project-hook #'my-switch-project-hook)

(counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("." dired
           "open ‘dired’ at the root of the project")
          1)))
;;==========================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/lwl/goenv"))
(require 'goenv)
(defun my-nox-reconnect ()
	(let* ((current-server (nox-current-server))
         )
        (nox-reconnect current-server 't)
		))
(defun gopath()
  (interactive)
  (goenv-activate (magit-toplevel))
   (my-nox-reconnect)
  )

;;==========================================================================
;; LSP

(add-to-list 'load-path "~/.emacs.d/packages/nox") ; add nox to your load-path
(require 'nox)

(dolist (hook (list
                'go-mode-hook
                'rust-mode-hook
                'python-mode-hook
                'sh-mode-hook
                'c-mode-common-hook
                'c-mode-hook
                'c++-mode-hook
                ))
   (add-hook hook '(lambda () (nox-ensure))))

;;(require 'eglot)
;;(set eglot-put-doc-in-help-buffer nil)
;;(setq eglot-auto-display-help-buffer nil)
;;(dolist (hook (list
;;			   'go-mode-hook
;;			   'rust-mode-hook
;;			   'python-mode-hook
;;			   'sh-mode-hook
;;			   'c-mode-common-hook
;;			   'c-mode-hook
;;			   'c++-mode-hook
;;			   ))
;;  (add-hook hook '(lambda () (eglot-ensure))))
;;==========================================================================

(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)
(setq awesome-tab-show-tab-index t)
(global-set-key (kbd "s-1") 'awesome-tab-backward-tab)
(global-set-key (kbd "s-2") 'awesome-tab-forward-tab)

;;==========================================================================
(require 'evil-magit)

;;==========================================================================
;; (require 'company)
;; (require 'company-go)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq company-tooltip-limit 20)                      ; bigger popup window
;; (setq company-idle-delay .2)                         ; decrease delay before autocompletion popup shows
;; (setq company-echo-delay 0)                          ; remove annoying blinking
;; (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
;; (custom-set-faces
;;  '(company-preview
;;    ((t (:foreground "darkgray" :underline t))))
;;  '(company-preview-common
;;    ((t (:inherit company-preview))))
;;  '(company-tooltip
;;    ((t (:background "lightgray" :foreground "black"))))
;;  '(company-tooltip-selection
;;    ((t (:background "steelblue" :foreground "white"))))
;;  '(company-tooltip-common
;;    ((((type x)) (:inherit company-tooltip :weight bold))
;;     (t (:inherit company-tooltip))))
;;  '(company-tooltip-common-selection
;;    ((((type x)) (:inherit company-tooltip-selection :weight bold))
;;     (t (:inherit company-tooltip-selection)))))
;; (add-hook 'racer-mode-hook #'company-mode)


;;==========================================================================
;; 著名的Emacs补全框架
    (use-package company
      :diminish
      :init
      (setq company-dabbrev-downcase 0)
      (setq company-idle-delay 0)
      (setq company-minimum-prefix-length 2)
      (setq company-tooltip-align-annotations t)
      (setq company-tooltip-limit 20)                      ; bigger popup window
      (setq company-echo-delay 0)                          ; remove annoying blinking
      (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
      (setq company-backends
            '(
              ;; company-clang
              ;; company-xcode
              ;; company-dabbrev
              ;; company-yasnippet
              company-semantic
              company-cmake
              company-capf
              company-files
              (company-dabbrev-code
               company-gtags
               company-etags
               company-keywords)))

      :bind
      (:map company-active-map
            ("C-n" . company-select-next)
            ("C-p" . company-select-previous))

      :hook
      (prog-mode . company-mode)
      :config
      (unbind-key "M-n" company-active-map)
      (unbind-key "M-p" company-active-map))

    (use-package company-statistics
      :hook
      (after-init . company-statistics-mode))

    (use-package yasnippet
      :diminish
      :hook
      (prog-mode . yas-minor-mode)
      :config
      (use-package yasnippet-snippets :ensure t)
      (yas-reload-all)

      :bind
      (:map yas-minor-mode-map
            ("TAB" . nil)))

    (use-package company-posframe
      :diminish
      :init
      (setq company-posframe-quickhelp-delay nil
            company-posframe-quickhelp-show-header nil
            company-posframe-show-metadata nil
            company-posframe-show-indicator nil
            company-posframe-show-params (list :internal-border-color "dark gray"
                                               :internal-border-width 1))
      :config
      (company-posframe-mode 1)
      (require 'desktop)
      (push '(company-posframe-mode . nil)
            desktop-minor-mode-table))

    ;; (use-package company-box
    ;;   :diminish
    ;;   :init
    ;;   (setq company-box-doc-enable nil)
    ;;   (setq company-box-backends-colors
    ;;         '((company-capf
    ;;            .
    ;;            (:all "dim gray" :selected (:background "#288dee" :foreground "white")))
    ;;           (company-elisp
    ;;            .
    ;;            (:all "dim gray" :selected (:background "#288dee" :foreground "white")))
    ;;           (company-yasnippet
    ;;            .
    ;;            (:all "dim gray" :selected (:background "#288dee" :foreground "white")))))
    ;;   :hook (company-mode . company-box-mode)
    ;;   :custom-face
    ;;   (company-box-selection ((t (:inherit company-tooltip-selection :background "#288dee"))))
    ;;   (company-box-annotation ((t (:inherit comapny-tooltip-annotation :foreground "blue")))))
;; With use-package:

;;==========================================================================
(require 'switch-window)

;;==========================================================================
;; org start
(setq org-startup-folded nil)
(require 'org)
(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate 'nil)


;;==========================================================================
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq inhibit-compacting-font-caches t)

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "bash" "rust" "golang")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

;;==========================================================================
;; symbol-overlay
;;(let ((map (make-sparse-keymap)))
;;  (define-key map (kbd "n") 'symbol-overlay-jump-next)
;;  (define-key map (kbd "p") 'symbol-overlay-jump-prev)
;;  (setq symbol-overlay-map map))
;;(setq symbol-overlay-map (make-sparse-keymap))

;;==========================================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/awesome-tab"))
(require 'awesome-tab)
(awesome-tab-mode t)


;;==========================================================================
(use-package ivy-posframe
  :diminish
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center))
        ivy-posframe-parameters '((left-fringe . 2)
                                  (right-fringe . 2)
                                  ;;(font . "Dejavu Sans Mono For Powerline-14")
                                  (line-spacing . 1))
        ivy-posframe-height-alist '((t . 25))
        ivy-posframe-width 140)
  (set-face-attribute 'ivy-posframe-border nil :foreground "green")
  (set-face-attribute 'ivy-posframe nil :background "#575757")
  ;; (set-face-attribute 'ivy-posframe-cursor nil :inherit 'cursor)
  (ivy-posframe-mode 1))

(use-package ivy-xref
  :ensure t
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(setq ivy-initial-inputs-alist nil)

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
;; go
 (setq gofmt-command "goimports")
 (add-hook 'before-save-hook 'gofmt-before-save)
;;==========================================================================
   (with-eval-after-load 'treemacs-evil
    (define-key evil-treemacs-state-map (kbd "F") 'treemacs-create-file)
    (define-key evil-treemacs-state-map (kbd "+") 'treemacs-create-dir))
;;==========================================================================
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
;;==========================================================================
;; company-ctags
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/redguardtoo/company-ctags/"))
;;(require 'company-ctags)
;;(with-eval-after-load 'company
;;  (company-ctags-auto-setup))

;;==========================================================================
;; plantuml
 ;; Sample jar configuration
(setq plantuml-jar-path (expand-file-name "~/.emacs.d/packages/plantuml.jar"))
(setq plantuml-default-exec-mode 'jar)
;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;;==========================================================================
;; flymake-new
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/lazyflymake"))
(require 'lazyflymake)
(add-hook 'prog-mode-hook #'lazyflymake-start)

;;==========================================================================
;;==========================================================================
;; color-rg
(add-to-list 'load-path "~/.emacs.d/packages/color-rg") ; add color-rg to your load-path
(require 'color-rg)
;;==========================================================================
;; evil-nerd-commenter

(require 'evil-nerd-commenter)

;;==========================================================================
;; window 放大缩小
(defun toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (save-excursion
    (if (and (= 1 (length (cl-remove-if
                           (lambda (window)
                             (window-parameter window 'no-delete-other-windows))
                           (window-list))))
             (assoc ?_ register-alist))
        (jump-to-register ?_)
      (progn
        (window-configuration-to-register ?_)
        (delete-other-windows)))))
;;==========================================================================
;; rust
(rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

;; (setq flymake-rust-use-cargo nil)
(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

(add-to-list 'load-path "~/.emacs.d/packages/ob-rust") ; add color-rg to your load-path
(require 'ob-rust)
;;==========================================================================
;; yasnippet
(use-package yasnippet 
    :config (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")) 
(yas-global-mode 1)

;;==========================================================================
;; smartparents
(require 'smartparens-config)
;(smartparents-mode 1)
;;==========================================================================
(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
;;;###autoload
(defun org-insert-image (event)
  (interactive "e")
  (x-focus-frame nil)
  (let* ((payload (car (last event)))
         (type (car payload))
         (fromname (cadr payload))
         (img-regexp "\\(gif\\|png\\|jp[e]?g\\)\\>")
         (destname fromname)
         img-dir
         )
    (when (file-exists-p "../img/")
      (setq img-dir "../img/"))
    (when (file-exists-p "./img/")
      (setq img-dir "./img/"))
    (when (and  (eq 'drag-n-drop (car event))
                (eq 'file type)
                (string-match img-regexp fromname)
                img-dir)
      (let ((filebasename (file-name-base (buffer-file-name)) ))
        (setq destname (concat img-dir filebasename "-" (format-time-string "%Y-%m-%d-%H-%M-%S") "." (file-name-extension fromname)))
        (rename-file fromname destname t))
      (goto-char (nth 1 (event-start event)))
      (insert (format "[[file:%s]]" (file-relative-name destname (file-name-directory (buffer-file-name))))))))
;;==========================================================================
;; Emacs下最好用的终端仿真器，需要编译库，默认不开启
(use-package 
  vterm
  :commands (vterm)
  :ensure t
  :bind (:map leader-key
              ("o t" . 'vterm)))
;; 括号匹配
(use-package 
    smartparens
	  :ensure t 
	    :hook ('prog-mode . 'smartparens-global-mode))
;; 有道词典，非常有用
(use-package 
  youdao-dictionary
  :commands (youdao-dictionary-search-at-point-posframe)
  :ensure t 
  :config (setq url-automatic-caching t) 
  (which-key-add-key-based-replacements "C-x y" "有道翻译") 
  :bind (("C-x y t" . 'youdao-dictionary-search-at-point+) 
         ("C-x y g" . 'youdao-dictionary-search-at-point-posframe) 
         ("C-x y p" . 'youdao-dictionary-play-voice-at-point) 
         ("C-x y r" . 'youdao-dictionary-search-and-replace) 
         ("C-x y i" . 'youdao-doictionary-search-from-input)))

;; 用posframe在dired模式下显示文件内容
(use-package dired-posframe
  :ensure t
  :custom
  (dired-posframe-size-limit (* 100 1024 1024))
  :bind((:map dired-mode-map)
		("C-*" . dired-posframe-mode)))
;; 更改窗格布局
(use-package rotate
  :ensure t)

;; 命令日志
(use-package command-log-mode
  :ensure t)
(use-package flymake-rust
  :ensure t
  :hook ('rust-mode-hook 'flymake-rust-load))			 
;; 增强了搜索功能
(use-package swiper
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-c C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file))
  :config
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

;; 强大的字符跳转工具
(use-package avy
  :defer 0
  :ensure t
  :bind (("M-g :" . 'avy-goto-char)
         ("M-g '" . 'avy-goto-char-2)
         ("M-g \"" . 'avy-goto-char-timer)
         ("M-g f" . 'avy-goto-line)
         ("M-g w" . 'avy-goto-word-1)
         ("M-g e" . 'avy-goto-word-0)))
;;==========================================================================
(use-package racer
  :ensure t
  :load-path "~/.emacs.d/packages/emacs-racer"
  :hook ('rust-mode-hook #'racer-mode
                         'racer-mode-hook #'eldoc-mode))
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
;;==========================================================================
;; 文件末尾
(provide 'my-packages)
