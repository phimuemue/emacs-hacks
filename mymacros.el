(defun count-region (beginning end)
  "Print number of words and chars in region."
  (interactive "r")
  (message "Counting ...")
  (message "beginning: %d. end: %d." beginning end)
  (save-excursion
    (let (wCnt charCnt)
      (setq wCnt 0)
      (setq charCnt (- end beginning))
      (goto-char beginning)
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq wCnt (1+ wCnt)))

      (message "Words: %d. Chars: %d." wCnt charCnt)
      )))
