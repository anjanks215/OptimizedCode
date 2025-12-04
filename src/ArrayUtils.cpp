/**
 * @file ArrayUtils.cpp
 * @brief Implementation of array utility functions
 * @author Senior Software Engineer
 * @date 2025
 */

#include "ArrayUtils.hpp"
#include <numeric>

namespace utils
{

std::vector<int> createArray(int n)
{
    // Pre-allocate memory to avoid multiple reallocations
    std::vector<int> arr;
    arr.reserve(n);
    
    // Use range-based construction for better performance
    for (int i = 0; i < n; ++i)
    {
        arr.push_back(i * 3);
    }
    
    // Return value optimization (RVO) eliminates copy
    return arr;
}

int64_t computeSum(const std::vector<int>& arr)
{
    // Use STL algorithm for optimized, vectorizable code
    // std::accumulate is compiler-friendly for optimization
    return std::accumulate(arr.begin(), arr.end(), int64_t{0});
}

} // namespace utils
