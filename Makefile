# Makefile for Optimized C++ Project
# Alternative build system to CMake

# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -I./include
CXXFLAGS_DEBUG := -g -O0
CXXFLAGS_RELEASE := -O3 -DNDEBUG -march=native

# Directories
SRC_DIR := src
INC_DIR := include
BUILD_DIR := build
BIN_DIR := bin
LIB_DIR := libs
TEST_DIR := tests

# Source files
SOURCES := $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.obj,$(SOURCES))
MAIN_OBJ := $(BUILD_DIR)/main.obj
LIB_OBJECTS := $(filter-out $(MAIN_OBJ),$(OBJECTS))

# Targets
TARGET := $(BIN_DIR)/optimized_app
STATIC_LIB := $(LIB_DIR)/libutils.a

# Default target
.PHONY: all
all: release

# Release build
.PHONY: release
release: CXXFLAGS += $(CXXFLAGS_RELEASE)
release: directories $(TARGET) $(STATIC_LIB)
	@echo "Release build complete!"

# Debug build
.PHONY: debug
debug: CXXFLAGS += $(CXXFLAGS_DEBUG)
debug: directories $(TARGET) $(STATIC_LIB)
	@echo "Debug build complete!"

# Create directories
.PHONY: directories
directories:
	@mkdir -p $(BUILD_DIR) $(BIN_DIR) $(LIB_DIR)

# Build executable
$(TARGET): $(OBJECTS)
	@echo "Linking executable: $@"
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build static library
$(STATIC_LIB): $(LIB_OBJECTS)
	@echo "Creating static library: $@"
	ar rcs $@ $^

# Compile source files
$(BUILD_DIR)/%.obj: $(SRC_DIR)/%.cpp
	@echo "Compiling: $<"
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(LIB_DIR)
	@echo "Clean complete!"

# Run the application
.PHONY: run
run: release
	@echo "Running application..."
	./$(TARGET)

# Run tests
.PHONY: test
test:
	@echo "Running tests..."
	@if [ -d $(TEST_DIR) ]; then \
		$(MAKE) -C $(TEST_DIR); \
	else \
		echo "No tests directory found."; \
	fi

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all        - Build release version (default)"
	@echo "  release    - Build optimized release version"
	@echo "  debug      - Build debug version with symbols"
	@echo "  clean      - Remove all build artifacts"
	@echo "  run        - Build and run the application"
	@echo "  test       - Run unit tests"
	@echo "  help       - Show this help message"

# Dependencies
-include $(OBJECTS:.obj=.d)

$(BUILD_DIR)/%.d: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	@$(CXX) $(CXXFLAGS) -MM -MT $(BUILD_DIR)/$*.obj $< > $@