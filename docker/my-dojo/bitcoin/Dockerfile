FROM    debian:stretch


#################################################################
# INSTALL SLICE
#################################################################
ENV     SLICE_HOME        /home/slice
ENV     SLICE_VERSION     0.18.1
ENV     SLICE_URL         https://github.com/slicecoincore/slice/releases/download/v0.18.1/slice-0.18.1-x86_64-linux-gnu.tar.gz

RUN     set -ex && \
        apt-get update && \
        apt-get install -qq --no-install-recommends ca-certificates dirmngr gosu gpg wget && \
        rm -rf /var/lib/apt/lists/*

# Build and install slice binaries
RUN     set -ex && \
        cd /tmp && \
        wget -q "$SLICE_URL" && \
        tar -xzvf slice-0.18.1-x86_64-linux-gnu.tar.gz -C /usr/local --strip-components=1 && \
        rm -rf /tmp/*

# Create groups bitcoin & tor
# Create user bitcoin and add it to groups
RUN     addgroup --system -gid 1108 bitcoin && \
        addgroup --system -gid 1107 tor && \
        adduser --system --ingroup bitcoin -uid 1105 bitcoin && \
        usermod -a -G tor bitcoin

# Create data directory
RUN     mkdir "$SLICE_HOME/.slice" && \
        chown -h bitcoin:bitcoin "$SLICE_HOME/.slice"

# Copy restart script
COPY    ./restart.sh /restart.sh
RUN     chown bitcoin:bitcoin /restart.sh && \
        chmod 777 /restart.sh

# Copy wait-for-it script
COPY    ./wait-for-it.sh /wait-for-it.sh

RUN     chown bitcoin:bitcoin /wait-for-it.sh && \
        chmod u+x /wait-for-it.sh && \
        chmod g+x /wait-for-it.sh

EXPOSE  9501 9502 28256 40010

USER    bitcoin