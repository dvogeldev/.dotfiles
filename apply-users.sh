#!/bin/sh

pushd ~/.dotfiles
home-manager switch -f ./users/david/home.nix
popd
