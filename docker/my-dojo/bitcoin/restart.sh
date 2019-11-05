#!/bin/bash
set -e

echo "## Start sliced #############################"

sliced_options=(
  -addnode=89.205.103.10
  -bind=172.28.1.5
  -datadir=/home/slice/.slice
  -dbcache=$SLICED_DB_CACHE
  -disablewallet=1
  -dns=$SLICED_DNS
  -dnsseed=$SLICED_DNSSEED
  -externalip=$(cat /var/lib/tor/hsv2bitcoind/hostname)
  -listen=1
  -maxconnections=$SLICED_MAX_CONNECTIONS
  -maxmempool=$SLICED_MAX_MEMPOOL
  -mempoolexpiry=$SLICED_MEMPOOL_EXPIRY
  -minrelaytxfee=$SLICED_MIN_RELAY_TX_FEE
  -port=40010
  -proxy=172.28.1.4:9050
  -rpcallowip=::/0
  -rpcbind=172.28.1.5
  -rpcpassword=$SLICED_RPC_PASSWORD
  -rpcport=28256
  -rpcthreads=$SLICED_RPC_THREADS
  -rpcuser=$SLICED_RPC_USER
  -server=1
  -txindex=1
  -zmqpubhashblock=tcp://0.0.0.0:9502
  -zmqpubrawtx=tcp://0.0.0.0:9501
)

if [ "$SLICED_RPC_EXTERNAL" == "on" ]; then
  sliced_options+=(-zmqpubhashtx=tcp://0.0.0.0:9500)
  sliced_options+=(-zmqpubrawblock=tcp://0.0.0.0:9503)
fi

if [ "$COMMON_SLC_NETWORK" == "testnet" ]; then
  sliced_options+=(-testnet)
fi

sliced "${sliced_options[@]}"
