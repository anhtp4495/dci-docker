#!/bin/sh
set -e

FILE="/sources/rapidjson/include/rapidjson/document.h"

if grep -q 'const_cast<SizeType&>(length) = rhs.length;' "$FILE"; then
    echo "rapidjson GenericStringRef::operator= already patched"
else
    echo "Patching rapidjson GenericStringRef::operator= (assignment of const member)"

    sed -i \
        's/GenericStringRef& operator=(const GenericStringRef& rhs) { s = rhs.s; length = rhs.length; }/GenericStringRef\& operator=(const GenericStringRef\& rhs) { s = rhs.s; const_cast<SizeType\&>(length) = rhs.length; return *this; }/' \
        "$FILE"
fi
