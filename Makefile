
build:
	md2slides -t 'Bash, curl and jq: Accessing the Public ORCID API' presentation.md 

publish:
	git commit -am "publishing"
	git push origin master
	git checkout gh-pages
	git pull origin master
	git commit -am "publishing to gh-pages"
	git push origin gh-pages
	git checkout master
