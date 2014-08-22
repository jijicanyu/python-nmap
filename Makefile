# python-nmap Makefile

VERSION=`python setup.py --version`
ARCHIVE=`python setup.py --fullname`


test:
	@python nmap/nmap.py

install:
	@python setup.py install

archive: doc
	@python setup.py sdist
	@echo Archive is create and named dist/$(ARCHIVE).tar.gz
	@echo -n md5sum is :
	@md5sum dist/$(ARCHIVE).tar.gz

license:
	@python setup.py --license

register:
	@python setup.py register

doc:
	@pydoc -w nmap/nmap.py

web:
	@echo $(VERSION) > web/python-nmap_CURRENT_VERSION.txt
	@cp dist/$(ARCHIVE).tar.gz web/
	@md5sum web/$(ARCHIVE).tar.gz > LAST_MD5
	@emacsclient -a /usr/bin/emacs22 LAST_MD5 web/index.gtm
	@rm LAST_MD5

.PHONY: web
