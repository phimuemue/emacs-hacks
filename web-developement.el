;; Here I put everything for web development, including:
;;  * php
;;  * ((n)x))html

(autoload 'php-mode "~/elisp/php-mode/php-mode.el" "Edit PHP-files (almost) nicely" t)

(add-hook 'html-mode-hook 'setup-html-umlauts)
(add-hook 'php-mode-hook 'setup-html-umlauts)

(defun setup-html-umlauts ()
  (local-set-key (kbd "ä") '(lambda () (interactive)(insert "&auml;")))
  (local-set-key (kbd "Ä") '(lambda () (interactive)(insert "&Auml;")))
  (local-set-key (kbd "ö") '(lambda () (interactive)(insert "&ouml;")))
  (local-set-key (kbd "Ö") '(lambda () (interactive)(insert "&Ouml;")))
  (local-set-key (kbd "ü") '(lambda () (interactive)(insert "&uuml;")))
  (local-set-key (kbd "Ü") '(lambda () (interactive)(insert "&Uuml;")))
  (local-set-key (kbd "ß") '(lambda () (interactive)(insert "&szlig;")))
  (local-set-key (kbd "M-RET") '(lambda () (interactive)(insert "<br/>\n")))
  )
