
build:
	md2slides -t 'Bash, curl and jq: Accessing the Public ORCID API' presentation.md 

publish:
	git commit -am "snapshot"
	git push origin master
	git checkout gh-pages
	git pull origin master
	git commit -am "merging master into gh-pages"
	git push origin gh-pages
	git checkout master
