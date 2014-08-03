.PHONY: clean download-all download-test download-main

download-all: download-test download-main

download-test: Unity-2.1.0
	@echo Test dependencies updated.

download-main:
	@echo Main dependencies updated.

clean:
	rm -rf Unity-2.1.0

Unity-2.1.0:
	wget -qO- https://github.com/ThrowTheSwitch/Unity/archive/v2.1.0.tar.gz | tar -xvzf - Unity-2.1.0/src
