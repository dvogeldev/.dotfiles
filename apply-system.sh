#!/bin/sh
# Script to update system

pushd ~/.dotfiles
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
