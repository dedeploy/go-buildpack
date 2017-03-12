#!/bin/bash

set -e

GREEN='\033[0;32m'
RED='\033[1;31m'
NC='\033[0m'
BUILDPACKDIR="/buildpacks/go-buildpack"

info() {
    echo -e "${GREEN} ==>   $@${NC}"
}

err() {
    echo -e >&2 "${RED} !!    $@${NC}"
}


if [[ -z $GOPACKAGENAME ]] 
then
	err "You must set GOPACKAGENAME"
	exit 1
fi

info "Building"

cd $BUILDPACKDIR/bin && ./compile $GOPATH/src/$GOPACKAGENAME /tmp
