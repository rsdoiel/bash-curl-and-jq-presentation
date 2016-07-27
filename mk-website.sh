#!/bin/bash
#

function makePage () {
    page=$1
    nav=$2
    html_page=$3
    echo "Generating $html_page"
    shorthand \
        -e "{{content}} :import-markdown: $page" \
        -e "{{nav}} :import-markdown: $nav" \
        page.shorthand > $html_page
}

# Presentation slides
md2slides -title 'Bash, curl and jq: Accessing the Public ORCID API' -css css/slides.css -tamplate slide.template presentation.md 

# index.html
makePage README.md nav.md index.html

# abstract.html
makePage Abstract.md nav.md abstract.html 

# requirements.html
makePage Requirements.md nav.md requirements.html

# install.html (slide presentation)
makePage INSTALL.md nav.md install.html

