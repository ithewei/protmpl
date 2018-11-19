#!/bin/sh

cat <<EOF >> $AUTO_CONFIG_H
#ifndef $macro_name
#define $macro_name $macro_value
#endif

EOF

