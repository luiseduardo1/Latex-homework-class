% Class that provides a template for your university homework!
% created by Luis E. Obando
% Version 1.0, 2015/10/03


%--------------------------------------------------------------------------------------
%----------------------------------- identification -----------------------------------
%--------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}%
              [2015/10/03 Homework template class]

%--------------------------------------------------------------------------------------
%------------------------------------ initial code ------------------------------------
%--------------------------------------------------------------------------------------

% Logical flags that allows the insertion of the list of figures and tables
\RequirePackage{ifthen}
\newboolean{InsertListOfFigures}
\newboolean{InsertListOfTables}


%--------------------------------------------------------------------------------------
%------------------------------- declaration of options -------------------------------
%--------------------------------------------------------------------------------------
\DeclareOption{AddLof}{\setboolean{InsertListOfFigures}{true}}
\DeclareOption{AddLot}{\setboolean{InsertListOfTables}{true}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}


%--------------------------------------------------------------------------------------
%-------------------------------- execution of options --------------------------------
%--------------------------------------------------------------------------------------
\ProcessOptions \relax


%--------------------------------------------------------------------------------------
%----------------------------------- package loading ----------------------------------
%--------------------------------------------------------------------------------------
\LoadClass[12pt, letterpaper]{article} % Import 'article' class settings

\RequirePackage[utf8]{inputenc}     % Input settings
\RequirePackage[french]{babel}      % Select language, can be modified to another language
\RequirePackage[T1]{fontenc}        % Output settings
\RequirePackage{fancyhdr}           % Header settings
\RequirePackage{amsmath, amssymb, amsfonts} % Import math packages
\RequirePackage[autolanguage]{numprint}     % Print numbers with separators and exponent if necessary
\RequirePackage{graphicx}   % Enhanced support for graphics
\RequirePackage{icomma}     % Intelligent commas for decimal numbers
\RequirePackage{multirow}   % Create tabular cells spanning multiple rows
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage{hyperref}   % Extensive support for hypertext in LATEX
\RequirePackage{color}      % Colour control for LATEX documents
\RequirePackage{makecell}   % Tabular column heads and multilined cells
\RequirePackage{lipsum}     % Easy access to the Lorem Ipsum dummy text
\RequirePackage{geometry}   % Flexible and complete interface to document dimensions
\RequirePackage{sectsty}    % Control sectional headers
\RequirePackage{tocloft}    % Manage typography of the Table of Contents, List of Figures and of Tables

%--------------------------------------------------------------------------------------
%------------------------------ Document Settings -------------------------------------
%--------------------------------------------------------------------------------------

% Settings of the hyperref package
\hypersetup{plainpages=false,
            breaklinks=false,
            colorlinks=true}

% Settings of the dimension of the page with geometry package
% Here it's the dimension for the presentation page            
\geometry{letterpaper,
          centering,
          hmargin={2.5cm,2.5cm},
          vmargin={0.5cm,2.5cm},
          heightrounded,
          includehead}

% Creation of a new environment so that 'thebibliography' is included in the table of content
          \newenvironment{homework_bibliography}[1]
                       {\clearpage
                        \begin{thebibliography}{#1}
                        \addcontentsline{toc}{chapter}{\bibname}
                        \raggedright
                       }
                       {\end{thebibliography}}

% Default header and footer
\pagestyle{fancy}
\fancyhf{}
\lhead{\theHomeworkTitle}
\chead{\theClassName}
\rhead{\theDueDate}
\cfoot{\thepage}
\renewcommand{\footrulewidth}{0.4pt}

% Remove the header from the table of contents
\let\ps@plain\ps@empty

% Add path for included graphics/figures
\graphicspath{{./Figures/}}

% Sets the value of the counter of the table of content
\setcounter{tocdepth}{2}            % default = 2

% Sets the value of the counter of the sections parts
\setcounter{secnumdepth}{0}         % default = 2

% Sets the parameters of the hyperref package
\AtBeginDocument{
   \hypersetup{pdftitle={\theHomeworkTitle}} }

% Selecting 'babel' language as default
\AtBeginDocument{
   \selectlanguage{french} }

% Changing default word use by 'babel'
\AtBeginDocument{
   \renewcommand{\figurename}{\textsc{Figure}}
   \renewcommand{\tablename}{\textsc{Tableau}} }

% Generates the title page
\AtBeginDocument{
   \maketitle }

% Generates the table of contents, the list of figures and the list of tables
\AtBeginDocument{
    \tableofcontents
    \ifthenelse{\boolean{InsertListOfFigures}}
        {\clearpage
         \listoffigures
         \addcontentsline{toc}{chapter}{\listfigurename}}{}
         \ifthenelse{\boolean{InsertListOfTables}}
        {\clearpage
         \listoftables
         \addcontentsline{toc}{chapter}{\listtablename}}{}}

% Resetting the counter "page"
\AtBeginDocument{
   \cleardoublepage
   \setcounter{page}{1}
   \pagenumbering{arabic} }

%--------------------------------------------------------------------------------------
%-------------------------- Presentation Page Layout ----------------------------------
%--------------------------------------------------------------------------------------

% Creation of a new 'maketitle' command
\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \pagenumbering{roman}

    \begin{titlepage}
        \setcounter{page}{999}      % Associate number '0' to the title page
        \centering
        \vspace*{0.5 cm} % Add a vertical space of 0.5 cm
            \includegraphics[scale = 0.85]{yourUniversitylogo.pdf}\\[1.0 cm] % Add your university Logo
        \vspace*{1.2 cm}
    
        \rule{\linewidth}{0.7 mm} \\ [0.4 cm] % Create a horizontal line of 0.7 mm width
        \textsc{\Huge \theClassName \vspace*{0.5 cm} \\ \theClassNumber \\ \vspace*{0.5 cm} }
        \rule{\linewidth}{0.7 mm} \\ [0.4 cm]
 	    \vspace*{1.5 cm}
	
        \textsc{\huge \theHomeworkTitle}\\[0.5 cm] 
	    \vspace*{2 cm}
    
         \begin{minipage}{0.5\textwidth} % Add the 2 text sections columns
             \begin{flushleft} \large
                \textbf{\emph{Présenté à:}}\\
                \theProfessorName \\
                \theProfessorTitle \\
                \theUniversityDepartment \\
            \end{flushleft}
        \end{minipage}~
         \begin{minipage}{0.5\textwidth}
     	    \begin{flushright} \large
        	    \textbf{\emph{Remis par :}} \\
       		    \theFirstStudentName \\
        	    \theFirstStudentID  \\
         	    \vspace*{0.5 cm}
        
       		    \theSecondStudentName \\
        	    \theSecondStudentID  \\
            \end{flushright}
        \end{minipage}\\
 	    \vspace*{2 cm}
	
        \begin{center}
   	        {\large \theUniversityName} \\
    		\theDueDate 
        \end{center}

    \end{titlepage} 
    \clearpage
    \let\maketitle\relax  
   
     % Change the margins for the rest of the homework
    \newgeometry{letterpaper,
          centering,
          hmargin={2.5cm,2.5cm},
          vmargin={2.5cm,2.5cm},
          heightrounded,
          includehead}
    }

% Definitions of the functions allowing the settings of the title page parameters 
\def\FirstStudentName#1{\def\theFirstStudentName{#1}} 
\def\FirstStudentID#1{\def\theFirstStudentID{#1}}
\def\SecondStudentName#1{\def\theSecondStudentName{#1}} 
\def\SecondStudentID#1{\def\theSecondStudentID{#1}}

\def\ClassName#1{\def\theClassName{#1}}
\def\ClassNumber#1{\def\theClassNumber{#1}}
\def\HomeworkTitle#1{\def\theHomeworkTitle{#1}}
\def\ProfessorName#1{\def\theProfessorName{#1}}
\def\ProfessorTitle#1{\def\theProfessorTitle{#1}}
\def\UniversityDepartment#1{\def\theUniversityDepartment{#1}}
\def\UniversityName#1{\def\theUniversityName{#1}}
\def\DueDate#1{\def\theDueDate{#1}} 

% Definitions of the title page default parameters                
\def\theFirstStudentName{Name of the first student}
\def\theFirstStudentName{ID of the first student}
\def\theSecondStudentName{Name of the second student}
\def\theSecondStudentID{ID of the second student}

\def\theClassName{Name of your class}
\def\theClassNumber{Number of your class}
\def\theHomeworkTitle{Title of the homework}
\def\theProfessorName{Name of your professor}
\def\theProfessorTitle{Title of your professor}
\def\theUniversityDepartment{Name of your department}
\def\theUniversityName{Name of your university}
\def\theDueDate{Due date of the homework}


%--------------------------------------------------------------------------------------
%----------------------- Problems/Questions parameters --------------------------------
%--------------------------------------------------------------------------------------

%% For "Questions/Sous-questions" homework type

% Keep track of the last question and answer number
\newcounter{QuestionNum}
\newcounter{AnswerNum}[QuestionNum]
\newcounter{PartNum}

\renewcommand{\theQuestionNum}{\arabic{QuestionNum}}
\renewcommand{\thePartNum}{\arabic{PartNum}}
\renewcommand{\theAnswerNum}{\alph{AnswerNum}}

% A new section is created for each question
\newcommand{\newquestion}[1]{\section{#1}%
}

% A new section is created for each part
\newcommand{\newpart}[1]{\section{#1}%
}

% A new subsection is created for each answer
\newcommand{\soln}[1]{\subsection{#1}%
}

% Create a environment for each question problem and their answer
\newenvironment{Question}{%
    \stepcounter{QuestionNum}%
    \newquestion{Question \theQuestionNum }
    \noindent } {}

\newenvironment{Problème}{%
    \stepcounter{QuestionNum}%
    \newquestion{Problème \theQuestionNum }
    \noindent } {}

\newenvironment{Partie}{%
    \stepcounter{PartNum}%
    \newpart{Partie \thePartNum }
    \noindent } {}
    
\newenvironment{Answer}{%
    \stepcounter{AnswerNum}%
    \soln{\theAnswerNum )  }
    \noindent}{}




