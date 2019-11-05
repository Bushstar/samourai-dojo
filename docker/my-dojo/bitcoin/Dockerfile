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

# Create groups slice & tor
# Create user slice and add it to groups
RUN     addgroup --system -gid 1108 slice && \
        addgroup --system -gid 1107 tor && \
        adduser --system --ingroup slice -uid 1105 slice && \
        usermod -a -G tor slice

# Create data directory
RUN     mkdir "$SLICE_HOME/.slice" && \
        chown -h slice:slice "$SLICE_HOME/.slice"

# Copy restart script
COPY    ./restart.sh /restart.sh
RUN     chown slice:slice /restart.sh && \
        chmod 777 /restart.sh

# Copy wait-for-it script
COPY    ./wait-for-it.sh /wait-for-it.sh

RUN     chown slice:slice /wait-for-it.sh && \
        chmod u+x /wait-for-it.sh && \
        chmod g+x /wait-for-it.sh

EXPOSE  9501 9502 28256 40010

USER    slice