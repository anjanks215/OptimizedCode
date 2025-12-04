/**
 * @file StringUtils.cpp
 * @brief Implementation of string utility functions
 * @author Senior Software Engineer
 * @date 2025
 */

#include "StringUtils.hpp"

namespace utils
{

std::string duplicateString(std::string_view s)
{
    // Modern C++: std::string constructor handles memory allocation
    // RAII ensures automatic cleanup
    // Move semantics optimize the return (RVO/NRVO)
    return std::string(s);
}

} // namespace utils