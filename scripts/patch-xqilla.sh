#!/bin/bash
set -e

FILE="/sources/XQilla-2.3.4/include/xqilla/ast/XQDocumentOrder.hpp"

if grep -q 'bool operator()(const Node::Ptr &first, const Node::Ptr &second) const' "$FILE"; then
    echo "XQilla comparator already patched"
else
    echo "Patching XQilla comparator"

    sed -i \
        's/bool operator()(const Node::Ptr \&first, const Node::Ptr \&second)$/bool operator()(const Node::Ptr \&first, const Node::Ptr \&second) const/' \
        "$FILE"
fi