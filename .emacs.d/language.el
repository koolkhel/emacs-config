;; UTF-8 настройки
(set-language-environment 'UTF-8)   ;; Использовать окружение UTF-8
(set-terminal-coding-system 'utf-8) ;; Для вывода на экран
(set-keyboard-coding-system 'utf-8) ;; Для ввода с клавиатуры
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)) ;; Для работы с буфером обмена X 
(codepage-setup 1251)           ;; Необходима поддержка кодировок cp866 и cp1251
(define-coding-system-alias 'windows-1251 'cp1251)
(codepage-setup 866)

;; Установки автоопределения кодировок (в порядке LIFO)
(prefer-coding-system 'cp866)
(prefer-coding-system 'alternativnyj-dos)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251)
(prefer-coding-system 'utf-8-unix)
