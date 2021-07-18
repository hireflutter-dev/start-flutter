#!/bin/sh

PUB_GET='flutter pub get'
BUILD_RUNNER='flutter pub run build_runner build --delete-conflicting-outputs'

$PUB_GET
$BUILD_RUNNER