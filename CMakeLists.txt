cmake_minimum_required(VERSION 3.13)
project(MagisterskaNalogaKoda)

set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_CXX_FLAGS_RELEASE "-O0")
include_directories(/include)

add_executable(MagisterskaNalogaKoda main.cpp)
target_link_libraries(MagisterskaNalogaKoda /lib/libsdsl.a)