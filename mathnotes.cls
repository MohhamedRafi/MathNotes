\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathnotes}[2020/07/07 Math Notes]	

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClassWithOptions{book}

%-------------------- packages -----------------%
% math 
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}


% headers and links and chapters
\RequirePackage{hyperref}
\RequirePackage[Sonny]{fncychap}



% other 
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}
\RequirePackage{float}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{fullpage}
%\RequirePackage{mmacells}
\RequirePackage{mdframed}

%-------------------- variables ---------------%

%-------------------- frames ------------------%
\newcounter{theorems}
\newcounter{definition}

% definition and theorems
\mdfdefinestyle{definition}{
	linecolor=black,linewidth=0.3pt,
	frametitlerule=true,
	frametitlebackgroundcolor=white,
	innertopmargin=\topskip,
	shadow=true,
	shadowsize=3pt,
	shadowcolor=black!50,
	bottomline=false
}
\newcommand{\definition}[2]{
	\stepcounter{definition}
	\begin{mdframed}[style=definition, frametitle={Definition (\thedefinition): #1}]
	#2
	\end{mdframed}
}
\newcommand{\theorem}[2]{
	\stepcounter{theorems}
	\begin{mdframed}[style=definition, frametitle={Theorem (\thetheorems): #1}]
	#2
	\end{mdframed}
}


% notes
\mdfdefinestyle{notes}{
	linecolor=black,linewidth=0.4pt,
	leftmargin=1cm,
	rightmargin=1cm,
	bottomline=false,
	shadow=true,
	shadowsize=3pt,
	shadowcolor=black!50
}
\newcommand{\note}[1]{
\begin{mdframed}[style=notes, frametitle={\textbf{Note}:}]
	#1 
\end{mdframed}}
% identities

%--------------------- paragraphs --------------%
\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

%-------------------- headers  -----------------%
\RequirePackage{fancyhdr}
\fancyhf{}
\pagestyle{fancy}
\fancyfoot[R]{Mohhamed Rafi}
\fancyfoot[C]{\thepage}
\fancyfoot[L]{Chapter \thechapter}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.1mm}%

\fancypagestyle{plain}{
	\fancyhf{}
  	\fancyfoot[R]{Mohhamed Rafi}%
  	\fancyfoot[C]{\thepage}%
  	\fancyfoot[L]{Chapter \thechapter}%
	\renewcommand{\headrulewidth}{0.0mm}
	\renewcommand{\footrulewidth}{0.1mm}%
}   

%-------------------- chapters -----------------%
\ChNameUpperCase 
\ChNameVar{\raggedleft\normalsize\rm} 
\ChRuleWidth{1pt}
\ChTitleUpperCase 
\ChNumVar{\raggedleft \bfseries\Large} 
\ChTitleVar{\raggedright \Large\rm}

\renewcommand*{\@makechapterhead}[1]{%
  \vspace*{10\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter%%%%% Fix for frontmatter, mainmatter, and backmatter 040920
        \DOCH
      \fi
    \fi
    \interlinepenalty\@M
    \if@mainmatter%%%%% Fix for frontmatter, mainmatter, and backmatter 060424
      \DOTI{#1}%
    \else%
      \DOTIS{#1}%
    \fi
  }}
% For the case \chapter*:
\renewcommand*{\@makeschapterhead}[1]{%
  \vspace*{10\p@}%
  {
  	\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \DOTIS{#1}
    \vskip 1\p@
  }
}


%-------------------- code ---------------------%
%\mmaDefineMathReplacement[≤]{<=}{\leq}
%\mmaDefineMathReplacement[≥]{>=}{\geq}
%\mmaDefineMathReplacement[≠]{!=}{\neq}
%\mmaDefineMathReplacement[→]{->}{\to}[2]
%\mmaDefineMathReplacement[⧴]{:>}{:\hspace{-.2em}\to}[2]
%\mmaDefineMathReplacement{∉}{\notin}
%\mmaDefineMathReplacement{∞}{\infty}
%\mmaDefineMathReplacement{𝕕}{\mathbbm{d}}

% note for these functions use mmaFrac or mmaSqrt to get the requried mma functions (symoblicly)

%-------------------- other cmds ---------------%
\newcommand{\pic}[4]{
\begin{figure}[H]
	\begin{center}
		\includegraphics[scale=#4]{#1}
		\caption*{#2}	
		\label{#3}
	\end{center}
\end{figure}
}
