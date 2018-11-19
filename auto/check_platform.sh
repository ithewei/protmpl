#!/bin/sh

echo "Checking for OS platform..."
OSP_SYSTEM=`uname -s 2> /dev/null`
OSP_RELEASE=`uname -r 2> /dev/null`
OSP_MACHINE=`uname -m 2> /dev/null`
OS_PLATFORM=$OSP_SYSTEM:$OSP_RELEASE:$OSP_MACHINE
echo "  OS_PLATFORM=$OS_PLATFORM"

case OS_SYSTEM in
    MINGW32_* | MINGW64_* | MSYS_*)
        OS_PLATFORM=win32
        ;;
esac

