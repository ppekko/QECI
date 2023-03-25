cmake_minimum_required(VERSION 3.9)
project(app)

add_subdirectory(QECI/Vendor/glad)
find_package(SDL2 REQUIRED)


execute_process(COMMAND ./fetchImGui.sh
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})


if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -Wextra -Wpedantic -std=c++11 -fomit-frame-pointer")
    if(NOT WIN32)
        set(GLAD_LIBRARIES dl)
    endif()
endif()

include_directories(QECI/Headers/
                    QECI/ImGui/Headers/
                    QECI/Vendor/glad/
                    ${SDL2_INCLUDE_DIR})



file(GLOB VENDORS_SOURCES QECI/Vendor/glad/src/glad.c + QECI/ImGui/Sources/*)
file(GLOB PROJECT_HEADERS QECI/Headers/*.hpp)
file(GLOB PROJECT_SOURCES QECI/Sources/*.cpp)
file(GLOB PROJECT_CONFIGS CMakeLists.txt
                          Readme.md
                         .gitattributes
                         .gitignore
                         .gitmodules)

source_group("Headers" FILES ${PROJECT_HEADERS})
source_group("Sources" FILES ${PROJECT_SOURCES})
source_group("Vendors" FILES ${VENDORS_SOURCES})

add_definitions(-DGLFW_INCLUDE_NONE
                -DPROJECT_SOURCE_DIR=\"${PROJECT_SOURCE_DIR}\")

add_executable(${PROJECT_NAME} ${PROJECT_SOURCES} ${PROJECT_HEADERS}
                               ${PROJECT_SHADERS} ${PROJECT_CONFIGS}
                               ${VENDORS_SOURCES} )



target_link_libraries(${PROJECT_NAME}  glad SDL2 -lm -lc ${GLAD_LIBRARIES})

