FROM debian:latest
MAINTAINER snicolet@student.42.fr

#killing floor server preferences
ENV KF_LOGIN=admin \
	KF_PASS=admin \
	KF_GAMELEN=2 \
	KF_CONFIG=/kf/server/System/killingfloor-server.ini \
	term=xterm

WORKDIR /
RUN apt-get update && \
	apt-get install -y lib32gcc1 curl lib32stdc++6 vim htop psmisc screen && \
	rm -rf /var/lib/apt/lists/* && \
	echo "syntax on" > ~/.vimrc && \
	mkdir -p /kf/server

WORKDIR /kf
RUN curl -O https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
	tar -xf steamcmd_linux.tar.gz && \
	rm -f steamcmd_linux.tar.gz && \
	chmod +x steamcmd.sh && \
	echo "killall ucc-bin" > stop.sh && \
	chmod +x stop.sh && \
	echo "cd /kf/server/System && ./ucc-bin KF-BioticsLab.rom?game=KFmod.KFGameType -nohomedir ini=$KF_CONFIG" > start.sh && \
	chmod +x start.sh

#i split this command in case of login failure, to just redo this one
RUN ./steamcmd.sh $STEAM_GUARD +login $STEAM_LOGIN $STEAM_PASS +force_install_dir /kf/server +app_update 215360 validate +quit

WORKDIR /kf/server/System
RUN cp -v Default.ini $KF_CONFIG && \
	sed -i s/AdminPassword=/AdminPassword=$KF_PASS/g $KF_CONFIG && \
	sed -i s/GamePassword=/GamePassword=$KF_PLAYPASS/g $KF_CONFIG && \
	sed -i s/AdminName=/AdminName=$KF_LOGIN/g $KF_CONFIG && \
	sed -i s/bEnabled=False/bEnabled=True/g $KF_CONFIG && \
	sed -i s/CharSet="iso-8859-1"/CharSet="utf-8"/g UWeb.int && \
	sed -i s/ServerName=/ServerName=$KF_SERVER_NAME/g $KF_CONFIG && \
	sed -i s/AdminEmail=/AdminEmail=$KF_MAIL/g $KF_CONFIG && \
	sed -i s/KFGameLength=/KFGameLength=$KF_GAMELEN/g $KF_CONFIG


EXPOSE 7707/udp \
	7708/udp \
	7717/udp \
	28852 \
	8075 \
	20560/udp

ENTRYPOINT ["/kf/server/System/ucc-bin", "server", "KF-BioticsLab.rom?game=KFmod.KFGameType", "-nohomedir", "ini=/kf/server/System/killingfloor-server.ini"]

