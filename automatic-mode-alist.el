;; Here I store file types and corresponding modes.

(setq auto-mode-alist (cons '("\\.cu$" . c-mode) auto-mode-alist)) ; cuda-files syntax highlight 

(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist)) ; syntax highlight for php files
