# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/roger/C++/CMakeCatch2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/roger/C++/CMakeCatch2/build

# Include any dependencies generated for this target.
include Testing/CMakeFiles/mpBasicTest.dir/depend.make

# Include the progress variables for this target.
include Testing/CMakeFiles/mpBasicTest.dir/progress.make

# Include the compile flags for this target's objects.
include Testing/CMakeFiles/mpBasicTest.dir/flags.make

Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o: Testing/CMakeFiles/mpBasicTest.dir/flags.make
Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o: ../Testing/mpBasicTest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/roger/C++/CMakeCatch2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o -c /home/roger/C++/CMakeCatch2/Testing/mpBasicTest.cpp

Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.i"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/roger/C++/CMakeCatch2/Testing/mpBasicTest.cpp > CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.i

Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.s"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/roger/C++/CMakeCatch2/Testing/mpBasicTest.cpp -o CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.s

Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o: Testing/CMakeFiles/mpBasicTest.dir/flags.make
Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o: ../Testing/mpCatchMain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/roger/C++/CMakeCatch2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o -c /home/roger/C++/CMakeCatch2/Testing/mpCatchMain.cpp

Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.i"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/roger/C++/CMakeCatch2/Testing/mpCatchMain.cpp > CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.i

Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.s"
	cd /home/roger/C++/CMakeCatch2/build/Testing && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/roger/C++/CMakeCatch2/Testing/mpCatchMain.cpp -o CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.s

# Object files for target mpBasicTest
mpBasicTest_OBJECTS = \
"CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o" \
"CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o"

# External object files for target mpBasicTest
mpBasicTest_EXTERNAL_OBJECTS =

bin/mpBasicTest: Testing/CMakeFiles/mpBasicTest.dir/mpBasicTest.cpp.o
bin/mpBasicTest: Testing/CMakeFiles/mpBasicTest.dir/mpCatchMain.cpp.o
bin/mpBasicTest: Testing/CMakeFiles/mpBasicTest.dir/build.make
bin/mpBasicTest: bin/libmyproject.a
bin/mpBasicTest: Testing/CMakeFiles/mpBasicTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/roger/C++/CMakeCatch2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../bin/mpBasicTest"
	cd /home/roger/C++/CMakeCatch2/build/Testing && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mpBasicTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Testing/CMakeFiles/mpBasicTest.dir/build: bin/mpBasicTest

.PHONY : Testing/CMakeFiles/mpBasicTest.dir/build

Testing/CMakeFiles/mpBasicTest.dir/clean:
	cd /home/roger/C++/CMakeCatch2/build/Testing && $(CMAKE_COMMAND) -P CMakeFiles/mpBasicTest.dir/cmake_clean.cmake
.PHONY : Testing/CMakeFiles/mpBasicTest.dir/clean

Testing/CMakeFiles/mpBasicTest.dir/depend:
	cd /home/roger/C++/CMakeCatch2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/roger/C++/CMakeCatch2 /home/roger/C++/CMakeCatch2/Testing /home/roger/C++/CMakeCatch2/build /home/roger/C++/CMakeCatch2/build/Testing /home/roger/C++/CMakeCatch2/build/Testing/CMakeFiles/mpBasicTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Testing/CMakeFiles/mpBasicTest.dir/depend

