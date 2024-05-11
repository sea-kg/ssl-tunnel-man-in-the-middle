#!/bin/bash
check_ret() {
    if [ $1 -ne 0 ]; then
        echo ""
        echo "!!! FAIL: $2"
        echo "********************************************************************************"
        echo ""
        exit $1
    else
        echo ""
        echo "*** SUCCESS: $2"
        echo "********************************************************************************"
        echo ""
    fi
}

if [ ! -f ssl_proxy_tunnel ]; then
    ./build_ssl_proxy_tunnel.sh
    check_ret $? "Could not build ssl_proxy_tunnel "
fi

# LD_PRELOAD=$(pwd)/openssl/build/lib64/libssl.so.3:$(pwd)/openssl/build/lib64/libcrypto.so.3 ldd -d ./ssl_proxy_tunnel
# LD_PRELOAD=$(pwd)/openssl/build/lib64/libssl.so.3:$(pwd)/openssl/build/lib64/libcrypto.so.3 ./openssl/build/bin/openssl version -a

LD_PRELOAD=$(pwd)/openssl/build/lib64/libssl.so.3:$(pwd)/openssl/build/lib64/libcrypto.so.3 ./ssl_proxy_tunnel