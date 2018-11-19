#!/bin/sh

cat <<EOF > autotest.c
#include <$header_file>
int main() {
    return 0;
}
EOF

gcc -g -Wall autotest.c -o autotest

if [ -x autotest ]; then
    macro_name=HAVE_`echo $header_file | tr a-z./ A-Z__`
    macro_value=1
    . auto/auto_config.sh
    echo "Checking for $header_file...\t\t\tyes"
else
    echo "Checking for $header_file...\t\t\tno"
fi

rm -rf autotest.c
rm -rf autotest

