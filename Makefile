#
# Simple Makefile to generated website and presentation slides
#

build:
	md2slides -title 'Bash, curl and jq: Accessing the Public ORCID API' presentation.md 
	./mk-scripts-txt.sh
	./mk-website.sh

publish:
	./mk-scripts-txt.sh
	./mk-website.sh
	./publish.sh

status:
	git status

release:
	./mk-scripts-txt.sh
	./mk-website.sh
	./mk-release.sh

save:
	git commit -am draft
	git push origin master

