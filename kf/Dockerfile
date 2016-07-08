FROM debian:latest
MAINTAINER snicolet@student.42.fr

#killing floor server preferences
ENV KF_LOGIN=admin \
	KF_PASS=admin \
	KF_GAMELEN=2 \
	KF_DIFFICULTY=7.0 \
	KF_CONFIG=/kf/server/System/killingfloor-server.ini \
	term=xterm

WORKDIR /
RUN apt-get update && \
	apt-get install -y lib32gcc1 curl lib32stdc++6 vim htop psmisc screen && \
	rm -rf /var/lib/apt/lists/* && \
	echo "syntax on\nset nu\nset ruler" > ~/.vimrc && \
	mkdir -p /kf/server

WORKDIR /kf
COPY setup.sh /kf/setup.sh
RUN curl -O https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
	tar -xf steamcmd_linux.tar.gz && \
	rm -f steamcmd_linux.tar.gz && \
	echo "cd /kf/server/System && ./ucc-bin KF-BioticsLab.rom?game=KFmod.KFGameType -nohomedir ini=$KF_CONFIG" > start.sh && \
	chmod +x setup.sh steamcmd.sh

#i split this command in case of login failure, to just redo this one
RUN ./steamcmd.sh $STEAM_GUARD +login $STEAM_LOGIN $STEAM_PASS +force_install_dir /kf/server +app_update 215360 validate +quit

EXPOSE 7707/udp \
	7708/udp \
	7717/udp \
	28852 \
	8075 \
	20560/udp

ENTRYPOINT ["/kf/server/setup.sh"]
