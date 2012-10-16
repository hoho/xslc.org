start: build
	jekyll .. ../_site --server

build:
	python ./tools/build.py ./pages ./blocks ..
	if test "$(MINIMIZE)" = "yes"; then \
		uglifyjs --no-copyright -o ../cssjs/js.js ../cssjs/js.js; \
		csso -i ../cssjs/css.css -o ../cssjs/css.css; \
	fi
