#Change this if you need to target a specific CMake version
cmake_minimum_required(VERSION 2.6)

# Enable debug symbols by default
# must be done before project() statement
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the type of build (Debug or Release)" FORCE)
endif()
# (you can also set it on the command line: -D CMAKE_BUILD_TYPE=Release)

project(YT_DVC)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/../bin)

# Set version information in a config.h file
set(YT_DVC_VERSION_MAJOR 1)
set(YT_DVC_VERSION_MINOR 0)
set(YT_DVC_APP_NAME "Leccion 2")

configure_file(
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_SOURCE_DIR}/config.h"
  )
include_directories("${PROJECT_BINARY_DIR}")

# Define sources and executable
set(EXECUTABLE_NAME "yt_dvc")
file(GLOB sourceFiles "${PROJECT_SOURCE_DIR}/*.cpp"
                      "${PROJECT_SOURCE_DIR}/*.h")
add_executable(${EXECUTABLE_NAME} ${sourceFiles})

# Detect and add SFML
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules" ${CMAKE_MODULE_PATH})
#Find any version 2.X of SFML
#See the FindSFML.cmake file for additional details and instructions
#If SFML is in a non-standard path, invoke with -DSFML_ROOT=/path/to/sfml

find_package(SFML 2 REQUIRED network audio graphics window system)
if(SFML_FOUND)
  include_directories(${SFML_INCLUDE_DIR})
  target_link_libraries(${EXECUTABLE_NAME} ${SFML_LIBRARIES} ${SFML_DEPENDENCIES})
endif()

# Install target
install(TARGETS ${EXECUTABLE_NAME} DESTINATION bin)

# CPack packaging
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/COPYING")
set(CPACK_PACKAGE_VERSION_MAJOR "${myproject_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${myproject_VERSION_MINOR}")
include(CPack)

if(WIN32)
  add_custom_command(TARGET yt_dvc POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy_directory
                     "${PROJECT_SOURCE_DIR}/../../ext/lib/SFML/$<CONFIG>/"
                     "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>/")
endif()
