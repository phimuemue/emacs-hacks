;; This file contains everything used by and related to templated, including:
;;  * yasnippet
;;  * templates

;; yasnippet
(require 'yasnippet) 
(defun load/yas/stuff ()
  (interactive)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/yasnippet/snippets")
  (message "yasnippet loaded"))
(load/yas/stuff)

;; templates
(require 'template)
(template-initialize)