ARG WINE_IMAGE_TAG=wine-stable-5.0.0
FROM scottyhardy/docker-wine:$WINE_IMAGE_TAG
ENV PROJECT64_URL=https://www.pj64-emu.com/file/v2-4-0-1225-gb9dac46/

RUN useradd --shell /bin/bash --uid 1000 --create-home wine
USER 1000
WORKDIR /home/wine

# Sleep to work around the multi-process nature of Wine. The wineboot kicks off background processes
# that are unceremoniously terminated in the course of doing the Docker build, otherwise.
# cf. https://github.com/moby/moby/issues/12795
RUN wineboot --init && sleep 10

# Note: this is downloading a zip, but if you have to download the installer (e.g. to get
# the latest stable version, which isn't offered as a zip), it's possible to execute the
# installer headlessly. The installer is made with Inno Setup, which is documented here:
# https://jrsoftware.org/ishelp/topic_setupcmdline.htm
# Executing `wine setup.exe /SILENT /SUPPRESSMSGBOXES /SP-` should do it.
RUN wget $PROJECT64_URL -O setup.zip \
	&& unzip setup.zip -d .wine/drive_c/Project64 \
	&& rm setup.zip

WORKDIR /home/wine/.wine/drive_c/Project64
ENTRYPOINT ["wine"]
CMD ["Project64.exe"]
