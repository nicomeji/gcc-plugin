.PHONY: clean download-all download-test download-main

download-all: download-test download-main

download-test: libunity.a
	@echo Test dependencies updated.

download-main:
	@echo Main dependencies updated.

clean:
	rm -rf Unity-2.1.0 libunity.a

libunity.a: Unity-2.1.0
Unity-2.1.0:
	wget -qO- https://github.com/ThrowTheSwitch/Unity/archive/v2.1.0.tar.gz | tar -xvzf - Unity-2.1.0/src
	$(CC) -I Unity-2.1.0/src/ -Wall -c Unity-2.1.0/src/unity.c -o Unity-2.1.0/src/unity.o
	$(AR) -cvq libunity.a Unity-2.1.0/src/unity.o

## Other dependency of these proyect is:
## libjson-glib-1.0.0
## Or:
## https://github.com/kgabis/parson
## http://kgabis.github.io/parson/
