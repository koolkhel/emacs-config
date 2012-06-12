;; Time-stamp: <2012-06-05 11:55:13 Yury Luneff keys.el>
(provide 'keys)
;; установки клавиш:

;; eval-region очень популярен среди меня
(global-set-key (kbd "\e\er") 'eval-region)

;; ентер отступает; не факт, правда, что лучше именно так
(global-set-key (kbd "\C-m") 'newline-and-indent)

;; вкл. ecb
(global-set-key (kbd "\e\ee") 'ecb-activate)
(global-set-key (kbd "\e\ed") 'ecb-deactivate)

;; блок отступается вправо и влево при нажатии клавиши alt
;(global-set-key [(meta right)] 'indent-region-with-tab)
;(global-set-key [(meta left)] 'unindent-region-with-tab)

(global-set-key [(meta up)] 'down-one)
(global-set-key [(meta down)] 'up-one)
(global-set-key (kbd "<s-down>") 'up-one)
(global-set-key (kbd "<s-up>") 'down-one)


;; прокрутка:
;; выделение всего буфера по C-a
;(global-set-key "\C-a" 'mark-whole-buffer)

(global-set-key (kbd "<S-return>") 'find-file-at-point)

(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
(global-set-key [(control up)] 'down-slightly)
(global-set-key [(control down)] 'up-slightly)

(global-set-key [f1] 'linum-mode)	;номера строчек
;; переключение на другое окно
(global-set-key [f2] 'other-window)	;следующее окно, с шифтом - предыдущее
(global-set-key [(shift f2)] '(lambda ()
				(interactive)
				(other-window -1)))
(global-set-key [f3] 'browse-url-at-point)


(global-set-key [f4] 'ecb-other-window)	;и нафига?
;; компиляция по f9
(global-set-key [(f9)] 'compile)

(global-set-key [f7] 'tags-search)
(global-set-key [f6] (lambda ()
		       (interactive)
		       (insert "\\texttt{")))
;; прокрутка
(global-set-key [f11] 'up-one)
(global-set-key [f12] 'down-one)
(global-set-key [(shift f11)] 'up-slightly)
(global-set-key [(shift f12)] 'down-slightly)

;; Удаление строчки сразу
(global-set-key "\C-l" 'nuke-line)

(global-set-key (kbd "<C-delete>") 'kill-word)
;; отмена по C-z
(global-set-key "\C-z" 'undo)

;; строчка по C-c C-g
(global-set-key [(control c) (control g)] 'goto-line)

;; убитие текущего буфера
(global-set-key "\C-x\C-k" 'kill-this-buffer)
(global-set-key [(control x) (k)] 'kill-this-buffer)

;; открыть боард-файл 9g45
(global-set-key "\C-cb" (lambda ()
			  (interactive)
			  (find-file "/work/linux-2.6/arch/arm/mach-at91/board-sam9m10g45ek.c")))

;; закомменчивание регионов
(global-set-key [(control shift c)] 'comment-region) ;за
(global-set-key [(control alt c)] 'uncomment-region) ;рас

(global-set-key "\e\eg" 'gdb-restore-windows) ;чиним окна отладчика

;; ман на текущее слово
(global-set-key [(f5)] (lambda ()	
			 (interactive)
			 (woman (current-word))))

;; просто man
(global-set-key [f4] 'woman)

(global-set-key "%" 'match-paren)

;; не работает (
(global-set-key (kbd "<S-mouse-2>") '(lambda ()
				      (interactive "r")
				      (mouse-set-point)
				      (find-file-at-point)))

;; Redefine the Home/End keys to (nearly) the same as visual studio behaviour
;; special home and end by Shan-leung Maverick WOO 
(global-set-key [home] 'My-smart-home)
(global-set-key [end] 'My-smart-end)

(global-set-key (kbd "<s-left>") 'My-smart-home)
(global-set-key (kbd "<s-right>") 'My-smart-end)

(global-set-key [f11] 'toggle-fullscreen)
