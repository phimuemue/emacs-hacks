;;; inline-calculation-mode.el --- 

;; Copyright 2011 phimuemue
;;
;; Author: philipp@cassiopeia
;; Version: $Id: inline-calculation-mode.el,v 0.0 2011/02/20 16:00:56 philipp Exp $
;; Keywords: 
;; X-URL: phimuemue.com

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; This is a very simple utility that let's you evaluate expressions on the
;; fly. Calculations are determined by special characters.

;;; Tutorial:

;; * denote the calculations beginning by entering "" (w/ quotes)
;; * enter the equation itself
;; * press "=" (w/ quotes) and let emacs evaluate the calculation
;;
;; Example: § 1+2+3 = 6
;;          ^   ^   ^ ^

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'inline-calculation-mode)

;;; Code:

(provide 'inline-calculation-mode)
(eval-when-compile
  (require 'cl))

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(defun scroll-to-char-backward (n target)
  "Move point to the N-th occurance backward of the desired char."
  ;;(interactive "p\ncEnter char: ") ;; use a numeric prefix argument
  (setq c 0)
  (backward-char)
  (while (< c n)
    (while (not (char-equal target (char-after)))
      (backward-char))
    (setq c (+ c 1))
    (if (< c n)
	(backward-char)))
  )
(defun calculate-region (_start _end)
  (interactive "r")
  (setq start _start)
  (setq end _end)
  (goto-char end)
  (insert "=")
  (insert (calc-eval (buffer-substring start end))))

(defun calculate-after-eqals ()
  (interactive)
  (setq old-point (point))
  (scroll-to-char-backward 1 167) ;; 167 corresponds to 
  (delete-char 1)
  ;;(goto-char old-point)
  (calculate-region (point) (- old-point 1))
  (setq inline-calculation-mode-is-active nil)
  (local-set-key (kbd "=") 'self-insert-command)
  )

(defvar inline-calculation-mode-is-waiting nil
  "Denotes if inline calculation mode is currently waiting for evaluating.

If t, inline-calculation-mode is waiting for you to press \"=\" so it can 
evaluate the stuff you gave it.

If nil, it is not waiting and pressing \"=\" does just a self-insert-command.")

(define-minor-mode inline-calculation-mode 
  "This is a simple mode for calculating mathematical stuff on-the-fly, 
i.e. without having to leave emacs to go to another maths program.

At the moment, only very basic aspects are supported. Maybe in futere some 
cooler features will be added."
  nil   ;; initial value
  " §"  ;; ligher (indicator in modeline)
  '(((kbd "§") . inline-calculation-mark-beginning-of-calculation)))

(defun enable-inline-calculation-waiting ()
  (interactive)
  (setq inline-calculation-mode-is-waiting t)
  (local-set-key (kbd "=") 'calculate-after-eqals))

(defun message-region (s e)
  (interactive "r")
  (message "%d to %d" s e))

(defun inline-calculation-mark-beginning-of-calculation ()
  (interactive)
  (enable-inline-calculation-waiting)
  (insert "§"))

;;; inline-calculation-mode.el ends here
