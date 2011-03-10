; LaTeX stuff
(load "auctex.el" nil t t)        ; auctex
(load "preview-latex.el" nil t t) ; preview-latex

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(defun insert-latex-brackets (opening closing) ; prototype function for all enclosing things
  (interactive)
  (insert opening)
  (insert "  ")
  (insert closing)
  (backward-char (+ 1 (length closing )))
  )

(defun check-char-and-insert (char opening closing)
  (interactive)
  (if (equal char (char-to-string (char-before (point))))
      (progn (delete-backward-char 1)
	     (insert-latex-brackets opening closing))
    (insert char)
  )
)

(add-hook 'reftex-mode-hook ; balanced math parentheses in LaTeX
	  (lambda ()
	    (define-key reftex-mode-map (kbd "(")
	      (lambda ()(interactive) (check-char-and-insert "(" "\\left(" "\\right)")))
	    (define-key reftex-mode-map (kbd "[")
	      (lambda ()
		(interactive) (check-char-and-insert "[" "\\left[" "\\right]")))
	    (define-key reftex-mode-map (kbd "{")
	      (lambda ()
		(interactive) (check-char-and-insert "{" "\\left\\{" "\\right\\}")))
	    (define-key reftex-mode-map (kbd "C-( (")
	      (lambda ()
		(interactive) (insert-latex-brackets "\\left(" "\\right)")))
	    (define-key reftex-mode-map (kbd "C-( [")
	      (lambda ()
		(interactive) (insert-latex-brackets "\\left[" "\\right]")))
	    (define-key reftex-mode-map (kbd "C-( {")
	      (lambda ()
		(interactive) (insert-latex-brackets "\\left\\{" "\\right\\}"))))
	  )
