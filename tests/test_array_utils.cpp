/**
 * @file test_array_utils.cpp
 * @brief Unit tests for ArrayUtils
 * @author Senior Software Engineer
 * @date 2025
 */

#include "ArrayUtils.hpp"
#include <cassert>
#include <iostream>

void test_create_array_basic()
{
    std::vector<int> arr = utils::createArray(5);
    assert(arr.size() == 5);
    assert(arr[0] == 0);
    assert(arr[1] == 3);
    assert(arr[2] == 6);
    assert(arr[3] == 9);
    assert(arr[4] == 12);
    std::cout << "[PASS] test_create_array_basic\n";
}

void test_create_array_empty()
{
    std::vector<int> arr = utils::createArray(0);
    assert(arr.empty());
    std::cout << "[PASS] test_create_array_empty\n";
}

void test_compute_sum_basic()
{
    std::vector<int> arr = utils::createArray(50);
    int64_t sum = utils::computeSum(arr);
    // Sum = 0 + 3 + 6 + ... + 147 = 3 * (0 + 1 + 2 + ... + 49)
    // = 3 * (49 * 50 / 2) = 3 * 1225 = 3675
    assert(sum == 3675);
    std::cout << "[PASS] test_compute_sum_basic\n";
}

void test_compute_sum_empty()
{
    std::vector<int> arr;
    int64_t sum = utils::computeSum(arr);
    assert(sum == 0);
    std::cout << "[PASS] test_compute_sum_empty\n";
}

void test_compute_sum_single()
{
    std::vector<int> arr = {42};
    int64_t sum = utils::computeSum(arr);
    assert(sum == 42);
    std::cout << "[PASS] test_compute_sum_single\n";
}

int main()
{
    std::cout << "Running ArrayUtils tests...\n";
    
    test_create_array_basic();
    test_create_array_empty();
    test_compute_sum_basic();
    test_compute_sum_empty();
    test_compute_sum_single();
    
    std::cout << "All ArrayUtils tests passed!\n";
    return 0;
}
