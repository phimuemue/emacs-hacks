(require 'highlight-parentheses)							; parentheses highlightning
(defun turn-on-highlight-parentheses-mode () (highlight-parentheses-mode t))
(define-global-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  turn-on-highlight-parentheses-mode)
(global-highlight-parentheses-mode)
