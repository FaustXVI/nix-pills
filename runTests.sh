#! /usr/bin/env bash

nix-instantiate --eval --expr "with import ./nixUnit.nix; run (import $@)"
