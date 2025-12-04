/**
 * @file test_string_utils.cpp
 * @brief Unit tests for StringUtils
 * @author Senior Software Engineer
 * @date 2025
 */

#include "StringUtils.hpp"
#include <cassert>
#include <iostream>

void test_duplicate_string_basic()
{
    std::string result = utils::duplicateString("Hello");
    assert(result == "Hello");
    std::cout << "[PASS] test_duplicate_string_basic\n";
}

void test_duplicate_string_empty()
{
    std::string result = utils::duplicateString("");
    assert(result.empty());
    std::cout << "[PASS] test_duplicate_string_empty\n";
}

void test_duplicate_string_long()
{
    std::string input = "This is a very long string to test memory management";
    std::string result = utils::duplicateString(input);
    assert(result == input);
    std::cout << "[PASS] test_duplicate_string_long\n";
}

int main()
{
    std::cout << "Running StringUtils tests...\n";
    
    test_duplicate_string_basic();
    test_duplicate_string_empty();
    test_duplicate_string_long();
    
    std::cout << "All StringUtils tests passed!\n";
    return 0;
}