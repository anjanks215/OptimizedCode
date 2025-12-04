#!/bin/bash
# Build script for Optimized C++ Project

set -e  # Exit on error

echo "========================================"
echo "Optimized C++ Project Build Script"
echo "========================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[INFO]${NC} $1"
}

# Parse command line arguments
BUILD_TYPE="Release"
RUN_TESTS=false
RUN_APP=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --debug)
            BUILD_TYPE="Debug"
            shift
            ;;
        --test)
            RUN_TESTS=true
            shift
            ;;
        --run)
            RUN_APP=true
            shift
            ;;
        --help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --debug    Build in debug mode (default: release)"
            echo "  --test     Run tests after building"
            echo "  --run      Run application after building"
            echo "  --help     Show this help message"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

print_info "Build type: $BUILD_TYPE"
echo ""

# Create build directory
print_info "Creating build directory..."
mkdir -p build
cd build

# Configure with CMake
print_info "Configuring with CMake..."
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE .. || {
    print_error "CMake configuration failed"
    exit 1
}
print_success "Configuration complete"
echo ""

# Build
print_info "Building project..."
cmake --build . --config $BUILD_TYPE || {
    print_error "Build failed"
    exit 1
}
print_success "Build complete"
echo ""

# Run tests if requested
if [ "$RUN_TESTS" = true ]; then
    print_info "Running tests..."
    ctest --verbose --output-on-failure || {
        print_error "Tests failed"
        exit 1
    }
    print_success "All tests passed"
    echo ""
fi

# Run application if requested
if [ "$RUN_APP" = true ]; then
    print_info "Running application..."
    echo "========================================"
    ../bin/optimized_app || {
        print_error "Application failed"
        exit 1
    }
    echo "========================================"
    print_success "Application completed successfully"
    echo ""
fi

print_success "Build script completed successfully!"
echo ""
echo "To run the application: ./bin/optimized_app"
echo "To run tests: cd build && ctest --verbose"
echo ""