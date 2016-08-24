#!/bin/bash
#

function makePage () {
    page=$1
    nav=$2
    html_page=$3
    echo "Generating $html_page"
    mkpage \
        "header=header.md" \
        "footer=footer.md" \
        "content=$page" \
        "nav=$nav" \
        page.tmpl > $html_page
}

# Presentation slides
md2slides -title 'Bash, curl and jq: Accessing the Public ORCID API' -css css/slides.css -template slide.template presentation.md 

# index.html
makePage README.md nav.md index.html

# abstract.html
makePage Abstract.md nav.md abstract.html 

# requirements.html
makePage Requirements.md nav.md requirements.html

# install.html (slide presentation)
makePage INSTALL.md nav.md install.html

