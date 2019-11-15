FROM alpine

WORKDIR /
ENV NPC_VERSION 0.24.0
ENV NPS_RELEASE_URL_1 https://github.com/cnlh/nps/releases/download/v0.23.2/linux_amd64_client.tar.gz
ENV NPS_RELEASE_URL_2 https://github.com/cnlh/nps/releases/download/v0.24.0/npc_linux_amd64
RUN set -x && \
	wget --no-check-certificate ${NPS_RELEASE_URL_1} && \ 
	tar xzf linux_amd64_client.tar.gz && \
	mv /nps /npc && \
	rm /npc/npc && \
	wget --no-check-certificate ${NPS_RELEASE_URL_2} && \ 
	chmod +x /npc_linux_amd64 && \
	mv /npc_linux_amd64 /npc/npc

ENV SERVERIP 127.0.0.1:8284
ENV VKEY 123

CMD /npc/npc -server=${SERVERIP} -vkey=${VKEY}
