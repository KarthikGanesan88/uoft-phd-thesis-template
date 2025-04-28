% Original version written by Mario Badr (https://www.cs.toronto.edu/~mbadr/)
% Please retain this credit if you continue to use this template. 

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{uoft-thesis}[University of Toronto Thesis Template]

% Inherit from scrreprt.
\LoadClassWithOptions{scrreprt}

% Disable bold face fonts.
\addtokomafont{disposition}{\normalfont}

%% Package Loading %%

\RequirePackage{calc} % Calculate things about the page layout.
\RequirePackage{geometry} % Page Layout (margins).
\RequirePackage{setspace} % Line Spacing.
\RequirePackage{textcase} % Convert between lower/upper case.
\RequirePackage{microtype} % Typography things.

\PassOptionsToPackage{scrlayer-scrpage}{automark}
\RequirePackage{scrlayer-scrpage} % To customize the headers/footers of different page styles.
\automark[chapter]{chapter}

\PassOptionsToPackage{mdframed}{framemethod=TikZ}
\RequirePackage{mdframed} % To create new environments with a nice box around them.

\RequirePackage{listings} % To create code snippets.
\RequirePackage{scrhack} % To fix compatibility issues with KOMA script and other packages.

%% Page Margins %%

% SGS Requirement: Left margin should be at least 1.25 inches and the remaining margins should be
% at least 0.75 inches to the main text
\geometry{
    top = 1.00in,
    bottom = 1.00in,
    right = 1.25in,
    left = 1.25in,
    % Distance between header and top of text block.
    headsep = 0.5in - \headheight,
    % Distance between page number and bottom of text block.
    footskip = 0.375in,
    % Space for margin notes.
    marginparwidth = 0.75in,
    % Distance between margin notes and text area.
    marginparsep = 0.125in
}

\clearpairofpagestyles
\KOMAoptions{headsepline=1pt}
\KOMAoptions{fontsize=11pt}

%% Front Matter Formatting %%

\newcommand{\frontmatter}{%
  \pagenumbering{roman}

  % SGS Requirement: Page numbers in the preliminary part of the thesis should be centred at the bottom.
  \cfoot[\pagemark]{\pagemark}
}%

\newcommand{\mainmatter}{%
  \pagenumbering{arabic}

  % SGS Requirement: Page numbers should be in the top-right corner.
  \rehead[]{\pagemark}
  \rohead[]{\pagemark}

  \addtokomafont{pageheadfoot}{\normalfont\sffamily}

  % Show section/chapter titles in the header
  \renewcommand*{\chaptermarkformat}{}
  \renewcommand*{\sectionmarkformat}{}
  \automark[section]{chapter}
  \lehead[]{\headmark}
  \lohead[]{\headmark}

  % SGS Requirement: Page numbers for the first page of every chapter should be centred at the bottom.
  \cfoot[\pagemark]{}

  \onehalfspacing
}%

%% Formatting of Chapter Heading %%

\renewcommand*{\chapterformat}{%
  \mbox{\chapappifchapterprefix{\nobreakspace}%
  \scalebox{3}{\thechapter}\enskip}%
}

\DeclareRobustCommand{\AllCapsSpaced}[1]{\textls[160]{\MakeTextUppercase{#1}}}

\renewcommand{\chapterlinesformat}[3]{%
\parbox[b]{\textwidth}{\hfill#2}\par%
\rule{\textwidth}{.4pt}\par
\AllCapsSpaced{#3}%
}


\setkomafont{dictumtext}{\itshape\small}
\setkomafont{dictumauthor}{\normalfont}
\renewcommand*\dictumwidth{\linewidth}
\renewcommand*\dictumauthorformat[1]{--- #1}
\renewcommand*\dictumrule{}

\newenvironment{mydedication}
  {\clearpage           % we want a new page
   \thispagestyle{empty}% no header and footer
   \vspace*{\stretch{1}}% some space at the top
   \itshape             % the text is in italics
   \raggedleft          % flush to the right margin
  }
  {\par % end the paragraph
   \vspace{\stretch{3}} % space at bottom is three times that at the top
   \clearpage           % finish off the page
}