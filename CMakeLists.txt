cmake_minimum_required(VERSION 3.13)
project(MagisterskaNalogaKoda)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD 11)
link_directories(${CMAKE_SOURCE_DIR}/lib)

add_executable(MagisterskaNalogaKoda main.c)