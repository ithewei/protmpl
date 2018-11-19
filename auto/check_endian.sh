#!/bin/sh

echo "Checking for endian..."

cat <<EOF > autotest.c
#include <stdio.h>
int main() {
    short s = 0x1122;
    char* p = (char*)&s;
    if (*p == 0x11)
        return 1;  // big endian
    return 0;  // little endian
}
EOF

gcc -g -Wall autotest.c -o autotest

if [ -x autotest ]; then
    if ./autotest >/dev/null 2>&1; then
        endian=0
        echo "  little endian"
    else
        endian=1
        echo "  big endian"
    fi
else
    echo "error: compiler autotest.c failed!!"
    exit 20
fi

rm -rf autotest.c
rm -rf autotest

