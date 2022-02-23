cmake_minimum_required(VERSION 3.9)
project(smallglitter)

find_package(SelfPackers REQUIRED)
message(AUTHOR_WARNING "SelfPacker found but may not be correct!\nTinyGlitter requires the UPX Self packer to be installed by default, if the build fails, or the executable is big, you might have not installed it.\nIf you would like to change your packer or CMake is not detcting it, refer to the readme and remove this error (CMakeLists.txt, line 5).")

include(CheckIPOSupported)



add_subdirectory(SmallGlitter/Vendor/glm)
add_subdirectory(SmallGlitter/Vendor/glad)
find_package(SDL2 REQUIRED)

check_ipo_supported(RESULT result)
if(result)
   message(STATUS "IPO Supported! \nEnabling IPO for libraries...")
   set_property(TARGET glad PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
   set_property(TARGET glm PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
else()
   message( FATAL_ERROR "Damm bruh, looks like we got an unoptimised boi here\n(IPO is not supported on your platform!)" )

endif()


if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -Wextra -Wpedantic -std=c++11 -nodefaultlibs   -fomit-frame-pointer -lc -mfpmath=387 -mfancy-math-387 -fmerge-all-constants -fsingle-precision-constant  -fno-math-errno -Wall -ldl -ffast-math    -fno-unroll-loops -O3")
    if(NOT WIN32)
        set(GLAD_LIBRARIES dl)
    endif()
endif()

include_directories(SmallGlitter/Headers/
                    SmallGlitter/Vendor/glad/include/
                    SmallGlitter/Vendor/glfw/include/
                    SmallGlitter/Vendor/glm/
                    ${SDL2_INCLUDE_DIR}
                    ${SDL2_IMAGE_INCLUDE_DIR})



file(GLOB VENDORS_SOURCES SmallGlitter/Vendor/glad/src/glad.c)
file(GLOB PROJECT_HEADERS SmallGlitter/Headers/*.hpp)
file(GLOB PROJECT_SOURCES SmallGlitter/Sources/*.cpp)
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
if(result)
     message(STATUS "Enabling IPO for main executable...")
     set_property(TARGET smallglitter PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
     message(STATUS "IPO Enabled!")
endif()

target_link_libraries(${PROJECT_NAME}  glad glm SDL2 -lm -lc
                      ${GLFW_LIBRARIES} ${GLAD_LIBRARIES})

add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND chmod +x ../compress.sh && ../compress.sh smallglitter
    DEPENDS ${PROJECT_SHADERS})

