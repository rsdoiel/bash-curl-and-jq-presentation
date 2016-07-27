#!/bin/bash
RELEASE_NAME=bash-curl-and-jq-presentation
zip -r $RELEASE_NAME-slides.zip README.md LICENSE
findfile -s .css | while read FNAME; do
    zip -r $RELEASE_NAME-slides.zip $FNAME
done
findfile -s .html | while read FNAME; do
    zip -r $RELEASE_NAME-slides.zip $FNAME
done
findfile -s .bash | while read FNAME; do
    zip -r $RELEASE_NAME-slides.zip $FNAME
done
findfile -s .json | while read FNAME; do
    zip -r $RELEASE_NAME-slides.zip $FNAME
done
