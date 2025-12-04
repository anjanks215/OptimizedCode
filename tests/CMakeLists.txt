# CMakeLists.txt for tests

# Test executables
add_executable(test_string_utils test_string_utils.cpp)
add_executable(test_array_utils test_array_utils.cpp)

# Link against the static library
target_link_libraries(test_string_utils utils_static)
target_link_libraries(test_array_utils utils_static)

# Add tests to CTest
add_test(NAME StringUtilsTest COMMAND test_string_utils)
add_test(NAME ArrayUtilsTest COMMAND test_array_utils)

# Set test output directory
set_target_properties(test_string_utils test_array_utils PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin/tests
)