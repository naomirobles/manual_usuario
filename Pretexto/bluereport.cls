% bluereport.cls - Clase personalizada con estilo azul elegante
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
\RequirePackage{amsmath,amsfonts,amssymb,mathtools}
%\RequirePackage{graphicx,float,subcaption,wrapfig}
\RequirePackage{graphicx,float,wrapfig}
\RequirePackage{geometry,fancyhdr,titlesec,tocloft,enumitem}
\RequirePackage{xcolor,microtype}
\RequirePackage{booktabs,array,longtable,colortbl}
\RequirePackage{listings}
\RequirePackage{pgffor}
\IfFileExists{minted.sty}{\RequirePackage{minted}[cache=false]}{}
\RequirePackage[backend=biber,style=ieee]{biblatex}
\addbibresource{referencias.bib}
\usepackage{helvet} % Para usar la fuente Helvetica (similar a la del ejemplo)
\usepackage{lipsum} % Solo para texto de ejemplo
\RequirePackage{tikz}
\RequirePackage{afterpage}
\usetikzlibrary{calc,positioning}
\usepackage{multicol}

\usepackage{array}
\usepackage{colortbl}
\usepackage{xcolor}
\usepackage{tcolorbox}
\usepackage{tikz}
\usepackage{enumitem}
\usepackage{booktabs}
\usepackage{hyperref}
\RequirePackage{hyperref}
%----------------------------------------
% PALETA DE COLORES
\definecolor{primaryblue}{HTML}{2b4aad}
\definecolor{yellowlight}{HTML}{f4fad1}
\definecolor{light}{HTML}{e0e7ff}

\definecolor{yellowdark}{HTML}{c2c886}
\definecolor{lightblue}{HTML}{a4b9ff}
\definecolor{charcoal}{RGB}{54,69,79}
\definecolor{white}{RGB}{255,255,255}
\definecolor{lightgray}{RGB}{245,245,245}
\definecolor{mediumgray}{RGB}{189,189,189}
% Definir colores personalizados
\definecolor{greenlight}{RGB}{205,214,183}
\definecolor{yellowlight}{RGB}{227,222,192}

\definecolor{charcoal}{RGB}{51,51,51}
\definecolor{mediumgray}{RGB}{150,150,150}

% Colores adicionales para código
\definecolor{codegreen}{RGB}{28,120,28}
\definecolor{codegray}{RGB}{128,128,128}
\definecolor{codeblue}{RGB}{0,102,204}
\definecolor{codepurple}{RGB}{153,51,153}
\definecolor{codebackground}{RGB}{248,248,248}
\definecolor{codeborder}{RGB}{200,220,200}

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
\makeatother

%----------------------------------------
% ENTORNOS PERSONALIZADOS
\IfFileExists{tcolorbox.sty}{
  \RequirePackage{tcolorbox}
  \tcbuselibrary{skins,breakable}
  
  \newenvironment{definicion}[1][Definición]{%
    \begin{tcolorbox}[
      colback=white,colframe=primaryblue,
      coltitle=white,colbacktitle=primaryblue,
      title=#1,fonttitle=\bfseries,
      boxrule=1pt,arc=3pt
    ]
  }{\end{tcolorbox}}

  \newenvironment{ejemplo}[1][Ejemplo]{%
    \begin{tcolorbox}[
      colback=lightgray,colframe=primaryblue,
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
}{}

% Comando personalizado para celdas con esquinas redondeadas
\newcommand{\roundedcell}[3][yellowlight]{%
    \begin{tcolorbox}[
        colback=#1,
        colframe=#1,
        boxrule=0pt,
        arc=3pt,
        left=2pt,
        right=2pt,
        top=2pt,
        bottom=2pt,
        width=\linewidth
    ]
    \textbf{\color{primaryblue}#2} #3
    \end{tcolorbox}
}

