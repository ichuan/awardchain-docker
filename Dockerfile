FROM ubuntu:14.04
SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/coin
WORKDIR /opt/coin
ADD ./AwardChaind.tar.gz /opt/coin/bin/

EXPOSE 12828

RUN apt-get update && apt-get install -y python libboost-all-dev libdb5.3++-dev libminiupnpc-dev

# cleanup
RUN apt-get autoremove -y && apt-get autoclean
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/opt/coin/data", "/opt/coin/coin.conf"]

ENTRYPOINT ["/opt/coin/bin/AwardChaind"]
CMD ["-conf=/opt/coin/coin.conf"]
