#!/bin/bash
# Gaius CLI wrapper for Linux/OSX

function main() {

    if [[ "$1" == "install-engine" ]]; then
        install-engine
        exit 0
    fi

    if [[ ! -d ./bin/gaius ]]; then
        echo "No Gaius engine binaries detected in ./bin/gaius ..."
        install-engine
    fi

    dotnet ./bin/gaius/gaius.dll "$@"
}

function install-engine() {

    if [[ -d ./bin/gaius ]]; then
        echo "Deleting existing Gaius engine binaries in ./bin/gaius ..."
        rm -rf ./bin/gaius
    fi

    echo "Downloading latest release of Gaius engine binaries..."
    curl -O -L https://github.com/gaius-dev/gaius-engine/releases/latest/download/gaius-engine-bin.zip

    mkdir -p ./bin/gaius

    echo "Extracting latest release Gaius engine binaries to ./bin/gaius ..."
    unzip gaius-engine-bin.zip -d ./bin/gaius
    rm gaius-engine-bin.zip
}

main "$@"