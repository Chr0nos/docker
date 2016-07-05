edit preferences in the Dockerfile to choose logins/pass


build args:
	STEAM_LOGIN
	STEAM_PASS
		note: thoses 2 are mandatory, the server will not works in annonymous mode
	STEAM_GUARD

environements variables:
	KF_SEVER_NAME <server name>
	KF_LOGIN
		admin's login (please don't use "admin")
	KF_PASS
		admin's password
	KF_MAIL
		admin's mail
	KF_PLAYPASS
		the password to play on the server (don't set for no password)
	KF_GAMELEN
		0 for short (4 waves)
		1 for medium (7 waves)
		2 for long (10 waves)
		3 for custom (for sandbox)

to build the image:
docker build -t killingfloor --build-arg STEAM_LOGIN=login --build-arg STEAM_PASS=pass .

to run the server:
docker run -d --name kf -p 8075:8075 -p 7707:7707/udp -p 7708:7708/udp -p 20560:20560/udp -p 28852:28852 killingfloor
