(provide 'latex-snip)

(defun insert-latex-skel ()
  (interactive)
  (insert "\\documentclass\[a4paper,12pt,oneside\]{scrreprt}
\\usepackage\[a4paper,
left=2cm, right=1.5cm, top=1.5cm, bottom=3cm\]{geometry}
\\usepackage\[warn\]{mathtext}
\\usepackage\[T2A\]{fontenc}
\\usepackage\[utf8x\]{inputenc}
\\usepackage\[english,russian\]{babel}
\\usepackage\{indentfirst\}
\\usepackage\{amsmath\}
\\usepackage\{graphicx\}
\\usepackage\{textcomp\}
\\usepackage{fancyhdr}
\\pagestyle{fancy}
\\renewcommand{\\headrulewidth}{0pt}
\\renewcommand{\\footrulewidth}{1pt}
\\fancyhead\[CO,CE\]{}
\\fancyhead\[LO,LE\]{}
\\fancyhead\[RO,RE\]{}
\\fancyfoot\[RO,RE\]{\\hfil \\thepage}
\\fancyfoot\[CO,CE\]{}
\\fancyfoot\[LO,LE\]{}

\\fancypagestyle{plain}{
  \\fancyhf{}
  \\fancyhead[CO,CE]{}
  \\fancyhead[LO,LE]{}
  \\fancyhead[RO,RE]{}
  \\fancyfoot[RO,RE]{\\hfil \\thepage}
  \\fancyfoot[CO,CE]{}
  \\fancyfoot[LO,LE]{}
}
% --- номера страниц ---
\\usepackage{ucs}

")
   (insert "\\begin{document}\n")
   (save-excursion
     (insert "\n\\end{document}\n")))

(defun insert-title-page ()
  (interactive)
  (insert "\\begin{titlepage}
\\begin{center}
\\small
МИНИСТЕРСТВО ОБРАЗОВАНИЯ И НАУКИ РОССИЙСКОЙ ФЕДЕРАЦИИ\\par
Федеральное агентство по образованию\\par
Технологический институт\\par
Федерального государственного образовательного учреждения\par
высшего профессионального образования\\par
\<\<Южный федеральный университет\>\>\\par
\\medskip
Факультет автоматики и вычислительной техники\\par
\\medskip
Кафедра математического обеспечения и применения ЭВМ

\\vspace{4cm}

\\huge
\\textbf{Отчёт}
\\normalsize\\par
по лабораторной работе
по курсу\\par")
  (save-excursion
    (insert "
\\textbf{\<\<\>\>}
\\medskip\\par
\\small
\\textbf{\<\<\>\>}
\\vspace{3cm}
\\begin{flushright}
Выполнил:\\par
студент гр.А-104\\par
Лунёв Ю\.Г\.
\\underline{\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~}\\par
\\end{flushright}

\\vspace{0\.5cm}
\\begin{flushright}
Проверил:\\par
\\par\\medskip
\<\<\\underline{~~~~~~~}\>\> \\underline{\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~\~} 2007 г\.
\\end{flushright}
\\end{center}
\\end{titlepage}
\\newpage
")))