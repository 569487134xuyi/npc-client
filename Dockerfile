FROM alpine

WORKDIR /
ENV NPC_VERSION 0.24.0
ENV NPS_RELEASE_URL_2 https://github.com/cnlh/nps/releases/download/v0.24.0/npc_linux_amd64
COPY npc.conf .
RUN set -x && \
	wget --no-check-certificate ${NPS_RELEASE_URL_2} && \ 
	chmod +x /npc_linux_amd64 && \
	mkdir /npc && \
	mv /npc_linux_amd64 /npc/npc && \
	mkdir /npc/conf && \
	mv /npc.conf /npc/conf/npc.conf

ENV SERVERIP 127.0.0.1:8284
ENV VKEY 123

CMD /npc/npc -server=${SERVERIP} -vkey=${VKEY}
