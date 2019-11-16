FROM debian

WORKDIR /npc
ENV NPC_VERSION 0.24.0
ENV NPS_RELEASE_URL_2 https://github.com/cnlh/nps/releases/download/v0.24.0/npc_linux_amd64
COPY npc.conf .
RUN set -x && \
	apt-get update && \
	apt-get install -y wget && \
	wget --no-check-certificate ${NPS_RELEASE_URL_2} && \ 
	chmod +x ./npc_linux_amd64 && \
	mv ./npc_linux_amd64 ./npc && \
	mkdir ./conf && \
	mv ./npc.conf ./conf/npc.conf

ENV SERVERIP 127.0.0.1:8284
ENV VKEY 123

CMD /npc/npc -server=${SERVERIP} -vkey=${VKEY}
