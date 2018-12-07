

build_wdio_chrome:
	docker build -t michaelconnor00/wdio-chrome webdriver-chrome/

run_wdio_base:
	docker run --rm -it michaelconnor00/wdio-chrome bash

build_selenium:
	docker build -t michaelconnor00/selenium-test selenium-test/

run_selenium:
	docker run --rm -it michaelconnor00/selenium-test bash
