all: elm_compile

elm_compile:
	elm-make OrderingPortEventsTest.elm --output elm.js
