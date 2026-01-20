cmake_minimum_required(VERSION 3.10)
project(WindowsNativeUnixShell)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(wnus wnus.cpp)

# Link against necessary Windows libraries
if(WIN32)
    target_link_libraries(wnus)
endif()
