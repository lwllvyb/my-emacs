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

;;  config plantuml
(setq org-plantuml-jar-path
      (expand-file-name "/Users/leewish/work/bin/plantuml.jar"))
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq plantuml-jar-path "/Users/leewish/work/bin/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; config org
(setq org-hide-emphasis-markers t) ;; 隐藏特殊符号，比如/斜体/
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")
;; config org *xxx* with red
(add-to-list 'org-emphasis-alist
             '("*" (:foreground "red")
               ))
;; fold block default
(setq org-hide-block-startup t )

;; auto update checkbox count
(defun lwl/org_auto_check()
  (org-update-checkbox-count t))

(add-hook 'org-mode-hook
          (lambda ()
             (add-hook 'after-save-hook 'lwl/org_auto_check )))

(setq org-todo-keywords '((sequence "TODO" "DOING" "DONE")))
(setq org-todo-keyword-faces '(("TODO" . "red")
                               ("DOING" . "yellow")
                               ("DONE" . "green")))


(defun org-todo-if-needed (state)
  "Change header state to STATE unless the current item is in STATE already."
  (unless (string-equal (org-get-todo-state) state)
    (org-todo state)))

(defun ct/org-summary-todo-cookie (n-done n-not-done)
  "Switch header state to DONE when all subentries are DONE, to TODO when none are DONE, and to DOING otherwise"
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo-if-needed (cond ((= n-done 0)
                               "TODO")
                              ((= n-not-done 0)
                               "DONE")
                              (t
                               "DOING")))))
(add-hook 'org-after-todo-statistics-hook #'ct/org-summary-todo-cookie)

(defun ct/org-summary-checkbox-cookie ()
  "Switch header state to DONE when all checkboxes are ticked, to TODO when none are ticked, and to DOING otherwise"
  (let (beg end)
    (unless (not (org-get-todo-state))
      (save-excursion
        (org-back-to-heading t)
        (setq beg (point))
        (end-of-line)
        (setq end (point))
        (goto-char beg)
        ;; Regex group 1: %-based cookie
        ;; Regex group 2 and 3: x/y cookie
        (if (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
                               end t)
            (if (match-end 1)
                ;; [xx%] cookie support
                (cond ((equal (match-string 1) "100%")
                       (org-todo-if-needed "DONE"))
                      ((equal (match-string 1) "0%")
                       (org-todo-if-needed "TODO"))
                      (t
                       (org-todo-if-needed "DOING")))
              ;; [x/y] cookie support
              (if (> (match-end 2) (match-beginning 2)) ; = if not empty
                  (cond ((equal (match-string 2) (match-string 3))
                         (org-todo-if-needed "DONE"))
                        ((or (equal (string-trim (match-string 2)) "")
                             (equal (match-string 2) "0"))
                         (org-todo-if-needed "TODO"))
                        (t
                         (org-todo-if-needed "DOING")))
                (org-todo-if-needed "DOING"))))))))
(add-hook 'org-checkbox-statistics-hook #'ct/org-summary-checkbox-cookie)

(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "✎")
                                       ("#+END_SRC" . "□")
                                       ("- [ ]" . "□")
                                       ("- [-]" . "◼")
                                       ("- [X]" . "☑")
                                       ("#+begin_src" . "✎")
                                       ("#+end_src" . "□")))
(add-hook 'org-mode-hook 'prettify-symbols-mode)

;; config org header
(let* ((variable-tuple
        (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
            ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
            ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
            ((x-list-fonts "Verdana")         '(:font "Verdana"))
            ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
            (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
        (base-font-color     (face-foreground 'default nil 'default))
        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

(custom-theme-set-faces
    'user
    `(org-level-8 ((t (,@headline ,@variable-tuple))))
    `(org-level-7 ((t (,@headline ,@variable-tuple))))
    `(org-level-6 ((t (,@headline ,@variable-tuple))))
    `(org-level-5 ((t (,@headline ,@variable-tuple))))
    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

;; 文件末尾
(provide 'init-org)
