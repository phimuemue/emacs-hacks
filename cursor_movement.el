;; ---------------------------------------------------------
;; Simulating vim's forward/backward-to-char commands.
;; ---------------------------------------------------------

(global-set-key (kbd "<S-right>") 'scroll-to-char-forward)
(global-set-key (kbd "<S-left>") 'scroll-to-char-backward)

;; TODO: add restoring information for point.

;; Scroll forward to the next occurance of a specified char
(defun scroll-to-char-forward (n target)
  "Move point to the N-th occurance forward of the desired char."
  (interactive "p\ncEnter char: ") ;; use a numeric prefix argument
  (push-mark (point))
  (setq c 0)
  (forward-char)
  (while (< c n)
    (while (not (char-equal target (char-after)))
      (forward-char))
    (setq c (+ c 1))
    (if (< c n)
	(forward-char)))
  (forward-char)
  )

;; Scroll backward to the next occurance of a specified char
(defun scroll-to-char-backward (n target)
  "Move point to the N-th occurance backward of the desired char."
  (interactive "p\ncEnter char: ") ;; use a numeric prefix argument
  (push-mark (point))
  (setq c 0)
  (backward-char)
  (while (< c n)
    (while (not (char-equal target (char-after)))
      (backward-char))
    (setq c (+ c 1))
    (if (< c n)
	(backward-char)))
  )

;; Marks the region within the specified chars
(defun mark-left-right ()
  (interactive)
  (setq pointpos (point))
  (scroll-to-char-backward 1)
  (set-mark-command 0)
  (goto-char pointpos)
  (scroll-to-char-forward 1)
  )
