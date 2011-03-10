;; This file contains everything for C/C++

(setq c-default-style "bsd" c-basic-offset 2)						; C-style

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (hs-minor-mode t)))

(autoload 'c-helpers-minor-mode "c-helpers-minor-mode/c-helpers.el")

(add-hook 'c-mode-hook									; C stuff
	  (lambda ()
	    (c-helpers-minor-mode t)
	    (local-set-key (kbd "C-:") 'semantic-ia-complete-symbol-menu)
	    (local-set-key (kbd "C-.") 'ac-complete-semantic)
	    (local-set-key (kbd "C-c C-c") 'compile)
	    (highlight-regexp "^.*[Tt][Oo][Dd][Oo].*$" "yellow")))

(add-hook 'c++-mode-hook								; C++ stuff
	  (lambda ()
	    (local-set-key (kbd "C-:") 'semantic-ia-complete-symbol-menu)
	    (local-set-key (kbd "C-.") 'ac-complete-semantic)
	    (local-set-key (kbd "C-c C-c") 'compile)
	    ))

; C++ stuff
;; (defun load-c++-stuff ()
;;   (load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")
;;   ;(global-ede-mode 1) ; enable project management system
;;   (semantic-load-enable-code-helpers) prototype help+smart completion
;;   (require 'auto-complete-config)
;;   (add-to-list 'ac-dictionary-directories "~/elisp/ac-dict")
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;;   (ac-config-default)
;;   )

;; (require 'gccsense)
