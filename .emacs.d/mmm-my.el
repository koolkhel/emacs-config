
;; ---------------------------------------------------------------------------
;; (X)HTML - PSGML with MMM Mode for CSS, Javascript and PHP support

(define-derived-mode xml-html-mode xml-mode "XHTML"
  "This version of html mode is just a wrapper around xml mode."
  (make-local-variable 'sgml-declaration)
  (make-local-variable 'sgml-default-doctype-name)
  (setq
   sgml-default-doctype-name    "html"
   sgml-declaration             "/usr/share/sgml/xml.dcl"
   sgml-always-quote-attributes t
   sgml-indent-step             2
   sgml-indent-data             t
   sgml-minimize-attributes     nil
   sgml-omittag                 nil
   sgml-shorttag                nil
   )
  )

(define-derived-mode sgml-html-mode sgml-mode "HTML"
  "This version of html mode is just a wrapper around sgml mode."
  (make-local-variable 'sgml-declaration)
  (make-local-variable 'sgml-default-doctype-name)
  (setq
   sgml-default-doctype-name    "html"
   sgml-declaration             "~/lib/DTD/html401/HTML4.decl"
   sgml-always-quote-attributes t
   sgml-indent-step             2
   sgml-indent-data             t
   sgml-minimize-attributes     nil
   sgml-omittag                 nil
   sgml-shorttag                nil
   )
  )

;; PHP-Mode
;(require 'php-mode)
;(add-hook 'php-mode-user-hook 'turn-on-font-lock)

;; CSS-Mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level '2)

;; javascript-generic-mode
(require 'generic-x)

;; MMM-Mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

;; Set up an mmm group for fancy html editing
(mmm-add-group
 'fancy-html
 '(
         (html-php-embedded
                :submode php-mode
                :face mmm-output-submode-face
                :front "<[?]php"
                :back "[?]>")
         (html-css-embedded
                :submode css-mode
                :face mmm-declaration-submode-face
                :front "<style\[^>\]*>"
                :back "</style>")
         (html-css-attribute
                :submode css-mode
                :face mmm-declaration-submode-face
                :front "\\bstyle=\\s-*\""
                :back "\"")
         (html-javascript-embedded
                :submode javascript-generic-mode
                :face mmm-code-submode-face
                :front "<script\[^>\]*>"
                :back "</script>")
         (html-javascript-attribute
                :submode javascript-generic-mode
                :face mmm-code-submode-face
                :front "\\bon\\w+=\\s-*\""
                :back "\"")
   )
)

;; What files to invoke the new html-mode for?
;;   HTML and XHTML tend to have the same file extensions. However, XHTML
;;   hopefully has either one or both of <?xml or W3C//DTD XHTML near the
;;   beginning. So we default to sgml-html-mode and then add a hook to
;;   sgml-html-mode to check for either of those strings and switch to
;;   xml-html-mode if it finds them.

(add-to-list 'auto-mode-alist '("\\.inc\\'" . sgml-html-mode))
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . sgml-html-mode))
(add-to-list 'auto-mode-alist '("\\.[sj]?html?\\'" . sgml-html-mode))

(add-hook 'sgml-html-mode-hook 'guess-xhtml-hook t)

(defun guess-xhtml-hook ()
  "Guess whether the current buffer is XHTML."
  (when 
    (save-excursion 
      (search-forward-regexp "<[?]xml\\|//W3C//DTD XHTML" 80 t))
    (xml-html-mode)
    ))

;; Make smgl-html-mode and xml-html-mode use fancy-html
(add-to-list 'mmm-mode-ext-classes-alist '(sgml-html-mode nil fancy-html))
(add-to-list 'mmm-mode-ext-classes-alist '(xml-html-mode nil fancy-html))