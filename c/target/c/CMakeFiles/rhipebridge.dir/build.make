# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/2.8.8/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/2.8.8/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake/2.8.8/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sguha/dev/rhipe2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sguha/dev/rhipe2/c/target

# Include any dependencies generated for this target.
include c/CMakeFiles/rhipebridge.dir/depend.make

# Include the progress variables for this target.
include c/CMakeFiles/rhipebridge.dir/progress.make

# Include the compile flags for this target's objects.
include c/CMakeFiles/rhipebridge.dir/flags.make

c/CMakeFiles/rhipebridge.dir/engine.cc.o: c/CMakeFiles/rhipebridge.dir/flags.make
c/CMakeFiles/rhipebridge.dir/engine.cc.o: ../engine.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/sguha/dev/rhipe2/c/target/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object c/CMakeFiles/rhipebridge.dir/engine.cc.o"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/rhipebridge.dir/engine.cc.o -c /Users/sguha/dev/rhipe2/c/engine.cc

c/CMakeFiles/rhipebridge.dir/engine.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rhipebridge.dir/engine.cc.i"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/sguha/dev/rhipe2/c/engine.cc > CMakeFiles/rhipebridge.dir/engine.cc.i

c/CMakeFiles/rhipebridge.dir/engine.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rhipebridge.dir/engine.cc.s"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/sguha/dev/rhipe2/c/engine.cc -o CMakeFiles/rhipebridge.dir/engine.cc.s

c/CMakeFiles/rhipebridge.dir/engine.cc.o.requires:
.PHONY : c/CMakeFiles/rhipebridge.dir/engine.cc.o.requires

c/CMakeFiles/rhipebridge.dir/engine.cc.o.provides: c/CMakeFiles/rhipebridge.dir/engine.cc.o.requires
	$(MAKE) -f c/CMakeFiles/rhipebridge.dir/build.make c/CMakeFiles/rhipebridge.dir/engine.cc.o.provides.build
.PHONY : c/CMakeFiles/rhipebridge.dir/engine.cc.o.provides

c/CMakeFiles/rhipebridge.dir/engine.cc.o.provides.build: c/CMakeFiles/rhipebridge.dir/engine.cc.o

c/CMakeFiles/rhipebridge.dir/io.cc.o: c/CMakeFiles/rhipebridge.dir/flags.make
c/CMakeFiles/rhipebridge.dir/io.cc.o: ../io.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/sguha/dev/rhipe2/c/target/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object c/CMakeFiles/rhipebridge.dir/io.cc.o"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/rhipebridge.dir/io.cc.o -c /Users/sguha/dev/rhipe2/c/io.cc

c/CMakeFiles/rhipebridge.dir/io.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rhipebridge.dir/io.cc.i"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/sguha/dev/rhipe2/c/io.cc > CMakeFiles/rhipebridge.dir/io.cc.i

c/CMakeFiles/rhipebridge.dir/io.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rhipebridge.dir/io.cc.s"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/sguha/dev/rhipe2/c/io.cc -o CMakeFiles/rhipebridge.dir/io.cc.s

c/CMakeFiles/rhipebridge.dir/io.cc.o.requires:
.PHONY : c/CMakeFiles/rhipebridge.dir/io.cc.o.requires

c/CMakeFiles/rhipebridge.dir/io.cc.o.provides: c/CMakeFiles/rhipebridge.dir/io.cc.o.requires
	$(MAKE) -f c/CMakeFiles/rhipebridge.dir/build.make c/CMakeFiles/rhipebridge.dir/io.cc.o.provides.build
.PHONY : c/CMakeFiles/rhipebridge.dir/io.cc.o.provides

c/CMakeFiles/rhipebridge.dir/io.cc.o.provides.build: c/CMakeFiles/rhipebridge.dir/io.cc.o

c/CMakeFiles/rhipebridge.dir/misc.cc.o: c/CMakeFiles/rhipebridge.dir/flags.make
c/CMakeFiles/rhipebridge.dir/misc.cc.o: ../misc.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/sguha/dev/rhipe2/c/target/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object c/CMakeFiles/rhipebridge.dir/misc.cc.o"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/rhipebridge.dir/misc.cc.o -c /Users/sguha/dev/rhipe2/c/misc.cc

c/CMakeFiles/rhipebridge.dir/misc.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/rhipebridge.dir/misc.cc.i"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/sguha/dev/rhipe2/c/misc.cc > CMakeFiles/rhipebridge.dir/misc.cc.i

c/CMakeFiles/rhipebridge.dir/misc.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/rhipebridge.dir/misc.cc.s"
	cd /Users/sguha/dev/rhipe2/c/target/c && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/sguha/dev/rhipe2/c/misc.cc -o CMakeFiles/rhipebridge.dir/misc.cc.s

c/CMakeFiles/rhipebridge.dir/misc.cc.o.requires:
.PHONY : c/CMakeFiles/rhipebridge.dir/misc.cc.o.requires

c/CMakeFiles/rhipebridge.dir/misc.cc.o.provides: c/CMakeFiles/rhipebridge.dir/misc.cc.o.requires
	$(MAKE) -f c/CMakeFiles/rhipebridge.dir/build.make c/CMakeFiles/rhipebridge.dir/misc.cc.o.provides.build
.PHONY : c/CMakeFiles/rhipebridge.dir/misc.cc.o.provides

c/CMakeFiles/rhipebridge.dir/misc.cc.o.provides.build: c/CMakeFiles/rhipebridge.dir/misc.cc.o

# Object files for target rhipebridge
rhipebridge_OBJECTS = \
"CMakeFiles/rhipebridge.dir/engine.cc.o" \
"CMakeFiles/rhipebridge.dir/io.cc.o" \
"CMakeFiles/rhipebridge.dir/misc.cc.o"

# External object files for target rhipebridge
rhipebridge_EXTERNAL_OBJECTS =

c/librhipebridge.dylib: c/CMakeFiles/rhipebridge.dir/engine.cc.o
c/librhipebridge.dylib: c/CMakeFiles/rhipebridge.dir/io.cc.o
c/librhipebridge.dylib: c/CMakeFiles/rhipebridge.dir/misc.cc.o
c/librhipebridge.dylib: c/CMakeFiles/rhipebridge.dir/build.make
c/librhipebridge.dylib: /usr/lib/libz.dylib
c/librhipebridge.dylib: /usr/local/lib/libprotobuf.dylib
c/librhipebridge.dylib: c/CMakeFiles/rhipebridge.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library librhipebridge.dylib"
	cd /Users/sguha/dev/rhipe2/c/target/c && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rhipebridge.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
c/CMakeFiles/rhipebridge.dir/build: c/librhipebridge.dylib
.PHONY : c/CMakeFiles/rhipebridge.dir/build

c/CMakeFiles/rhipebridge.dir/requires: c/CMakeFiles/rhipebridge.dir/engine.cc.o.requires
c/CMakeFiles/rhipebridge.dir/requires: c/CMakeFiles/rhipebridge.dir/io.cc.o.requires
c/CMakeFiles/rhipebridge.dir/requires: c/CMakeFiles/rhipebridge.dir/misc.cc.o.requires
.PHONY : c/CMakeFiles/rhipebridge.dir/requires

c/CMakeFiles/rhipebridge.dir/clean:
	cd /Users/sguha/dev/rhipe2/c/target/c && $(CMAKE_COMMAND) -P CMakeFiles/rhipebridge.dir/cmake_clean.cmake
.PHONY : c/CMakeFiles/rhipebridge.dir/clean

c/CMakeFiles/rhipebridge.dir/depend:
	cd /Users/sguha/dev/rhipe2/c/target && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sguha/dev/rhipe2 /Users/sguha/dev/rhipe2/c /Users/sguha/dev/rhipe2/c/target /Users/sguha/dev/rhipe2/c/target/c /Users/sguha/dev/rhipe2/c/target/c/CMakeFiles/rhipebridge.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : c/CMakeFiles/rhipebridge.dir/depend

