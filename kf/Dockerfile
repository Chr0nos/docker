FROM debian:latest
MAINTAINER snicolet@student.42.fr

ARG STEAM_LOGIN
ARG STEAM_PASS
ARG STEAM_GUARD

#killing floor server preferences
ENV KF_LOGIN=admin \
	KF_PASS=admin \
	KF_GAMELEN=2 \
	KF_DIFFICULTY=7.0 \
	KF_CONFIG=/kf/server/System/killingfloor-server.ini \
	TERM=xterm

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
	chmod +x setup.sh steamcmd.sh

#i split this command in case of login failure, to just redo this one
RUN ./steamcmd.sh +login ${STEAM_LOGIN} ${STEAM_PASS} ${STEAN_GUARD} +force_install_dir /kf/server +app_update 215360 validate +quit

WORKDIR /kf/server/System
RUN	curl -O http://www.goodmods.com/Killing-Floor/KFAntiBlocker_1.1/MutKFAntiBlocker.u && \
	curl -O http://www.goodmods.com/Killing-Floor/KFAntiBlocker_1.1/MutKFAntiBlocker.ucl && \
	curl -O http://thirdreich.ru/Killing_Floor/Mutators/KFNoDramaMut/KFNoDramaMut.int && \
	curl -O http://thirdreich.ru/Killing_Floor/Mutators/KFNoDramaMut/KFNoDramaMut.u && \
	curl -O http://thirdreich.ru/Killing_Floor/Mutators/KFNoDramaMut/KFNoDramaMut.ucl && \
	curl -O http://thirdreich.ru/Killing_Floor/Mutators/KFPatHPLeft/KFPatHPLeft.u && \
	curl -O http://thirdreich.ru/Killing_Floor/Mutators/KFPatHPLeft/KFPatHPLeft.ucl

EXPOSE 7707/udp \
	7708/udp \
	7717/udp \
	28852 \
	8075 \
	20560/udp

ENTRYPOINT ["/kf/server/setup.sh"]
