%==============================================================================
% iiufrgs - classe de documento com padrões do II/UFRGS
% $Id: iiufrgs.cls,v 4.4.0 2010/08/13 12:00:00 laffernandes Exp $
%
% Copyright (C) 2001-2014 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% UFRGS TeX Users Group
% Institute of Informatics --- UFRGS
% Porto Alegre, Brazil
% http://www.inf.ufrgs.br/utug
% Discussion list: utug-l@inf.ufrgs.br
%==============================================================================

%==============================================================================
% Identificação
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iiufrgs}[2026/10/30 v5.0.0 Formatacao de documentos para o II/UFRGS]

%==============================================================================
% Declaração de opções
%==============================================================================
\newcommand{\iiu@novodoc}[2]{%
    \DeclareOption{#1}{%
        \AtEndOfClass{%
            \IfFileExists{#1.def}{\input{#1.def}}{#2}%
        }%
    }%
}
\newcommand{\iiu@aliasdoc}[2]{\DeclareOption{#1}{\ExecuteOptions{#2}}}

% programas
\iiu@novodoc{cic}{}
\iiu@novodoc{ecp}{}
\iiu@novodoc{unibral}{}
\iiu@novodoc{pgmicro}{%
    \providecommand{\nominataCoord}{\nominataCoordPGMICRO}%
    \providecommand{\nominataCoordname}{\nominataCoordnamePGMICRO}%
    \providecommand{\nomeDoProgramaPG}{\pgmicro}%
    \providecommand{\titulacaoEm}{\pgmicroTitulacaoEm}%
    \course{\pgmicro}%
}
\iiu@novodoc{ppgc}{%
    \providecommand{\nominataCoord}{\nominataCoordPPGC}%
    \providecommand{\nominataCoordname}{\nominataCoordnamePPGC}%
    \providecommand{\nomeDoProgramaPG}{\ppgc}%
    \providecommand{\titulacaoEm}{\ppgcTitulacaoEm}%
    \course{\ppgc}%
}

\newcommand{\ti}[2][I]{\gdef\@tinumber{#1~--~No.~#2}}
\providecommand{\@tinumber}{I}
\newcommand{\rp}[1]{\gdef\@rpnumber{#1}}
\newcommand{\financ}[1]{\gdef\@financ{#1}}
\newcommand{\espec}[1]{\gdef\titulacaoEm{#1}\course{Curso de Especializa{\c{c}}{\~a}o em #1}}
\DeclareRobustCommand{\coord}[3][]{\gdef\@coordlast{#2}\gdef\@coordfirst{#3}\gdef\@coord{#1~#3 #2}}

% tipos de documento
\iiu@novodoc{dipl}{\providecommand{\titlepagespecificinfo}{\tcspecificinfo}}
\iiu@aliasdoc{tc}{dipl}
\iiu@novodoc{ti}{%
    \providecommand{\titlepagespecificinfo}{Trabalho Individual~\@tinumber}%
}
\iiu@novodoc{rp}{%
    \providecommand{\titlepagespecificinfo}{\rpname~\@ifundefined{@rpnumber}{}{No.~\@rpnumber}}%
}
\iiu@novodoc{pep}{\providecommand{\titlepagespecificinfo}{Plano de Estudos e Pesquisa}}
\iiu@novodoc{prop-tese}{\providecommand{\titlepagespecificinfo}{\proptesespecificinfo}}
\iiu@novodoc{plano-doutorado}{\providecommand{\titlepagespecificinfo}{\planodoutoradospecificinfo}}

% Documentos de Doutorado e Mestrado
\iiu@novodoc{diss}{%
    \providecommand{\titlepagespecificinfo}{\dissspecificinfo}%
    \def\@cipspecificinfo{\dissname}%
}
\iiu@novodoc{tese}{%
    \providecommand{\titlepagespecificinfo}{\tesespecificinfo}%
    \def\@cipspecificinfo{\tesename}%
}
\iiu@aliasdoc{mestrado}{diss}
\iiu@aliasdoc{doutorado}{tese}
\iiu@novodoc{espec}{%
    \providecommand{\titlepagespecificinfo}{\especspecificinfo}%
    \def\@cipspecificinfo{\especname}%
}
\iiu@novodoc{formais}{}

% outros
\iiu@novodoc{nominatalocal}{}
\newif\if@english\@englishfalse
\DeclareOption{english}{\@englishtrue\OptionNotUsed}
\DeclareOption{brazilian}{\@englishfalse\OptionNotUsed}
\DeclareOption{brazil}{\@englishfalse\OptionNotUsed}
\DeclareOption{portuges}{\@englishfalse\OptionNotUsed}
\DeclareOption{portuguese}{\@englishfalse\OptionNotUsed}

\newif\if@noabntcite\@noabntcitefalse
\newif\if@usebiblatex\@usebiblatexfalse
\DeclareOption{biblatex}{\@usebiblatextrue\@noabntcitefalse}
\DeclareOption{abntex2cite}{\@usebiblatexfalse\@noabntcitefalse}
\DeclareOption{noabntcite}{\@noabntcitetrue\@usebiblatexfalse\OptionNotUsed}
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions*\relax

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================

\LoadClass[12pt,a4paper,twoside]{report}

\RequirePackage{iftex}
\ifPDFTeX
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
\fi
\RequirePackage{tgtermes}
\RequirePackage{tgheros}
\RequirePackage{tgcursor}

\RequirePackage{xspace}
\RequirePackage{keyval}

\RequirePackage[english,brazilian]{babel}
\input{brazilian.babel}
\input{english.babel}
\if@english
        \selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{iidefs}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[dvipsnames,svgnames,table]{xcolor}
\RequirePackage{tocbasic}
\newcommand{\iiu@tocfig}[1]{\figurename\hspace{0.2em}#1}
\newcommand{\iiu@toctab}[1]{\tablename\hspace{0.2em}#1}
\DeclareTOCStyleEntry[
    indent=0pt,
    numwidth=0pt,
    linefill=\TOCLineLeaderFill,
    pagenumberbox=\pnbox,
    pagenumberformat=\normalfont,
    beforeskip=0pt,
    entryformat=\bfseries,
    entrynumberformat=\bfseries
]{tocline}{chapter}
\DeclareTOCStyleEntry[
    indent=0pt,
    dynnumwidth=true,
    linefill=\TOCLineLeaderFill,
    pagenumberbox=\pnbox,
    pagenumberformat=\normalfont,
    beforeskip=0pt,
    entryformat=\bfseries,
    entrynumberformat=\bfseries
]{tocline}{section}
\DeclareTOCStyleEntries[
    indent=0pt,
    dynnumwidth=true,
    linefill=\TOCLineLeaderFill,
    pagenumberbox=\pnbox,
    beforeskip=0pt
]{tocline}{subsection,subsubsection,paragraph}
\DeclareTOCStyleEntry[
    indent=0pt,
    dynnumwidth=true,
    linefill=\TOCLineLeaderFill,
    pagenumberbox=\pnbox,
    beforeskip=0pt,
    entrynumberformat=\iiu@tocfig
]{tocline}{figure}
\DeclareTOCStyleEntry[
    indent=0pt,
    dynnumwidth=true,
    linefill=\TOCLineLeaderFill,
    pagenumberbox=\pnbox,
    beforeskip=0pt,
    entrynumberformat=\iiu@toctab
]{tocline}{table}

\RequirePackage[%
        bookmarksnumbered=true,
        breaklinks=true,
        unicode=true,
        colorlinks=true,
        anchorcolor=black,
        citecolor=black,
        filecolor=black,
        linkcolor=black,
        urlcolor=black
]{hyperref}
\RequirePackage[all]{hypcap}

% Gerenciamento condicional do pacote de citações
\if@usebiblatex
    % Evita conflito caso o usuário tenha deixado \usepackage{abntex2cite} no preâmbulo
    \@namedef{ver@abntex2cite.sty}{9999/12/31}
    \@namedef{opt@abntex2cite.sty}{alf,num,abnt-emphasize=bf,bibjustif}
    \providecommand{\citeoption}[1]{}

    \RequirePackage{csquotes}
    \RequirePackage[
        backend=biber,
        style=abnt,
        sorting=nyt,
        justify=true
    ]{biblatex}
    \newcommand{\iiufrgsbibsetup}[1]{\ExecuteBibliographyOptions{#1}}

    % Aliases de compatibilidade com natbib e abntex2cite
    \providecommand*{\citet}{\textcite}
    \providecommand*{\citep}{\parencite}
    \providecommand*{\citeonline}{\textcite}
    \providecommand*{\citen}{\textcite}
    \providecommand*{\citenum}{\textcite}
    \providecommand*{\citeyearpar}{\citeyear}
    \providecommand*{\citeauthoronline}{\citelastname}
    \providecommand*{\apudonline}{\textapud}

    % Ajusta o título padrão de \printbibliography para "Referências" (ABNT NBR 14724 / 6023)
    \DefineBibliographyStrings{brazilian}{bibliography = {Refer{\^e}ncias}}
    \DefineBibliographyStrings{brazil}{bibliography = {Refer{\^e}ncias}}
    \DefineBibliographyStrings{portuges}{bibliography = {Refer{\^e}ncias}}
    \DefineBibliographyStrings{portuguese}{bibliography = {Refer{\^e}ncias}}

    % Configuração de cabeçalho no estilo UFRGS para \printbibliography
    % Nota: \chapter* em iiufrgs.cls já adiciona a entrada ao sumário quando após \tableofcontents
    \AtBeginDocument{%
        \@ifpackageloaded{biblatex}{%
            \defbibheading{bibliography}[\bibname]{%
                \chapter*{#1}%
                \markboth{#1}{#1}%
            }%
            \defbibheading{iiufrgs}[\bibname]{%
                \chapter*{#1}%
                \markboth{#1}{#1}%
            }%
        }{}%
    }
\else
    \if@noabntcite
    \else
        \RequirePackage[
            alf,
            abnt-emphasize=bf,
            bibjustif
        ]{abntex2cite}
    \fi
\fi

% espaçamento entre as linhas
\newcommand{\setlinespacing}{\setstretch{1.415}}
\setlinespacing

% margens
\RequirePackage[top=30mm,bottom=20mm,left=30mm,right=30mm,headsep=10mm]{geometry}

\vfuzz=30pt % prevent "overfull \vbox while \output is active" warning

%==============================================================================
% Margens do texto
%==============================================================================
\setlength{\parindent}{3em}
\AtBeginDocument{\setlength{\parskip}{0mm}}

%==============================================================================
% Numeração das páginas
%==============================================================================
\def\ps@iiufrgs{
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{{\small\thepage}\hspace*{\fill}}
        \def\@oddhead{\hspace*{\fill}{\small\thepage}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ii@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}
\DeclareRobustCommand{\advisor}[3][]{
        \gdef\@advisorlast{#2}
        \gdef\@advisorfirst{#3}
        \gdef\@advisor{#1~#3 #2}
}
\DeclareRobustCommand{\coadvisor}[3][]{
        \gdef\@coadvisorlast{#2}
        \gdef\@coadvisorfirst{#3}
        \gdef\@coadvisor{#1~#3 #2}
}

%==============================================================================
% Definição do Departamento relacionado ao documento
%==============================================================================
\newcommand{\dept}[1]{\gdef\@dept{#1}}

%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\keywa.}%
        \@ifundefined{keywb}{}{ \keywb.}%
        \@ifundefined{keywc}{}{ \keywc.}%
        \@ifundefined{keywd}{}{ \keywd.}%
        \@ifundefined{keywe}{}{ \keywe.}%
        \@ifundefined{keywf}{}{ \keywf.}%
        \@ifundefined{keywg}{}{ \keywg.}%
        \@ifundefined{keywh}{}{ \keywh.}%
        \@ifundefined{keywi}{}{ \keywi.}%
        \@ifundefined{keywj}{}{ \keywj.}%
}

%==============================================================================
% Definição das palavras-chave no segundo idioma (máx. 10)
%==============================================================================
\newcounter{translatedkwcounter}
\newcommand{\translatedkeyword}[1]{
        \addtocounter{translatedkwcounter}{1}
        \expandafter\gdef\csname translatedkeyw\alph{translatedkwcounter}\endcsname{#1}
}
\newcommand{\@translatedabstractkw}{%
        \@ifundefined{translatedkeywa}{}{\translatedkeywa.}%
        \@ifundefined{translatedkeywb}{}{ \translatedkeywb.}%
        \@ifundefined{translatedkeywc}{}{ \translatedkeywc.}%
        \@ifundefined{translatedkeywd}{}{ \translatedkeywd.}%
        \@ifundefined{translatedkeywe}{}{ \translatedkeywe.}%
        \@ifundefined{translatedkeywf}{}{ \translatedkeywf.}%
        \@ifundefined{translatedkeywg}{}{ \translatedkeywg.}%
        \@ifundefined{translatedkeywh}{}{ \translatedkeywh.}%
        \@ifundefined{translatedkeywi}{}{ \translatedkeywi.}%
        \@ifundefined{translatedkeywj}{}{ \translatedkeywj.}%
}

%==============================================================================
% Redefinição da data (para ter mês e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}%
}
\date{\monthname}{\number\year}

%==============================================================================
% Definição padrão da folha de rosto
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}
\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}
\location{Porto~Alegre}{RS}
\renewcommand{\maketitle}{%
  \setstretch{0.92}
  \hypersetup{%
    pdftitle={\@title},%
    pdfauthor={%
      \@authora%
      \@ifundefined{@authorb}{}{, \@authorb}%
      \@ifundefined{@authorc}{}{, \@authorc}%
      \@ifundefined{@authord}{}{, \@authord}%
    },%
    pdfkeywords={%
      \@ifundefined{keywa}{}{\keywa}%
      \@ifundefined{keywb}{}{. \keywb}%
      \@ifundefined{keywc}{}{. \keywc}%
      \@ifundefined{keywd}{}{. \keywd}%
      \@ifundefined{keywe}{}{. \keywe}%
      \@ifundefined{keywf}{}{. \keywf}%
      \@ifundefined{keywg}{}{. \keywg}%
      \@ifundefined{keywh}{}{. \keywh}%
      \@ifundefined{keywi}{}{. \keywi}%
      \@ifundefined{keywj}{}{. \keywj}%
    }%
  }%
  \begin{titlepage}
      \thetitlepage
  \end{titlepage}%
  \clearpage
  \setcounter{page}{2}%
  \@ifundefined{@cipspecificinfo}{\@makenominatapage}{\@makecippage}
  \setlinespacing
}
\newcommand{\thetitlepage}{%
  \noindent\@topbox\\
  \vspace{5.9ex}\\
  \setstretch{0.95}
  \@ifundefined{titlepagespecificinfo}{}{
    \hspace*{\fill}\makebox[.56\textwidth][l]{%
      \parbox[b]{0.56\textwidth}{\lefthyphenmin=64\titlepagespecificinfo}%
    }%
    \vspace{5.5ex}\\
  }
  \@ifundefined{@advisor}{}{
    \hspace*{\fill}\makebox[.56\textwidth][l]{%
      \parbox[b]{0.56\textwidth}{\raggedright\lefthyphenmin=64\titlepageadvisorinfo}%
    }%
    \vfill
  }
  \centerline{\@city}
  \centerline{\ii@date}
  \vspace{8mm}
}
\def\@topbox{%
        \parbox[t]{\textwidth}{%
                \centering%
                \vbox to \titlepagewinvoffset{%
                        \titlepagetopinfo\vfill\@winbox
                }
        }
}
\def\@winbox{%
        \parbox[b]{\titlepagewinwidth}{%
        \centering\vbox to \titlepagewinheight{%
                \vspace*{3ex}
                \MakeUppercase{\@authora}\\
                \@ifundefined{@authorb}{}{\MakeUppercase{\@authorb}\\}%
                \@ifundefined{@authorc}{}{\MakeUppercase{\@authorc}\\}%
                \@ifundefined{@authord}{}{\MakeUppercase{\@authord}\\}%
                \vspace{12.65ex}
                {\large\textbf{\@title}\par}
                \vfill
        }}%
}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\titlepagetopinfo}{%
        \MakeUppercase{\ufrgs}\\
        \MakeUppercase{\ii}\\
        \@ifundefined{@dept}{}{\MakeUppercase{\csname dept\@dept\endcsname}\\}%
        \MakeUppercase{\@course}\\
}
\newcommand{\titlepageadvisorinfo}{%
        \@ifundefined{@advisor}{}{\advisorname:~\@advisor\\}%
        \@ifundefined{@coadvisor}{}{\coadvisorname:~\@coadvisor\\}%
}

%==============================================================================
% Catalogação na fonte (CIP) e nominata
%==============================================================================
\newcommand{\@makecippage}{%
        \clearpage%
        \begin{center}
                \textbf{\cipcaption}\\[2ex]
                \iiu@cipwindow
        \end{center}
        \vfill
        \nominata
}

\newcommand{\@makenominatapage}{%
    \clearpage
    ~
    \vfill
    \nominata
}%

\def\iiu@cipwindow{%
        \framebox[120mm]{%
        \begin{minipage}{110mm}%
                \vspace*{0.2ex}
                \setlength{\parindent}{1.5em}%
                \setlength{\parskip}{1.3ex}%
                \noindent\@authoralast, \@authorafirst\par
                \@title\ / \@authora.\ -- \@city: \nomeDoProgramaPG~da~UFRGS, \@publyear.\par
                \pageref{LastPage}~f.: il.\par
                \@cipspecificinfo\ -- \ufrgs. \@course, \@city, BR--\@state, \@publyear. \advisorname: \@advisorfirst\ \@advisorlast\@ifundefined{@coadvisor}{}{; \coadvisorname: \@coadvisorfirst\ \@coadvisorlast}.\par
                \@cipkw I.~\@advisorlast, \@advisorfirst. \@ifundefined{@coadvisorfirst}{II.~T\'{\i}tulo.}{II.~\@coadvisorlast, \@coadvisorfirst. III.~T\'{\i}tulo.}\\
                \vspace{0.2ex}
        \end{minipage}%
        }%
}

\AtEndOfClass{\input{nominata.def}}
\newcommand{\nominata}{
  \setstretch{0.95}
  \noindent\MakeUppercase{\ufrgs}

  \noindent\nominataReitname: \nominataReit

  \noindent\nominataPRCAname: \nominataPRCA

  \noindent\nominataPRAPGname: \nominataPRAPG

  \noindent\nominataDirname: \nominataDir

  \noindent\nominataCoordname: \nominataCoord

  \noindent\nominataBibchefename: \nominataBibchefe

  \setlinespacing
  \vspace{18.25mm}
}

%==============================================================================
% Ajuste do sumário
%==============================================================================
\renewcommand{\@dotsep}{0}
\newlength{\dottedspace}
\newcommand{\pnbox}[1]{\settowidth{\dottedspace}{\bfseries#1}\hb@xt@\dottedspace{#1}}

\newcommand\samepagechapter{
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\setcounter{tocdepth}{3}
\newif\if@aftertoc
\@aftertocfalse
\newcommand{\iiu@unifytocnumwidth}{%
  \setlength{\@tempdima}{0pt}%
  \@for\@iiu@lvl:=section,subsection,subsubsection,paragraph\do{%
    \expandafter\ifx\csname scr@dte@\@iiu@lvl @lastmaxnumwidth\endcsname\relax\else
      \ifdim\csname scr@dte@\@iiu@lvl @lastmaxnumwidth\endcsname>\@tempdima
        \setlength{\@tempdima}{\csname scr@dte@\@iiu@lvl @lastmaxnumwidth\endcsname}%
      \fi
    \fi
  }%
  \ifdim\@tempdima>0pt
    \@for\@iiu@lvl:=section,subsection,subsubsection,paragraph\do{%
      \expandafter\edef\csname scr@tso@\@iiu@lvl @numwidth\endcsname{\the\@tempdima}%
    }%
  \fi
}
\renewcommand{\tableofcontents}{%
  \chapter*{\contentsname}
  \vspace{0.4\baselineskip}
  \setstretch{0.95}
  \iiu@unifytocnumwidth
  \@starttoc{toc}\@aftertoctrue%
  \setlinespacing
}
\renewcommand{\listoffigures}{%
  \chapter*{\listfigurename}
  \setstretch{0.95}
  \@starttoc{lof}%
  \setlinespacing
}
\renewcommand{\listoftables}{%
  \chapter*{\listtablename}
  \setstretch{0.95}
  \@starttoc{lot}%
  \setlinespacing
}

%==============================================================================
% Definição das listas de abreviaturas e siglas e de símbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
        \chapter*{\listabbrvname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}
\newenvironment{listofsymbols}[1]{
        \chapter*{\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (translatedabstract)
%==============================================================================
\renewenvironment{abstract}{%
        \chapter*{\abstractname}\setlength{\parindent}{0pt}
}{%
    \par\vspace{12pt}\noindent\textbf{\keywordsname:} \@abstractkw
}

\newenvironment{translatedabstract}[0]{%
    \if@openright\cleardoublepage\else\clearpage\fi%
    \iflanguage{english}{
        \begin{otherlanguage}{brazilian}
    }{
        \begin{otherlanguage}{english}
    }
    \@ifundefined{@translatedtitle}{%
        \PackageWarningNoLine{iiufrgs}{Translated title not defined. Use the translatedtitle command to define it}
    }{%
        \begin{center}%
            \textbf{\@translatedtitle}\par%
            \vspace{12pt}
        \end{center}
    }
    \samepagechapter*{\abstractname}\setlength{\parindent}{0pt}
}{%
    \ifnum\value{translatedkwcounter}>0
        \par\vspace{12pt}
        \noindent\textbf{\keywordsname:} \@translatedabstractkw
    \else
        \PackageWarningNoLine{iiufrgs}{No translated keyword has been defined. Use
        the translatedkeyword command to define them.}
    \fi
    \end{otherlanguage}
}

\newenvironment{englishabstract}[2]{%
        \PackageWarning{iiufrgs}{The 'englishabstract' is deprecated, use 'translatedabstract'
        instead (https://github.com/schnorr/infufrgs/pull/80)}
        \if@openright\cleardoublepage\else\clearpage\fi%
        \gdef\@englishkeywords{#2}%
        \iflanguage{english}{
                \begin{otherlanguage}{brazilian}
        }{
                \begin{otherlanguage}{english}
        }
        \begin{center}%
            \textbf{#1}\par%
            \vspace{12pt}
        \end{center}
        \samepagechapter*{\abstractname}\setlength{\parindent}{0pt}
}{%
  \par\vspace{12pt}
  \noindent\textbf{\keywordsname:} \@englishkeywords.
\end{otherlanguage}
}

%==============================================================================
% Definição do título traduzido no segundo idioma
%==============================================================================
\newcommand{\translatedtitle}[1]{%
    \gdef\@translatedtitle{#1}%
}%

%==============================================================================
% Formatação dos capítulos
%==============================================================================
\newcounter{schapter}
\newcommand{\ii@chapterfont}{\@setfontsize\Large{12}{18}}
\def\@chapapp{}
\def\@chapappextra{}
\def\@chappositioning{\noindent}
\def\@chapter[#1]#2{%
        \xdef\Hy@chapapp{CHAPTER}%
        \gdef\theHchapter{\@chapappprefix\thechapter}%
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\@chapapp\thechapter~\@chapappextra\texorpdfstring{\MakeUppercase{#1}}{#1}}%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
        \addtocontents{lol}{\protect\addvspace{10\p@}}%
        \pagestyle{iiufrgs}\let\ps@plain\ps@iiufrgs%
        \@makechapterhead{#2}{\@chappositioning}\@afterheading
}

\def\@makechapterhead#1#2{%
        \reset@font{#2{\ii@chapterfont\textbf{\@chapapp\thechapter\hphantom{~}\@chapappextra\MakeUppercase{#1}}\par}}
        \addvspace{\baselineskip}
        \noindent
}
\def\@schapter#1{%
        \xdef\Hy@chapapp{SCHAPTER}%
        \refstepcounter{schapter}%
        \if@aftertoc%
            \hyperdef{SCHAPTER}{\theschapter}{}%
            \@makeschapterhead{#1}\@afterheading%
            \addcontentsline{toc}{chapter}{\@chapapp\xspace{}\@chapappextra\texorpdfstring{\MakeUppercase{#1}}{#1}}%
        \else%
            \pdfbookmark[0]{#1}{MUTESCHAPTER.\theschapter}%
            \@makeschapterhead{#1}\@afterheading%
            \fi%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
}
\def\@makeschapterhead#1{%
        \reset@font\centerline{\ii@chapterfont\textbf{\MakeUppercase{\@chapapp\xspace{}\@chapappextra#1}}}
        \addvspace{18pt}
}
\def\@chapappprefix{}
\renewcommand{\appendix}[1][\appendixname]{
    \setcounter{chapter}{0}%
    \renewcommand{\thechapter}{\Alph{chapter}}%
    \gdef\@chapappprefix{appendix.}%
    \gdef\@chapapp{\texorpdfstring{\MakeUppercase{#1}}{#1}\space}%
    \gdef\@chapappextra{---\space}%
    \gdef\@chappositioning{\centering}
}
\newcommand{\annex}[1][\annexname]{
    \setcounter{chapter}{0}%
    \renewcommand{\thechapter}{\Alph{chapter}}%
    \gdef\@chapappprefix{annex.}%
    \gdef\@chapapp{\texorpdfstring{\MakeUppercase{#1}}{#1}\space}%
    \gdef\@chapappextra{---\space}%
    \gdef\@chappositioning{\centering}
}

%==============================================================================
% Formatação das seções
%==============================================================================
\setcounter{secnumdepth}{5}
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\ }

\titleformat{\section}[hang]{\bfseries}{\thesection~}{0pt}{}
\titlespacing\section{0pt}{1.5\baselineskip}{\baselineskip}
\titleformat*{\subsection}{\reset@font\normalsize\bfseries}
\titlespacing\subsection{0pt}{1.5\baselineskip}{\baselineskip}
\titleformat*{\subsubsection}{\reset@font\normalsize\itshape}
\titlespacing\subsubsection{0pt}{1\baselineskip}{0.5\baselineskip}
\titleformat*{\paragraph}{\reset@font\normalsize}
\titlespacing\paragraph{0pt}{1\baselineskip}{0.5\baselineskip}

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
\renewenvironment{quote}{%
        \setstretch{1}%
        \small%
        \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
        \fontsize{10bp}{12bp}\selectfont%
}{%
        \end{list}
}
% Disponibiliza também o ambiente citacao como sinônimo (comum em normas ABNT / abnTeX2)
\newenvironment{citacao}{\begin{quote}}{\end{quote}}

%==============================================================================
% Ajuste do espaçamento entre itens
%==============================================================================
\renewenvironment{enumerate}{%
  \begin{list}{\arabic{enumi}.}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt\usecounter{enumi}}%
}{\end{list}}

\renewenvironment{itemize}{%
  \begin{list}{\bfseries\upshape $\bullet$}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt}%
}{\end{list}}

\renewenvironment{description}{
  \begin{list}{}{\topsep=6pt\itemsep=2pt\parsep=0pt\partopsep=0pt \labelwidth\z@ \itemindent-\leftmargin \let\makelabel\descriptionlabel}
}{\end{list}}

%==============================================================================
% Ajuste das legendas das figuras e tabelas
%==============================================================================
\RequirePackage[
        format=plain,labelsep=endash,justification=centering,font=small,
        skip=4pt
]{caption}
\newcommand{\legend}[1]{\caption*{\small #1}}
\providecommand{\fonte}[1]{\legend{Fonte: #1}}

%==============================================================================
% Comandos legados
%==============================================================================
\newcommand{\cip}{}
\newenvironment{dedicatoria}{%
        \clearpage%
        \mbox{}\vfill\begin{flushright}
}{
        \end{flushright}
}
\providecommand{\acknowledgmentsname}{Agradecimentos}
\newenvironment{agradecimentos}{
        \chapter*{\acknowledgmentsname}
}{}