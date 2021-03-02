;;;===========================================
;;;					模块介绍
;;; 基础模块，修改了大部分Emacs自带的功能。
;;;===========================================

;; MODULE: EMACS BASIC

;; AUTHOR: EvanMeek the_lty_mail@foxmail.com

;; CODE:

(setq select-enable-primary t)
;; yes-or-no-p to y-or-n-p
(fset 'yes-or-no-p 'y-or-n-p)
;; 设置缓存文件/杂七杂八的文件存放的地址
(setq user-emacs-directory "~/.emacs.d/var")
(setq desktop-dirname "~/.emacs.d/var/desktop-save")
;; 设置Emacs源码位置
(setq source-directory "~/Documents/repoes/emacs-src/src/")
;; 设置自动保存路径前缀
(setq auto-save-list-file-prefix "~/.emacs/var/auto-save-list/.saves-")
;; 设置eshell历史记录
(setq eshell-history-file-name "~/.emacs/var/eshell/history")

;; 关闭滚动条
;; (push '(scroll-bar-mode -1) graphic-only-plugins-setting)
(scroll-bar-mode -1)

;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

;; 自动刷新被修改过的文件
(global-auto-revert-mode +1)

;; 选中文本后输入会覆盖
(add-hook 'after-init-hook
          (lambda () (delete-selection-mode +1)))


;; 关闭GUI功能
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-message t)

;; 回到关闭文件前光标的位置
(use-package saveplace
  :ensure t
  :hook (after-init . (lambda () (save-place-mode t))))

;; 关闭备份
(setq make-backup-files nil auto-save-default nil)

;; 关闭多编辑器同时编辑统一文件时锁文件操作
(setq create-lockfiles nil)

;; 随时重新加载发生修改过的文件
(setq load-prefer-newer t)


;; 关闭字体缓存gc
(setq inhibit-compacting-font-caches nil)

;; 关闭烦人的提示
(setq ring-bell-function 'ignore blink-cursor-mode nil)

;; 任何地方都使用UTF-8
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)    ; pretty
(set-terminal-coding-system  'utf-8)    ; pretty
(set-keyboard-coding-system  'utf-8)    ; pretty
(set-selection-coding-system 'utf-8)    ; please
(prefer-coding-system        'utf-8)    ; with sugar on top
(setq default-process-coding-system '(utf-8 . utf-8))

;; 更友好及平滑的滚动
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always)

;; 关闭自动调节行高
(setq auto-window-vscroll nil)
;; 关闭自动换行的功能
(setq truncate-partial-width-windows t)

;; 创建新行的动作
;; 回车时创建新行并且对齐
(global-set-key (kbd "RET") 'newline-and-indent)
;; 取消对齐创建的新行
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

;; 让光标无法离开视线
(setq mouse-yank-at-point nil)

;; 最大单行字符数量
(setq-default fill-column 80)

;; 让'_'被视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?_ "w")))
;; "-" 同上)
(add-hook 'after-change-major-mode-hook (lambda ()
                                          (modify-syntax-entry ?- "w")))
;; 允许插入制表符
(setq-default indent-tabs-mode nil)
;; 制表符宽度
(setq-default tab-width 4)
;; 高亮对应的括号
(show-paren-mode 1)

;;自动清除行位空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)
;; 键位提示
(use-package which-key
  :ensure t
  :custom
  ;; 弹出方式，底部弹出
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode))

;; 饥饿删除（一次性删除多个连续的空白符）
(use-package hungry-delete
  :ensure t
  :hook ('prog-mode . 'global-hungry-delete-mode))
;; 外部修改之后，自动更新
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

;; 默认目录为~/.emacs.d/
(cd "~/.emacs.d/")

(provide 'init-basic)
