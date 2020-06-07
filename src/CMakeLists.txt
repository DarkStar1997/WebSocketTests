include_directories(${EcosystemWebApp_SOURCE_DIR}/extern/uWebSockets/src ${EcosystemWebApp_SOURCE_DIR}/extern/uWebSockets/uSockets/src)

set(SOURCE_LIST
    test1.cpp
    )

set(WEBAPP "app")

add_executable(${WEBAPP} ${SOURCE_LIST})
target_link_libraries(${WEBAPP} ${EcosystemWebApp_SOURCE_DIR}/extern/uWebSockets/uSockets/uSockets.a z)
