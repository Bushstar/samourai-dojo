#########################################
# CONFIGURATION OF SLICED CONTAINER
#########################################

# User account used for rpc access to sliced
# Type: alphanumeric
SLICED_RPC_USER=dojorpc

# Password of user account used for rpc access to sliced
# Type: alphanumeric
SLICED_RPC_PASSWORD=dojorpcpassword

# Max number of connections to network peers
# Type: integer
SLICED_MAX_CONNECTIONS=16

# Mempool maximum size in MB
# Type: integer
SLICED_MAX_MEMPOOL=1024

# Db cache size in MB
# Type: integer
SLICED_DB_CACHE=1024

# Number of threads to service RPC calls
# Type: integer
SLICED_RPC_THREADS=6

# Mempool expiry in hours
# Defines how long transactions stay in your local mempool before expiring
# Type: integer
SLICED_MEMPOOL_EXPIRY=72

# Min relay tx fee in BTC
# Type: numeric
SLICED_MIN_RELAY_TX_FEE=0.00001


#
# EXPERT SETTINGS
#


#
# EPHEMERAL ONION ADDRESS FOR SLICED
# THIS PARAMETER HAS NO EFFECT IF SLICED_INSTALL IS SET TO OFF
#

# Generate a new onion address for sliced when Dojo is launched
# Activation of this option is recommended for improved privacy.
# Values: on | off
SLICED_EPHEMERAL_HS=on


#
# EXPOSE SLICED RPC API AND ZMQ NOTIFICATIONS TO EXTERNAL APPS
# THESE PARAMETERS HAVE NO EFFECT IF SLICED_INSTALL IS SET TO OFF
#

# Expose the RPC API to external apps
# Warning: Do not expose your RPC API to internet!
# See SLICED_RPC_EXTERNAL_IP
# Value: on | off
SLICED_RPC_EXTERNAL=off

# IP address used to expose the RPC API to external apps
# This parameter is inactive if SLICED_RPC_EXTERNAL isn't set to 'on'
# Warning: Do not expose your RPC API to internet!
# Recommended value:
#   linux: 127.0.0.1
#   macos or windows: IP address of the VM running the docker host
# Type: string
SLICED_RPC_EXTERNAL_IP=127.0.0.1


#
# INSTALL AND RUN SLICED INSIDE DOCKER
#

# Install and run sliced inside Docker
# Set this option to 'off' for using a sliced hosted outside of Docker (not recommended)
# Value: on | off
SLICED_INSTALL=on

# IP address of sliced used by Dojo
# Set value to 172.28.1.5 if SLICED_INSTALL is set to 'on'
# Type: string
SLICED_IP=172.28.1.5

# Port of the RPC API
# Set value to 28256 if SLICED_INSTALL is set to 'on'
# Type: integer
SLICED_RPC_PORT=28256

# Port exposing ZMQ notifications for raw transactions
# Set value to 9501 if SLICED_INSTALL is set to 'on'
# Type: integer
SLICED_ZMQ_RAWTXS=9501

# Port exposing ZMQ notifications for block hashes
# Set value to 9502 if SLICED_INSTALL is set to 'on'
# Type: integer
SLICED_ZMQ_BLK_HASH=9502