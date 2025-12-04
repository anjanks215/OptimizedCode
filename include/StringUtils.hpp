/**
 * @file StringUtils.hpp
 * @brief String utility functions using modern C++ practices
 * @author Senior Software Engineer
 * @date 2025
 * 
 * This file provides optimized string manipulation utilities using
 * modern C++ features including std::string, move semantics, and RAII.
 */

#ifndef STRING_UTILS_HPP
#define STRING_UTILS_HPP

#include <string>
#include <string_view>

namespace utils
{

/**
 * @brief Duplicates a string using modern C++ string class
 * @param s Input string view (zero-copy reference)
 * @return std::string Owned string copy with automatic memory management
 * 
 * Benefits:
 * - Automatic memory management via RAII
 * - No manual allocation/deallocation
 * - Exception-safe
 * - Move semantics enabled for efficient returns
 */
std::string duplicateString(std::string_view s);

} // namespace utils

#endif // STRING_UTILS_HPP