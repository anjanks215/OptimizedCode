# CMakeLists.txt for Optimized C++ Project
# Minimum CMake version required
cmake_minimum_required(VERSION 3.14)

# Project name and version
project(OptimizedCppProject VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard to C++17 (modern features)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler flags for optimization and warnings
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")
    set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -march=native")
elseif(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    set(CMAKE_CXX_FLAGS_RELEASE "/O2 /DNDEBUG")
endif()

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/include)

# Source files
set(SOURCES
    src/StringUtils.cpp
    src/ArrayUtils.cpp
    src/main.cpp
)

# Header files
set(HEADERS
    include/StringUtils.hpp
    include/ArrayUtils.hpp
)

# Create executable
add_executable(optimized_app ${SOURCES} ${HEADERS})

# Create static library
add_library(utils_static STATIC
    src/StringUtils.cpp
    src/ArrayUtils.cpp
)

# Set output directories
set_target_properties(optimized_app PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin
)

set_target_properties(utils_static PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/libs
)

# Enable testing
enable_testing()

# Add tests subdirectory if it exists
if(EXISTS ${PROJECT_SOURCE_DIR}/tests)
    add_subdirectory(tests)
endif()

# Installation rules
install(TARGETS optimized_app
    RUNTIME DESTINATION bin
)

install(TARGETS utils_static
    ARCHIVE DESTINATION lib
)

install(FILES ${HEADERS}
    DESTINATION include
)

# Print configuration summary
message(STATUS "")
message(STATUS "Configuration Summary:")
message(STATUS "  Project: ${PROJECT_NAME} ${PROJECT_VERSION}")
message(STATUS "  C++ Standard: ${CMAKE_CXX_STANDARD}")
message(STATUS "  Build Type: ${CMAKE_BUILD_TYPE}")
message(STATUS "  Compiler: ${CMAKE_CXX_COMPILER_ID}")
message(STATUS "  Compiler Flags: ${CMAKE_CXX_FLAGS}")
message(STATUS "")