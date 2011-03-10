; Python

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(require 'python)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
