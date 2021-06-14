#!/bin/sh
# Script to update system

pushd ~/.dotfiles
sudo nixos-rebuild switch --flake .#
popd
