;; Here I put everything for web development, including:
;;  * php
;;  * ((n)x))html

(autoload 'php-mode "~/elisp/php-mode/php-mode.el" "Edit PHP-files (almost) nicely" t)

;; (add-hook 'html-mode-hook 'setup-html-umlauts)
;; (add-hook 'php-mode-hook 'setup-html-umlauts)

(define-minor-mode umlaut-mode
  "This is a small utility for easy entring umlauts in specially encoded
Sites. Therefore, umlauts are automatically substituted by their 
corresponding HTML equivalents."
  nil
  " Ü"
  '(
    ((kbd "ä") . (lambda () (interactive)(insert "&auml;")))
    ((kbd "Ä") . (lambda () (interactive)(insert "&Auml;")))
    ((kbd "ö") . (lambda () (interactive)(insert "&ouml;")))
    ((kbd "Ö") . (lambda () (interactive)(insert "&Ouml;")))
    ((kbd "ü") . (lambda () (interactive)(insert "&uuml;")))
    ((kbd "Ü") . (lambda () (interactive)(insert "&Uuml;")))
    ((kbd "ß") . (lambda () (interactive)(insert "&szlig;")))
    ((kbd "M-RET") . (lambda () (interactive)(insert "<br/>\n")))
    )
  )