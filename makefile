

build_wdio_chrome:
	docker build -t michaelconnor00/webdriver-chrome webdriver-chrome/

run_wdio_base:
	docker run --rm -it michaelconnor00/webdriver-chrome bash
