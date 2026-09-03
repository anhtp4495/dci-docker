#!/bin/bash

cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD="$BUILD_CXX_STANDARD" \
    -DCMAKE_TOOLCHAIN_FILE="toolchain.cmake" \
    -DRT7_BUILD_STATIC_LIBS=ON \
    -DCPP_BUILD_TYPE="x64" \
    -DRt7InstallDir="/workspace/binaries/" \
    -DASIO_ROOT="$ASIO_ROOT" \
    -DBOOST_ROOT="$BOOST_ROOT" \
    -DBoost_USE_STATIC_LIBS=ON \
    -DPoco_ROOT="$POCO_ROOT" \
    -DProtobuf_ROOT="$PROTOBUF_ROOT" \
    -DOPENSSL_ROOT_DIR="$OPENSSL_ROOT" \
    -DLUA_ROOT="$LUA_ROOT" \
    -DXercesC_ROOT="$XERCESC_ROOT" \
    -DXQilla_ROOT="$XQILLA_ROOT" \
    -DRAPIDJSON_ROOT="$RAPIDJSON_ROOT" \
    -DJSONCONS_ROOT="$JSONCONS_ROOT" \
    "/workspace/sourcecode"