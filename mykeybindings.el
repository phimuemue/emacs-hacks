;; Here are some handy keybindnigs that have to work everywhere

(global-set-key (kbd "<f5>") 'eval-buffer)			; quick buffer evaluation
(global-set-key (kbd "C-/") 'comment-region)			; quick comment
(global-set-key (kbd "C-&") 'uncomment-region)			; quick uncomment
(global-set-key (kbd "M-Y")					; nice yanking
		'(lambda ()(interactive)(yank-pop -1)))	                
(global-set-key (kbd "C-S-n") 'forward-paragraph)		; fast downward movin
(global-set-key (kbd "C-S-p") 'backward-paragraph)		; fast upward movin
(global-set-key (kbd "s-SPC") 'menu-bar-mode)			; toggle menu bar
(global-set-key (kbd "C-<tab>") 'other-window)			; next window
(global-set-key (kbd "C-S-<iso-lefttab>") 
		'(lambda () (interactive) (other-window -1)))	; previous window
(global-set-key (kbd "C-<kp-6>") 'enlarge-window-horizontally)	; easily adjust window heights and widths
(global-set-key (kbd "C-<kp-4>") 'shrink-window-horizontally)	; easily adjust window heights and widths
(global-set-key (kbd "C-<kp-2>") 'shrink-window)		; easily adjust window heights and widths
(global-set-key (kbd "C-<kp-8>") 'enlarge-window)		; easily adjust window heights and widths
(global-set-key [(meta f12)] 'rf-show-rf-list)			; show recent files
(global-set-key [(meta shift f12)] 
		'(lambda ()					; open .emacs file
		   (interactive)
		   (message "Opening .emacs")
		   (find-file "~/.emacs")))
(global-set-key [f7]						; toggle language (flyspell)
		'(lambda () 
		   (interactive)
		   (progn 
		     (cycle-ispell-languages)
		     (flyspell-mode 1)
		     (flyspell-buffer)
		     )
		   ))
(global-set-key (kbd "C-%") 'goto-match-paren)			; goto matching parenthesis
(global-set-key (kbd "<f8>") 'load/yas/stuff)			; toggle yas-mode
(global-set-key (kbd "<S-f3>") 'kmacro-cycle-ring-next)         ; cycle through defined macros
