# SBOL-specification

This repository contains the master specification document for the SBOL data model, formatted in LaTeX.  The workflow for updating the specification is to clone, edit, and submit a pull request on the master.

Members of the SBOL Development Community may use the issue tracker to flag problems with the existing specification and review ongoing issues under consideration.

# Submitting changes to the specification

Before writing text for a non-trivial change, please have it approved by discussion as an Issue and/or SEP.

Proposed changes should be made in either a branch or a separate fork on GitHub.  To do this, follow standard git branching or forking procedure.  

Here is an example of git commands to achieve this:

    git clone https://github.com/SynBioDex/SBOL-specification.git
    git pull origin master — MAKE SURE NO ONE HAS MADE ANYMORE CHANGES
    git checkout -b <newBranch> — CREATE NEW BRANCH
    MAKE YOUR EDITS
    git add <filesYouChanged>
    git commit
    git push origin <newBranch>

When you are ready for your changes to be reviewed for incorporation, create a pull request.
If you need help on pull requests see: https://help.github.com/articles/about-pull-requests/

# Building the PDF from LateX

To build, run these commands and check the output for errors. If there are errors, resolve them and re-run the failed build step before proceeding.

    pdflatex sbol2
    bibtex sbol2
    pdflatex sbol2
    pdflatex sbol2

Note that pdflatex is run several times. Each successive pass mows down unresolved references from the previous passes. For example, the extra pdflatex commands set references correctly after bibtex completes. You don’t need to do this in every build unless the bibliography has changed.  For development purposes, you may just need to run pdflatex once.

The git status command will show you which intermediate build products and logs you need to delete for a clean build.

You can also build with Docker if you don't want to install latex, but note that the Docker image is huge.

    docker run -v $(pwd):/opt/spec jmcl/specbuild


# LaTeX installation notes

Installing LaTeX on your system is beyond the scope of this README, however we will collect some tips here, in the interest of fostering collaboration.


# MacTex installation notes

Here is how one community member managed to install MacTex and BibTex on OS X 10.10.5 Yosemite in August 2016. This recipe was found on StackOverflow. Not all of these commands may be strictly necessary to build the SBOL2 pdf at this time. The bibdesk settings especially need curation. Please note that BasicTex alone did not suffice.

    # First install homebrew from http://brew.sh then...
    brew update
    brew upgrade
    brew tap caskroom/cask
    brew install brew-cask
    brew cask install mactex
    brew cask install bibtex
    brew cask install bibdesk
    brew cask install texshop
    brew cask install mendeley-desktop
    sudo chown -R $USER  /usr/local/texlive
    tlmgr update --self
    tlmgr update --all
    defaults write TeXShop NSUserKeyEquivalents -dict-add "Typeset" "@t"
    defaults write TeXShop "BibTeXengine" -string "biber"
    defaults write TeXShop "Encoding"  -string  "IsoLatin"
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Cite Key Format" -string %y%u0"
    defaults write edu.ucsd.cs.mmccrack.bibdesk BDSKLocalFileFormatKey -string Cite Key}%n0%e"
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Path to the papers folder" ing "Biblio"
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Cite String" -string "citep"
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Cite Key Autogenerate" -int 1
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Cite Key Format Preset" -int 0
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Cite Prepend Tilde" -int 1
    defaults write edu.ucsd.cs.mmccrack.bibdesk "Startup Behavior" -int 4
