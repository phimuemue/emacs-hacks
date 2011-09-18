;; Here we have some nice little helpers

;;--------------------------------------------------------------------------------
;; Better incremental search support, such that emacs takes the whole
;; word under corsor if pressing C-s C-W
;;--------------------------------------------------------------------------------

(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning 
			     'isearch-yank-word-or-char
			     isearch-mode-map))

(add-hook 'isearch-mode-hook
 (lambda ()
   "Activate my customized Isearch word yank command."
   (substitute-key-definition 'isearch-yank-word-or-char 
			      'my-isearch-yank-word-or-char-from-beginning
			      isearch-mode-map)))

;;--------------------------------------------------------------------------------
;; Quick flyspell language switching (englich/german)
;;--------------------------------------------------------------------------------

(let ((langs '("english" "de_DE" )))							; "language packs"
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))

(defun cycle-ispell-languages ()							; clycle languages for flyspell
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))

;;--------------------------------------------------------------------------------
;; emulating vim's % command, i.e. quickly going to matching brace
;;--------------------------------------------------------------------------------

(defun goto-match-paren (arg)								; match parentheses
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
											;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\({]") (forward-sexp))
        ((looking-back "[\]\)}]" 1) (backward-sexp))
											;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\({]" 1) (backward-char) (forward-sexp))
        (t nil)))

;;--------------------------------------------------------------------------------
;; saving and restoring window configurations easiyl
;;--------------------------------------------------------------------------------
(winner-mode 1)