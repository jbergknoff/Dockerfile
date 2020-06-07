ARG WINE_IMAGE_TAG=wine-stable-5.0.0
FROM scottyhardy/docker-wine:$WINE_IMAGE_TAG
ENV WINEARCH=win32
ENV PROJECT64_URL=https://www.pj64-emu.com/file/v2-4-0-1225-gb9dac46/

RUN useradd --shell /bin/bash --uid 1000 --create-home wine
USER 1000
WORKDIR /home/wine
RUN wineboot

# Note: this is downloading a zip, but if you have to download the installer (e.g. to get
# the latest stable version, which isn't offered as a zip), it's possible to execute the
# installer headlessly. The installer is made with Inno Setup, which is documented here:
# https://jrsoftware.org/ishelp/topic_setupcmdline.htm
# Executing `wine setup.exe /SILENT /SUPPRESSMSGBOXES /SP-` should do it.
RUN wget $PROJECT64_URL -O setup.zip \
	&& unzip setup.zip -d .wine/drive_c/Program\ Files/Project64\ 2.3 \
	&& rm setup.zip

WORKDIR /home/wine/.wine/drive_c/Program Files/Project64 2.3
ENTRYPOINT ["wine"]
CMD ["Project64.exe"]

