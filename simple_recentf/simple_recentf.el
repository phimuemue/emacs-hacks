(provide 'rf)
(require 'cl) ; evt. auslagern bzw voraussetzen.

; Variables needed for the stuff to work (more or less) properly
(defvar rf-path "~/rf.list" "Path to the file where recently opened files are stored.")
(defvar rf-list () "A list containing recently opened files")
(defvar rf-max-count 100 "Maximum number of recently opened files stored.")

; Stuff that shall be done to maintain the rf-list
(defun rf-add-file-to-list ()
  "Adds an opened file to the list of recently opened files."
  (interactive)
  (progn 
    (message buffer-file-name)
    (push buffer-file-name rf-list)
    (setq rf-list (delete-dups rf-list))))

; Stuff for opening the files
(defun rf-open-file-at-current-line (button)
  "Openes the file specified by the corresponding button."
  (find-file (button-label button))
  (kill-buffer "*rf-list*"))

(define-button-type 'rf-open-file-button
  'action 'rf-open-file-at-current-line
  'follow-link t)

(defun rf-show-rf-list ()
  "Shows a buffer containing the names of recently opened files."
  (interactive)
  (progn
    (message "Creating rf-list")
    (switch-to-buffer "*rf-list*")
    (dolist (f rf-list)
      (insert-text-button f :type 'rf-open-file-button)
      (insert "\n")
      )
    (beginning-of-buffer)))

; Stuff for automatically saving the rf-list
(defun rf-write-rf-list ()
  "Writes the list of recently opened files to a file."
  (interactive)
  (with-temp-file rf-path
    (setq counter 0)
    (dolist (f rf-list)
      (if (< counter rf-max-count)
	  (progn 
	    (insert f)
	    (incf counter)
	    (insert "\n"))))))

; Stuff for automatically reading the rf-list
(defun rf-read-rf-list ()
  "Reads the list of recently opened files."
  (interactive)
  (with-temp-buffer
    (insert-file-contents rf-path)
    (setq rf-list (split-string (buffer-string) "\n" t))))

; Hooks
(defun rf-mode ()
  (interactive)
  (add-hook 'emacs-startup-hook 'rf-read-rf-list)
  (add-hook 'find-file-hooks 'rf-add-file-to-list)
  (add-hook 'kill-emacs-hook 'rf-write-rf-list))
