#!/bin/sh

if [[ "$*" == *"--watch"* ]]; then
    dart run build_runner watch --delete-conflicting-outputs
   else
    dart run  build_runner build --delete-conflicting-outputs
fi