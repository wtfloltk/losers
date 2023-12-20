export GITHASH 		:= $(shell git rev-parse --short HEAD)
export VERSION 		:= 66.0.666
export API_VERSION 	:= 4
export WANT_FLAC 	:= 1
export WANT_MP3 	:= 1
export WANT_WAV 	:= 1

all: overlay nxExt module

clean:
	$(MAKE) -C sys-tune/nxExt clean
	$(MAKE) -C overlay clean
	$(MAKE) -C sys-tune clean
	-rm -r dist
	-rm sys-tune-*-*.zip

overlay:
	git config --global --add safe.directory /__w/losers/losers
	$(MAKE) -C overlay

nxExt:
	git config --global --add safe.directory /__w/losers/losers
	$(MAKE) -C sys-tune/nxExt

module:
	git config --global --add safe.directory /__w/losers/losers
	$(MAKE) -C sys-tune

dist: all
	git config --global --add safe.directory /__w/losers/losers
	mkdir -p dist/switch/.overlays
	mkdir -p dist/atmosphere/contents/420000000000FA17
	cp sys-tune/sys-tune.nsp dist/atmosphere/contents/420000000000FA17/exefs.nsp
	cp overlay/sys-tune-overlay.ovl dist/switch/.overlays/
	cp sys-tune/toolbox.json dist/atmosphere/contents/420000000000FA17/
	cd dist; zip -r sys-tune-$(VERSION)-$(GITHASH).zip ./**/; cp *.zip ../; cd ../;
	-hactool -t nso sys-tune/sys-tune.nso

wah:
	git config --global --add safe.directory /__w/losers/losers
	$(MAKE) overlay -j66
	$(MAKE) sys-tune/nxExt -j66
	$(MAKE) sys-tune -j66
	$(MAKE) all -j66
	
.PHONY: all overlay module
