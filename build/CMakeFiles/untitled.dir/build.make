# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\develop\CMake\bin\cmake.exe

# The command to remove a file.
RM = D:\develop\CMake\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\develop\CPP_Phase3\CPP_Phase3_client

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\develop\CPP_Phase3\CPP_Phase3_client\build

# Include any dependencies generated for this target.
include CMakeFiles/untitled.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/untitled.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/untitled.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/untitled.dir/flags.make

untitled_autogen/EWIEGA46WW/qrc_qml.cpp: ../qml.qrc
untitled_autogen/EWIEGA46WW/qrc_qml.cpp: CMakeFiles/untitled_autogen.dir/AutoRcc_qml_EWIEGA46WW_Info.json
untitled_autogen/EWIEGA46WW/qrc_qml.cpp: ../qml/main.qml
untitled_autogen/EWIEGA46WW/qrc_qml.cpp: ../static/SourceHanSerifCN-Regular.otf
untitled_autogen/EWIEGA46WW/qrc_qml.cpp: D:/develop/Qt/5.12.2/mingw73_64/bin/rcc.exe
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Automatic RCC for qml.qrc"
	D:\develop\CMake\bin\cmake.exe -E cmake_autorcc D:/develop/CPP_Phase3/CPP_Phase3_client/build/CMakeFiles/untitled_autogen.dir/AutoRcc_qml_EWIEGA46WW_Info.json Debug

CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj: CMakeFiles/untitled.dir/flags.make
CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj: CMakeFiles/untitled.dir/includes_CXX.rsp
CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj: untitled_autogen/mocs_compilation.cpp
CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj: CMakeFiles/untitled.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj -MF CMakeFiles\untitled.dir\untitled_autogen\mocs_compilation.cpp.obj.d -o CMakeFiles\untitled.dir\untitled_autogen\mocs_compilation.cpp.obj -c D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\mocs_compilation.cpp

CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.i"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\mocs_compilation.cpp > CMakeFiles\untitled.dir\untitled_autogen\mocs_compilation.cpp.i

CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.s"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\mocs_compilation.cpp -o CMakeFiles\untitled.dir\untitled_autogen\mocs_compilation.cpp.s

CMakeFiles/untitled.dir/main.cpp.obj: CMakeFiles/untitled.dir/flags.make
CMakeFiles/untitled.dir/main.cpp.obj: CMakeFiles/untitled.dir/includes_CXX.rsp
CMakeFiles/untitled.dir/main.cpp.obj: ../main.cpp
CMakeFiles/untitled.dir/main.cpp.obj: CMakeFiles/untitled.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/untitled.dir/main.cpp.obj"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/untitled.dir/main.cpp.obj -MF CMakeFiles\untitled.dir\main.cpp.obj.d -o CMakeFiles\untitled.dir\main.cpp.obj -c D:\develop\CPP_Phase3\CPP_Phase3_client\main.cpp

CMakeFiles/untitled.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/untitled.dir/main.cpp.i"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\develop\CPP_Phase3\CPP_Phase3_client\main.cpp > CMakeFiles\untitled.dir\main.cpp.i

CMakeFiles/untitled.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/untitled.dir/main.cpp.s"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\develop\CPP_Phase3\CPP_Phase3_client\main.cpp -o CMakeFiles\untitled.dir\main.cpp.s

CMakeFiles/untitled.dir/client.cpp.obj: CMakeFiles/untitled.dir/flags.make
CMakeFiles/untitled.dir/client.cpp.obj: CMakeFiles/untitled.dir/includes_CXX.rsp
CMakeFiles/untitled.dir/client.cpp.obj: ../client.cpp
CMakeFiles/untitled.dir/client.cpp.obj: CMakeFiles/untitled.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/untitled.dir/client.cpp.obj"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/untitled.dir/client.cpp.obj -MF CMakeFiles\untitled.dir\client.cpp.obj.d -o CMakeFiles\untitled.dir\client.cpp.obj -c D:\develop\CPP_Phase3\CPP_Phase3_client\client.cpp

CMakeFiles/untitled.dir/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/untitled.dir/client.cpp.i"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\develop\CPP_Phase3\CPP_Phase3_client\client.cpp > CMakeFiles\untitled.dir\client.cpp.i

CMakeFiles/untitled.dir/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/untitled.dir/client.cpp.s"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\develop\CPP_Phase3\CPP_Phase3_client\client.cpp -o CMakeFiles\untitled.dir\client.cpp.s

CMakeFiles/untitled.dir/clientmodel.cpp.obj: CMakeFiles/untitled.dir/flags.make
CMakeFiles/untitled.dir/clientmodel.cpp.obj: CMakeFiles/untitled.dir/includes_CXX.rsp
CMakeFiles/untitled.dir/clientmodel.cpp.obj: ../clientmodel.cpp
CMakeFiles/untitled.dir/clientmodel.cpp.obj: CMakeFiles/untitled.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/untitled.dir/clientmodel.cpp.obj"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/untitled.dir/clientmodel.cpp.obj -MF CMakeFiles\untitled.dir\clientmodel.cpp.obj.d -o CMakeFiles\untitled.dir\clientmodel.cpp.obj -c D:\develop\CPP_Phase3\CPP_Phase3_client\clientmodel.cpp

CMakeFiles/untitled.dir/clientmodel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/untitled.dir/clientmodel.cpp.i"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\develop\CPP_Phase3\CPP_Phase3_client\clientmodel.cpp > CMakeFiles\untitled.dir\clientmodel.cpp.i

CMakeFiles/untitled.dir/clientmodel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/untitled.dir/clientmodel.cpp.s"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\develop\CPP_Phase3\CPP_Phase3_client\clientmodel.cpp -o CMakeFiles\untitled.dir\clientmodel.cpp.s

CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj: CMakeFiles/untitled.dir/flags.make
CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj: CMakeFiles/untitled.dir/includes_CXX.rsp
CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj: untitled_autogen/EWIEGA46WW/qrc_qml.cpp
CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj: CMakeFiles/untitled.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj -MF CMakeFiles\untitled.dir\untitled_autogen\EWIEGA46WW\qrc_qml.cpp.obj.d -o CMakeFiles\untitled.dir\untitled_autogen\EWIEGA46WW\qrc_qml.cpp.obj -c D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\EWIEGA46WW\qrc_qml.cpp

CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.i"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\EWIEGA46WW\qrc_qml.cpp > CMakeFiles\untitled.dir\untitled_autogen\EWIEGA46WW\qrc_qml.cpp.i

CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.s"
	D:\mingw-w64\x86_64-8.1.0-win32-seh-rt_v6-rev0\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\develop\CPP_Phase3\CPP_Phase3_client\build\untitled_autogen\EWIEGA46WW\qrc_qml.cpp -o CMakeFiles\untitled.dir\untitled_autogen\EWIEGA46WW\qrc_qml.cpp.s

# Object files for target untitled
untitled_OBJECTS = \
"CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj" \
"CMakeFiles/untitled.dir/main.cpp.obj" \
"CMakeFiles/untitled.dir/client.cpp.obj" \
"CMakeFiles/untitled.dir/clientmodel.cpp.obj" \
"CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj"

# External object files for target untitled
untitled_EXTERNAL_OBJECTS =

untitled.exe: CMakeFiles/untitled.dir/untitled_autogen/mocs_compilation.cpp.obj
untitled.exe: CMakeFiles/untitled.dir/main.cpp.obj
untitled.exe: CMakeFiles/untitled.dir/client.cpp.obj
untitled.exe: CMakeFiles/untitled.dir/clientmodel.cpp.obj
untitled.exe: CMakeFiles/untitled.dir/untitled_autogen/EWIEGA46WW/qrc_qml.cpp.obj
untitled.exe: CMakeFiles/untitled.dir/build.make
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libQt5Quickd.a
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libQt5Qmld.a
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libQt5Networkd.a
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libQt5Guid.a
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libQt5Cored.a
untitled.exe: D:/develop/Qt/5.12.2/mingw73_64/lib/libqtmaind.a
untitled.exe: CMakeFiles/untitled.dir/linklibs.rsp
untitled.exe: CMakeFiles/untitled.dir/objects1.rsp
untitled.exe: CMakeFiles/untitled.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable untitled.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\untitled.dir\link.txt --verbose=$(VERBOSE)
	C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noprofile -executionpolicy Bypass -file D:/develop/vcpkg/scripts/buildsystems/msbuild/applocal.ps1 -targetBinary D:/develop/CPP_Phase3/CPP_Phase3_client/build/untitled.exe -installedDir D:/develop/vcpkg/installed/x64-windows/debug/bin -OutVariable out

# Rule to build all files generated by this target.
CMakeFiles/untitled.dir/build: untitled.exe
.PHONY : CMakeFiles/untitled.dir/build

CMakeFiles/untitled.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\untitled.dir\cmake_clean.cmake
.PHONY : CMakeFiles/untitled.dir/clean

CMakeFiles/untitled.dir/depend: untitled_autogen/EWIEGA46WW/qrc_qml.cpp
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\develop\CPP_Phase3\CPP_Phase3_client D:\develop\CPP_Phase3\CPP_Phase3_client D:\develop\CPP_Phase3\CPP_Phase3_client\build D:\develop\CPP_Phase3\CPP_Phase3_client\build D:\develop\CPP_Phase3\CPP_Phase3_client\build\CMakeFiles\untitled.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/untitled.dir/depend
