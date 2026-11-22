# Tweaks applied to the APKBUILDs of every channel, after the upstream APKBUILD (and, for the
# nightly channel, Nura's nightly-builder tweaks) and before the build. Each line names the
# package it applies to. Helpers: see README.md.

# plasma-keyboard: input methods for Chinese (pinyin, zhuyin/chewing), Japanese (anthy) and
# Korean (hangul). Its master branch requires all four (the 6.8 branch doesn't have them yet).
add_makedep plasma-keyboard libpinyin-dev
add_makedep plasma-keyboard libchewing-dev
add_makedep plasma-keyboard anthy-dev
add_makedep plasma-keyboard libhangul-dev
