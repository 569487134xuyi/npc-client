FROM alpine:3.10

WORKDIR /
ENV NPC_VERSION 0.23.2
ENV NPS_RELEASE_URL https://github.com/cnlh/nps/releases/download/v0.23.2/linux_amd64_client.tar.gz
RUN set -x && \
	wget --no-check-certificate ${NPS_RELEASE_URL} && \ 
	mkdir \npc && \
	mv linux_amd64_client* /npc && \
	cd /npc && \
	tar xzf linux_amd64_client.tar.gz && \
	rm -rf *.tar.gz && \
	rm *.conf

ENV SERVERIP 127.0.0.1:8284
ENV VKEY 123

CMD /npc/npc -server=${SERVERIP} -vkey=${VKEY}
