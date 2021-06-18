#!/bin/sh
# Script to update system

pushd ~/.dotfiles
sudo nixos-rebuild switch -I ./system/configuration.nix
popd
