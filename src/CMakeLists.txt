cmake_minimum_required (VERSION 2.6)

project (chw)

add_executable(chw main.c)

install(TARGETS chw DESTINATION /usr/bin)
