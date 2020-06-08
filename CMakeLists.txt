cmake_minimum_required(VERSION 3.5)

project(EcosystemWebApp
    DESCRIPTION "Ecosystem Web App"
    LANGUAGES C CXX
    )

find_program(CCACHE_PROGRAM ccache)

if(CCACHE_PROGRAM)
    MESSAGE("CCACHE support enabled")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK "${CCACHE_PROGRAM}")
endif()

find_program(MAKE make)

if(NOT MAKE)
    MESSAGE( FATAL_ERROR "make program not found" )
else()
    MESSAGE("GNU make found")
    if(NOT EXISTS ${EcosystemWebApp_SOURCE_DIR}/extern/uWebSockets/uSockets/uSockets.a)
        execute_process(COMMAND ${MAKE} -C ${EcosystemWebApp_SOURCE_DIR}/extern/uWebSockets
                        COMMAND_ECHO STDOUT)
    endif()
endif()

set(CMAKE_CXX_FLAGS "-std=c++17 -O3 -fopenmp -march=native")
#add_subdirectory(scripts)
add_subdirectory(src)
