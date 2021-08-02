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
(use-package yasnippet
  :config (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets"))
(yas-global-mode 1)
;; 文件末尾
(provide 'init-yasnippet)
