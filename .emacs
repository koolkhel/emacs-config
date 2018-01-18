;; Time-stamp: <2012-07-02 14:43:17 Yury Luneff .emacs>

;; end of Xrefactory configuration part ;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq warning-suppress-types nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((c-mode . "linux") (c++-mode . "linux") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(c-indent-comments-syntactically-p nil)
 '(calendar-setup nil)
 '(calendar-week-start-day 1)
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(diary-hook (quote (auto-fill-mode)))
 '(doxymacs-command-character nil)
 '(doxymacs-doxygen-dirs (quote (("/home/yury/work/client"))))
 '(ecb-auto-activate t)
 '(ecb-cache-directory-contents (quote (("^/\\([^:/]*@\\)?\\([^@:/]*\\):.*" . 0) (".*" . 200))))
 '(ecb-excluded-directories-regexps (quote ("^\\(CVS\\|\\..*\\)$")))
 '(ecb-layout-name "bitterman2")
 '(ecb-options-version "2.40")
 '(ecb-source-file-regexps (quote ((".*" ("") ("\\(\\(M\\|m\\)akefile.*\\|.*\\.\\(java\\|el\\|c\\|cc\\|cpp\\|hpp\\|xml\\|sh\\|pl\\|h\\|hh\\|txt\\|mk\\|html\\|texi\\|info\\|bnf\\)\\)$")))))
 '(ecb-source-path (quote (("~/work/main/people" "people") ("~/work/main/gpsreader" "gpsreader") ("~/work/main/sender" "sender") ("~/work/modules/piopins" "piopins") ("~/work/motion/overlay" "overlay") ("~/work/motion/mjpeg-streamer/target/mjpeg-streamer" "mjpeg_streamer") ("~/work/motion/recorder" "recorder") ("~/work/main/runmanager/start_scripts" "start_scripts") ("/home/yury/work/main/samplecollector" "samplecollector") ("/home/yury/work/main" "main") ("/home/yury/work/components" "components") ("/home/yury/work" "work") ("/" "/") ("/home/yury/work/main/sysdaemon" "sysdaemon") ("/home/yury/reldata/index" "index"))))
 '(ecb-sources-sort-method (quote extension))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote image))
 '(ecb-windows-width 45)
 '(gdb-many-windows t)
 '(gdb-use-separate-io-buffer nil)
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(js2-basic-offset 4)
 '(js2-highlight-level 3)
 '(line-number-mode t)
 '(mmm-submode-decoration-level 1)
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "/usr/local/arm-host/include")))
 '(semantic-default-c-path (quote ("/usr/include" "/usr/local/arm-host/include")))
 '(semantic-lex-spp-use-headers-flag nil)
 '(show-paren-mode t nil (paren))
 '(tabbar-mode t)
 '(tags-case-fold-search nil)
 '(transient-mark-mode t)
 '(vc-cvs-header (quote ("$Revision$" "$Date$" "$Author$")))
 '(vc-display-status t)
 '(vc-follow-symlinks nil)
 '(vc-mcvs-header (quote ("$Revision$" "$Date$" "$Author$")))
 '(version-control (quote never))
 '(woman-use-own-frame nil)
 '(x-select-enable-clipboard t)
 '(xref-coloring nil)
 '(xref-completion-case-sensitive t)
 '(xref-files-encoding (quote utf)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mmm-cleanup-submode-face ((t nil)))
 '(mmm-code-submode-face ((t nil)))
 '(mmm-comment-submode-face ((t nil)))
 '(mmm-declaration-submode-face ((t nil)))
 '(mmm-default-submode-face ((t nil)))
 '(mmm-init-submode-face ((t nil)))
 '(mmm-output-submode-face ((t nil)))
 '(mmm-special-submode-face ((t nil))))

;; ------------------------ зависимости -------------------------
(add-to-list 'load-path "~/.emacs.d")
(setq load-path (cons "~/.emacs.d/jabber" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/remember-el" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/planner-el" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/muse-el" load-path))
(setq load-path (cons "/usr/share/emacs/site-lisp/php-elisp" load-path))
(setq load-path (cons "~/.emacs.d/ecb" load-path))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(setq stack-trace-on-error (lambda ()
			     t))

;; (require 'notify)

(require 'bookmark+)

(require 'colors)
;; цветовые схемы
(require 'color-theme)
(color-theme-initialize)
;(color-theme-classic)
(color-theme-dark-blue2)
;(color-theme-sitaramv-solaris)
;(color-theme-blue-mood)
;(color-theme-emacs-21)
;(color-theme-solarized-dark)

;(toggle-menu-bar-mode-from-frame)
(menu-bar-mode -1)
(scroll-bar-mode)

;; временные отметки сохранения файла
(require 'time-stamp)

;; .js файлы
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.gdbinit?$" . gdb-script-mode))
(setq auto-mode-alist (cons '("\\.h?$" . c++-mode) auto-mode-alist))

;; для нормальной прокрутки
(require 'smooth-scrolling)
;; сохранение позиции в файле
(require 'saveplace)
;; add tool to strip trailing white space.
(require 'whitespace)
;; line numbering
(require 'linum)
(require 'cc-mode)

;; выбор предыдущих файлов
(require 'recentf)
(recentf-mode 1)

;; -------------------- установка переменных --------------------

;; UTF-8 настройки
(set-language-environment 'UTF-8)   ;; Использовать окружение UTF-8
(set-terminal-coding-system 'utf-8) ;; Для вывода на экран
(set-keyboard-coding-system 'utf-8) ;; Для ввода с клавиатуры
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)) ;; Для работы с буфером обмена X
;(codepage-setup 1251)           ;; Необходима поддержка кодировок cp866 и cp1251
;(define-coding-system-alias 'windows-1251 'cp1251)
;(codepage-setup 866)

;; Установки автоопределения кодировок (в порядке LIFO)
(prefer-coding-system 'cp866)
(prefer-coding-system 'alternativnyj-dos)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251)
(prefer-coding-system 'utf-8-unix)

(setq ls-lisp-dirs-first t)             ;display dirs first in dired

;; auto-mode
;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; размер окна компиляции
(setq compilation-window-height 8)

(setq comment-column 52)

(setq tramp-default-method "ssh")
(setq tramp-default-user "root")

;; прокрутка по одной строчке
;; (setq scroll-step 1)
;; 0 строчек до конца экрана
(setq scroll-margin 0)
(setq smooth-scroll-margin 0)
;; отображение времени
(display-time)
(setq display-time-24hr-format t)

; мигание курсора
(blink-cursor-mode nil)

; табы по дефолту в 4
(setq tab-width 4)

;; нет файлам-бекапам )
(setq make-backup-files nil)

(setq show-paren-style 'paren)
;;
(setq-default fill-column 72)		;выравнивание текстов и комментариев
(setq-default save-place t)		;запоминает, на какой строчке был открыт закрытый файл

(setq time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S %u %f")

(setq user-login-name "Yury Luneff")

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(set-face-font 'default "-*-terminus-bold-r-*-*-14-*-*-*-*-*-*-*")
;  (set-face-font 'default "-misc-fixed-medium-*-*-*-20-*-*-*-*-*-*-*")))
;  (set-face-font 'default "-misc-fixed-*-r-*-*-20-*-*-*-*-*-*-*")))

(setq tex-dvi-view-command "evince")	;просмотр .dvi из latex-mode

;; при успешном завершении компиляции автоматическое закрытие окна
(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;;there were errors
            (notify "Error" "compilation errors, press C-x ` to visit")

          ;;no errors, make the compilation window go away in 0.5 seconds
;          (run-at-time 0.5 nil 'delete-windows-on buf)
          (notify "OK" "Last operation successful!"))))

;; ----------------------- /// ----------------------------------

;; --------------------- hooks ----------------------------------
;; если скрипт, то делаем его исполняемым при сохранении
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'write-file-hooks 'time-stamp)

;; --------------------- /// ------------------------------------
;; y/n вместо yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; отруб тулбара
(tool-bar-mode 0)

;; --------------------- /// ------------------------------------
(pc-selection-mode)			;обычная работа с shift-стрелки

(iswitchb-mode 1)               ; smart buffer switching
;; убираем ненужные буферы из списка возможных вариантов переключения
(add-to-list 'iswitchb-buffer-ignore "*Messages*")
(add-to-list 'iswitchb-buffer-ignore "*Backtrace")
(add-to-list 'iswitchb-buffer-ignore "*Quail Com")
(add-to-list 'iswitchb-buffer-ignore "*Buffer")
(add-to-list 'iswitchb-buffer-ignore "*fsm-debug")
(add-to-list 'iswitchb-buffer-ignore "*Completions")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")

(delete-selection-mode 1)       ; delete the selection area with a keypress

; старт сервера (чтобы запускать редактирование по emacsclient)
(server-start)
;; --------------------- /// ------------------------------------
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
     (column (c-langelem-2nd-pos c-syntactic-element))
     (offset (- (1+ column) anchor))
     (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "/work/")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))

(add-hook 'c-mode-common-hook
	  (lambda()
	    (add-hook 'local-write-file-hooks
		      '(lambda()
			 (save-excursion
			   (delete-trailing-whitespace))))))

(defconst my-c-lineup-maximum-indent 30)
(defun my-c-lineup-arglist (langelem)
  (let ((ret (c-lineup-arglist langelem)))
    (if (< (elt ret 0) my-c-lineup-maximum-indent)
	ret
      (save-excursion
	(goto-char (cdr langelem))
	(vector (+ (current-column) 8))))))
(defun my-indent-setup ()
  (setcdr (assoc 'arglist-cont-nonempty c-offsets-alist)
	  '(c-lineup-gcc-asm-reg my-c-lineup-arglist)))

(setq-default
 c-basic-offset 8
 tab-width 8
 c-hungry-delete-key 1
 indent-tabs-mode t)
;(require 'google-c-style)
;; здесь настраивать все отступы и им подобные вещи
;; вызывается при вхождении в C-mode
(defun bitterman_c_mode()
;  (message "Loading my own C mode")

;  (define-key c-mode-map "\C-m" 'c-context-line-break) ; правильный бряк для комментариев и вообще
  (c-set-style "linux")
  ;; отображает имя текущей функции
  (which-function-mode 1)
  (my-indent-setup)
  (c-set-offset 'comment-intro '0)
)

(require 'gtags)

(add-hook 'gtags-mode-hook
  (lambda()
    (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
    (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

(defun my_perl_mode()
  (define-key perl-mode-map (kbd "DEL") 'c-hungry-delete)
  )
(add-hook 'perl-mode-hook 'my_perl_mode)

;(add-hook 'c-mode-common-hook 'doxymacs-mode)
;(add-hook 'c-mode-common-hook (lambda ()
;				(c-set-style 'linux)
;				))
(add-hook 'c-mode-common-hook
  (lambda ()
    (bitterman_c_mode)
    (require 'gtags)
    (gtags-mode t)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;(require 'doxymacs)
;(defun my-doxymacs-font-lock-hook ()
;    (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;        (doxymacs-font-lock)))

;(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

(setq scroll-preserve-screen-position t)

;; перенос слов
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; полное имя файла в имени буфера
(add-hook 'find-file-hooks
 '(lambda ()
  (setq mode-line-buffer-identification 'buffer-file-truename)))

(load-file "~/.emacs.d/keys.el")		    ;настройки клавиш
(require 'var-func)

(put 'scroll-left 'disabled nil)		    ;не боимся скроллить влево-вправо


(global-font-lock-mode t)


(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))

; Make new frames fullscreen by default. Note: this hook doesn't
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

(require 'tabbar)
(tabbar-mode t)

(global-set-key [M-s-left] 'tabbar-backward)
(global-set-key [M-s-right] 'tabbar-forward)

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((or (eq major-mode 'c++-mode)
	 (eq major-mode 'c-mode)
	 (eq major-mode 'makefile-gmake-mode))
     "Development"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)
