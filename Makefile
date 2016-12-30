all: start_server

elm_compile:
	elm-make OrderingPortEventsTest.elm --output elm.js

start_server: elm_compile
	python -m SimpleHTTPServer 8000
