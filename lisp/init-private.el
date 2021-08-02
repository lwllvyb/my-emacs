;; File              : lisp/init-private.el
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


(defun lwl/goto-resource ()
  ""
  (interactive)
  (progn (select-frame (make-frame `((name . ,(concat "[private] " (buffer-name))))))
         (dired "~/OneDrive/resource/100-Work-工作资料库/111-CEPH/")))
;; 文件末尾
(provide 'init-private)
