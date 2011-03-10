;;; window_arrangements.el --- 

;; Copyright 2010 phimuemue
;;
;; Author: phimuemue
;; Keywords: window arrangements

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

;; this file is essentially just a hack for quickly switching between
;; different window configurations using the <f11> key

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'window_arrangements)

(provide 'window_arrangements)
(eval-when-compile
  (require 'cl))

;; Here are several possible functions defined for setting up a
;; certain window configurations.
(defun wc-c++ ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer "*compilation*")
  (split-window-horizontally)
  (other-window 1)
  (shell)
  (other-window 1)
  (message "C++ windows set up")
  )
(defun wc-python ()
  (delete-other-windows)
  (switch-to-buffer "empty_python_file")
  (python-mode)
  (split-window-vertically)
  (message "Python windows set up")
  )
(defun wc-default ()
  (delete-other-windows)
  (message "Default emacs window")
  )

;; the following list should contain all window-configurations
(setq wc-list '(wc-c++ wc-python wc-default))
(defun wc-cycle-list (l)
  (append (cdr l) (list (car l)))
  )
(defun wc-cycle-list-backwards (l)
  (append (last l) (butlast l))
  )
(defun wc-quick-switch ()
  (interactive)
  (setq wc-list (wc-cycle-list wc-list))
  (funcall (car wc-list))
  )
(defun wc-quick-switch-backwards ()
  (interactive)
  (setq wc-list (wc-cycle-list-backwards wc-list))
  (funcall (car (last wc-list)))
  )
(global-set-key (kbd "<f11>") 'wc-quick-switch)
(global-set-key (kbd "C-<f11>") 'wc-quick-switch-backwards)

;;; window_arrangements.el ends here
