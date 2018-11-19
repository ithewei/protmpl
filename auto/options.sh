#!/bin/sh

echo "Checking for options..."
options=$*
echo "  options=$options"

help=no

for option
do
    case $option in
        *=*) value=$(echo $option | sed -e s/.*=//) ;;
        *)   value="" ;;
    esac
              
    case $option in
        --help)
            help=yes
            ;;
        --builddir=*)
            builddir=$value
            ;;
        --prefix=*)
            prefix=$value
            ;;
        --incdir=*)
            incdir=$value
            ;;
        --libdir=*)
            libdir=$value
            ;;
        --bindir=*)
            bindir =$value
            ;;
        --sbindir=*)
            sbindir=$value
            ;;
        --confdir=*)
            confdir=$value
            ;;
        --datadir=*)
            datadir=$value
            ;;
        --docdir=*)
            docdir=$value
            ;;
        --mandir=*)
            mandir=$value
            ;;
        --pkgconfigdir=*)
            pkgconfigdir=$value
            ;;
        --test)
            echo $0: warning: the option "test" is deprecated!
            ;;
        *)
            echo $0: error: invalid option $option!!
            exit 10
            ;;
    esac
done

if [ $help = yes ]; then
    cat <<EOF
Help options:
  --help                   print this message

Standard options:
  --builddir=DIR           build object files in DIR [build]
  --prefix=PREFIX          install in PREFIX [/usr/local]
  --incdir=DIR             install includes in DIR [PREFIX/include]
  --libdir=DIR             install libs in DIR [PREFIX/lib]
  --bindir=DIR             install binaries in DIR [PREFIX/bin]
  --sbindir=DIR            install sbin in DIR [PREFIX/sbin]
  --confdir=DIR            install config files in DIR [PREFIX/etc]
  --datadir=DIR            install data files in DIR [PREFIX/share]
  --docdir=DIR             install documentation in DIR [PREFIX/share/doc]
  --mandir=DIR             install man page in DIR [PREFIX/share/man]
  --pkgconfigdir=DIR       install pkg-config files in DIR [LIBDIR/pkgconfig]
EOF
    exit 0
fi

test -z $builddir && builddir=build
test -z $prefix && prefix=/usr/local
test -z $incdir && incdir=$prefix/include
test -z $libdir && libdir=$prefix/lib
test -z $bindir && bindir=$prefix/bin
test -z $sbindir && sbindir=$prefix/sbin
test -z $confdir && confdir=$prefix/etc
test -z $datadir && datadir=$prefix/share
test -z $docdir  && docdir=$datadir/doc
test -z $mandir  && mandir=$datadir/man
test -z $pkgconfigdir && pkgconfigdir=$libdir/pkgconfig

echo "  builddir=$builddir"
echo "  prefix=$prefix"
echo "  incdir=$incdir"
echo "  libdir=$libdir"
echo "  bindir=$bindir"
echo "  sbindir=$sbindir"
echo "  confdir=$confdir"
echo "  datadir=$datadir"
echo "  docdir=$docdir"
echo "  mandir=$mandir"
echo "  pkgconfigdir=$pkgconfigdir"

