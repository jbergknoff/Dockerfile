ARG WINE_IMAGE_TAG=wine-stable-5.0.0
FROM scottyhardy/docker-wine:$WINE_IMAGE_TAG
ENV PROJECT64_URL=https://www.pj64-emu.com/file/setup-project64-v2-3-2-202-g57a221e/

RUN useradd --shell /bin/bash --uid 1000 --create-home wine
USER 1000
WORKDIR /home/wine

# Sleep to work around the multi-process nature of Wine. The wineboot kicks off background processes
# that are unceremoniously terminated in the course of doing the Docker build, otherwise.
# cf. https://github.com/moby/moby/issues/12795
RUN wineboot --init && sleep 10

# Running the installer headlessly. It's made with Inno Setup, which is documented here:
# https://jrsoftware.org/ishelp/topic_setupcmdline.htm
RUN wget $PROJECT64_URL -O setup.exe \
	&& xvfb-run wine setup.exe /SP- /SILENT /SUPPRESSMSGBOXES /DIR="c:\Project64" \
	&& rm setup.exe

WORKDIR /home/wine/.wine/drive_c/Project64
ENTRYPOINT ["wine"]
CMD ["Project64.exe"]
