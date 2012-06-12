(provide 'var-func)

(defun my-colors-light (&optional frame)
  "Set colors suitable for working in light environments,
i.e. in daylight or under bright electric lamps."
  (interactive)
  (if frame
      (select-frame frame)
    (setq frame (selected-frame)))
  ;; Color with minimal eye fatigue in light environments
  ;; is "AntiqueWhite3" (RGB: 205 192 176),
  (set-background-color "AntiqueWhite3")
  (set-foreground-color "black")
  (when (facep 'region)
    (set-face-background 'region "DarkGrey" frame))
  (when (facep 'fringe)
    (set-face-background 'fringe (face-background 'default) frame)
    (set-face-foreground 'fringe (face-foreground 'default) frame)))

(defun my-colors-dark (&optional frame)
  "Set colors suitable for working in the darkness without electricity."
  (interactive)
  (if frame
      (select-frame frame)
    (setq frame (selected-frame)))
  (set-background-color "black")
  (set-foreground-color "DarkGrey")
  (when (facep 'region)
    (set-face-background 'region "DimGray" frame))
  (when (facep 'fringe)
    (set-face-background 'fringe (face-background 'default) frame)
    (set-face-foreground 'fringe (face-foreground 'default) frame)))

;; функции для отступа региона
(defun indent-region-with-tab ()
  (interactive)
  (save-excursion
	(if (< (point) (mark)) (exchange-point-and-mark))
	(let ((save-mark (mark)))
	  (if (= (point) (line-beginning-position)) (previous-line 1))
	  (goto-char (line-beginning-position))
	  (while (>= (point) save-mark)
		(goto-char (line-beginning-position))
		(insert "\t")
		(previous-line 1)))))

(defun unindent-region-with-tab ()
  (interactive)
  (save-excursion
	(if (< (point) (mark)) (exchange-point-and-mark))
	(let ((save-mark (mark)))
	  (if (= (point) (line-beginning-position)) (previous-line 1))
	  (goto-char (line-beginning-position))
	  (while (>= (point) save-mark)
		(goto-char (line-beginning-position))
		(if (= (string-to-char "\t") (char-after (point))) (delete-char 1))
		(previous-line 1)))))

;; прокрутка мышкой по 5 строк
(defun up-slightly ()
  (interactive)
  (scroll-up 5)
  (next-line 5))
(defun down-slightly ()
  (interactive)
  (scroll-down 5)
  (previous-line 5))
;; прокрутка по одной строчке
(defun up-one ()
  (interactive)
  (scroll-up 1)
  (next-line))
(defun down-one ()
  (interactive)
  (scroll-down 1)
  (previous-line))
;; прокрутка по экрану
(defun up-a-lot ()
  (interactive)
  (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))

(defun My-smart-home ()
  "Odd home to beginning of line, even home to beginning of text/code."
  (interactive)
  (if (and (eq last-command 'My-smart-home)
	   (/= (line-beginning-position) (point)))
      (beginning-of-line)
    (beginning-of-line-text))
  )
(defun My-smart-end ()
  "Odd end to end of line, even end to begin of text/code."
  (interactive)
  (if (and (eq last-command 'My-smart-end)
	   (= (line-end-position) (point)))
      (end-of-line-text)
    (end-of-line))
  )
(defun end-of-line-text ()
  "Move to end of current line and skip comments and trailing space.
Require `font-lock'."
  (interactive)
  (end-of-line)
  (let ((bol (line-beginning-position)))
    (unless (eq font-lock-comment-face (get-text-property bol 'face))
      (while (and (/= bol (point))
		  (eq font-lock-comment-face
		      (get-text-property (point) 'face)))
	(backward-char 1))
      (unless (= (point) bol)
	(forward-char 1) (skip-chars-backward " \t\n"))))
  )

;; переход к парной скобке, взят из emacs faq
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; ===== Function to delete a line =====

;; First define a variable which will store the previous column position
(defvar previous-column nil "Save the column position")

;; Define the nuke-line function. The line is killed, then the newline
;; character is deleted. The column which the cursor was positioned at is then
;; restored. Because the kill-line function is used, the contents deleted can
;; be later restored by usibackward-delete-char-untabifyng the yank commands.
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)

  ;; Store the current column position, so it can later be restored for a more
  ;; natural feel to the deletion
  (setq previous-column (current-column))

  ;; Now move to the end of the current line
  (end-of-line)

  ;; Test the length of the line. If it is 0, there is no need for a
  ;; kill-line. All that happens in this case is that the new-line character
  ;; is deleted.
  (if (= (current-column) 0)
      (delete-char 1)

    ;; This is the 'else' clause. The current line being deleted is not zero
    ;; in length. First remove the line by moving to its start and then
    ;; killing, followed by deletion of the newline character, and then
    ;; finally restoration of the column position.
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))

;; делает список с отступами, соответствующими числу табов
(defun my-build-tab-stop-list (width)
  (let ((num-tab-stops (/ 80 width))
	(counter 1)
	(ls nil))
    (while (<= counter num-tab-stops)
      (setq ls (cons (* width counter) ls))
      (setq counter (1+ counter)))
    (set (make-local-variable 'tab-stop-list) (nreverse ls))))


; для doxygen
(defun my-javadoc-return () 
  "Advanced C-m for Javadoc multiline comments.   

Inserts `*' at the beggining of the new line if 
unless return was pressed outside the comment"
  (interactive)

  (setq last (point))

  (setq is-inside
	(if (search-backward "*/" nil t)
	    ;; there are some comment endings - search forward
	    (if (search-forward "/*" last t)
		't
	      'nil)
	
	  ;; it's the only comment - search backward
	  (goto-char last)
	  (if (search-backward "/*" nil t)
	      't
	    'nil
	    )
	  )
	)

  ;; go to last char position
  (goto-char last)

  ;; the point is inside some comment, insert `*'
  (if is-inside
      (progn 
	(insert "\n* ")
	(indent-for-tab-command))
    
    ;; else insert only new-line
    (newline-and-indent))
  
  )

(add-hook 'c++-mode-hook (lambda () 
			   (local-set-key "\r" 'my-javadoc-return)))
(add-hook 'c-mode-hook (lambda ()
			 (linum-mode t)
			 (local-set-key "\r" 'my-javadoc-return)))

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
(add-hook 'c-mode-common-hook 'my-cedet-hook)
