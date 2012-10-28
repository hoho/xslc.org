start: build
	jekyll .. ../_site --server

build:
	cd pages; xbem-build pages.build; cd ..
	if test "$(MINIMIZE)" = "yes"; then \
		uglifyjs --no-copyright -o ../cssjs/js.js ../cssjs/js.js; \
		csso -i ../cssjs/css.css -o ../cssjs/css.css; \
	fi
