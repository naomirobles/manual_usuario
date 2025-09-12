% bluereport.cls - Clase personalizada con estilo azul elegante (Versión limpia)
% Autor: Usuario
% Fecha: 2025/09/02

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bluereport}[2025/09/02 Clase personalizada con estilo azul]

%----------------------------------------
% Basada en article
\LoadClass[12pt,a4paper]{article}

%----------------------------------------
% PAQUETES REQUERIDOS
\RequirePackage{ifxetex,ifluatex}
\ifxetex
  \RequirePackage{fontspec}
\else\ifluatex
  \RequirePackage{fontspec}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{lmodern}
\fi\fi

\RequirePackage[spanish]{babel}
\RequirePackage{graphicx,float}
\RequirePackage{geometry,fancyhdr,titlesec}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage[most]{tcolorbox}
\RequirePackage{enumitem}

%----------------------------------------
% PALETA DE COLORES
\definecolor{primaryblue}{HTML}{2b4aad}
\definecolor{yellowlight}{HTML}{f4fad1}
\definecolor{light}{HTML}{e0e7ff}
\definecolor{yellowdark}{HTML}{c2c886}
\definecolor{charcoal}{RGB}{54,69,79}
\definecolor{lightgray}{RGB}{245,245,245}
\definecolor{mediumgray}{RGB}{189,189,189}

%----------------------------------------
% GEOMETRÍA
\geometry{a4paper,left=2.5cm,right=2.5cm,top=3cm,bottom=3cm,headheight=15pt,headsep=0.5cm,footskip=1cm}

%----------------------------------------
% ENCABEZADOS Y PIES
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrule}{%
  {%
    \color{primaryblue}\hrule width\headwidth height 2pt\relax%
  }%
}
\fancyhead[L]{\color{primaryblue}\small\leftmark}
\fancyhead[R]{\color{primaryblue}\small\thepage}
\fancyfoot[C]{\color{mediumgray}\small\thepage}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyfoot[C]{\color{mediumgray}\small\thepage}%
}

%----------------------------------------
% TÍTULOS Y SECCIONES
\makeatletter
\renewcommand{\maketitle}{%
  \begin{center}
    {\colorbox{yellowlight}{%
      \begin{minipage}{0.9\textwidth}
        \centering
        \vspace{0.5cm}
        {\Huge\bfseries\color{primaryblue}\@title\par}
        \vspace{0.3cm}
        \ifx\@author\empty\else
          {\large\color{primaryblue}\@author\par}
          \vspace{0.2cm}
        \fi
        \ifx\@date\empty\else
          {\normalsize\color{charcoal}\@date\par}
          \vspace{0.2cm}
        \fi
        \vspace{0.3cm}
      \end{minipage}%
    }}%
    \vspace{0.5cm}%
    {\color{primaryblue}\rule{0.8\textwidth}{2pt}}%
    \normalcolor
    \vspace{1cm}%
  \end{center}%
}

\titleformat{\section}[hang]
  {\normalfont\Large\bfseries}
  {\colorbox{yellowlight}{\color{primaryblue}\thesection}}
  {0.5em}
  {\color{primaryblue}}
  [{\titlerule[1pt]}]

\titleformat{\subsection}[hang]
  {\normalfont\large\bfseries}
  {\color{primaryblue}\thesubsection}
  {0.5em}
  {\color{primaryblue}}

\titleformat{\subsubsection}[hang]
  {\normalfont\normalsize\bfseries}
  {\color{primaryblue}\thesubsubsection}
  {0.5em}
  {\color{primaryblue}}

% Personalizar tabla de contenidos
\renewcommand{\tableofcontents}{%
  \section*{Índice}
  \@starttoc{toc}%
}

\renewcommand{\listoffigures}{%
  \section*{Lista de Figuras}
  \@starttoc{lof}%
}
\makeatother

%----------------------------------------
% ENTORNOS PERSONALIZADOS
\newenvironment{definicion}[1][Definición]{%
  \begin{tcolorbox}[
    colback=white,colframe=primaryblue,
    coltitle=white,colbacktitle=primaryblue,
    title=#1,fonttitle=\bfseries,
    boxrule=1pt,arc=3pt
  ]
}{\end{tcolorbox}}

\newenvironment{importante}[1][Importante]{%
  \begin{tcolorbox}[
    colback=yellowlight,colframe=yellowdark,
    coltitle=white,colbacktitle=yellowdark,
    title=#1,fonttitle=\bfseries,
    boxrule=2pt,arc=3pt
  ]
}{\end{tcolorbox}}

%----------------------------------------
% HIPERVINCULOS
\RequirePackage[colorlinks=true, linkcolor=primaryblue,
                citecolor=primaryblue, urlcolor=primaryblue]{hyperref}