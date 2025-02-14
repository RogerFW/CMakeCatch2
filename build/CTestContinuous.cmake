#/*============================================================================
#
#  MYPROJECT: A software package for whatever.
#
#  Copyright (c) University College London (UCL). All rights reserved.
#
#  This software is distributed WITHOUT ANY WARRANTY; without even
#  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#  PURPOSE.
#
#  See LICENSE.txt in the top level directory for details.
#
#============================================================================*/

set(CTEST_SOURCE_DIRECTORY "/home/roger/C++/CMakeCatch2")
set(CTEST_BINARY_DIRECTORY "/home/roger/C++/CMakeCatch2/build")
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_BUILD_NAME "")
set(CTEST_GIT_COMMAND "")
set(MYPROJECT_BRANCH_NAME "")

find_program(HOSTNAME_CMD NAMES hostname)
exec_program("${HOSTNAME_CMD}" ARGS OUTPUT_VARIABLE HOSTNAME)
set(CTEST_SITE  "${HOSTNAME}${CTEST_SITE_EXT}")

#
# This macro is to find the branch whose tip is the commit to test.
#
macro(GetBranchName branch_name_var)

  execute_process(COMMAND "${CTEST_GIT_COMMAND}" branch -r --contains HEAD --merged HEAD
    WORKING_DIRECTORY ${CTEST_SOURCE_DIRECTORY}
    ERROR_VARIABLE GIT_error
    OUTPUT_VARIABLE remote_ref_names)

  if(NOT ${GIT_error} EQUAL 0)
    message(SEND_ERROR "Command '${CTEST_GIT_COMMAND} branch -r --contains HEAD --merged' failed with output:\n${GIT_error}")
  endif()

  # message("remote refs: ${remote_ref_names}")

  if("${remote_ref_names}" MATCHES "origin/([^ \n]*)\n")
    set(branch_name ${CMAKE_MATCH_1})
  else()
    message("Branch has not been pushed to origin. Test report will be submitted to the Continuous group.")
  endif()

  set(${branch_name_var} ${branch_name})

endmacro()


#
# This macro gets the first few digits of the current commit hash.
#
macro(GetCommitHash commit_hash_var)

  execute_process(COMMAND "${CTEST_GIT_COMMAND}" log -n 1 --pretty=format:%h HEAD
    WORKING_DIRECTORY ${CTEST_SOURCE_DIRECTORY}
    ERROR_VARIABLE GIT_error
    OUTPUT_VARIABLE ${commit_hash_var}
    OUTPUT_STRIP_TRAILING_WHITESPACE)

  if(NOT ${GIT_error} EQUAL 0)
    message(SEND_ERROR "Command \"${CTEST_GIT_COMMAND} log -n 1 --pretty=format:\"%h\" HEAD in directory ${CTEST_SOURCE_DIRECTORY} failed with output:\n${GIT_error}")
  endif()

endmacro()


#
# This macro gets the first few digits of the current commit hash.
#
macro(GetNumberOfCpuCores cpu_cores_var)

  if(DEFINED PARALLEL_LEVEL)
    set(cpu_cores ${PARALLEL_LEVEL})
  else()
    set(cpu_cores 1)

    set(cpuinfo_file "/proc/cpuinfo")
    if(EXISTS "${cpuinfo_file}")
      file(STRINGS "${cpuinfo_file}" procs REGEX "^processor.: [0-9]+$")
      list(LENGTH procs cpu_cores)
    endif()

    if(APPLE)
      find_program(cmd_sysctl "sysctl")
      if(cmd_sysctl)
        execute_process(COMMAND "${cmd_sysctl}" -n hw.ncpu OUTPUT_VARIABLE cpu_cores OUTPUT_STRIP_TRAILING_WHITESPACE)
      endif()
    endif()

    if(WIN32)
      set(cpu_cores "$ENV{NUMBER_OF_PROCESSORS}")
    endif()
  endif()

  set(${cpu_cores_var} ${cpu_cores})

endmacro()


#
# This macro gets the build name that is the compiler version plus the commit hash.
#
macro(GetBuildName build_name_var)

  if (CTEST_BUILD_NAME MATCHES "(.*)-${MYPROJECT_BRANCH_NAME}-${commit_hash}-(Rel|Dbg)")
    set(compiler_name ${CMAKE_MATCH_1})
    set(build_type ${CMAKE_MATCH_2})
    set(build_name "${compiler_name}-${commit_hash}-${build_type}")
  else()
    set(build_name "${commit_hash}")
  endif()

  set(${build_name_var} ${build_name})

endmacro()

GetBranchName(branch_name)
GetCommitHash(commit_hash)
GetBuildName(build_name)
GetNumberOfCpuCores(cpu_cores)

if (NOT ${branch_name} STREQUAL "")
  set(group_name ${branch_name})
else()
  set(group_name "Continuous")
endif()

message("Remote branch: ${branch_name}")
message("Group: ${group_name}")
message("Build name: ${build_name}")
message("Threads: ${cpu_cores}")

set(CTEST_BUILD_NAME ${build_name})

if ("${CTEST_CMAKE_GENERATOR}" STREQUAL "Unix Makefiles")
  set(CTEST_BUILD_FLAGS "-j ${cpu_cores}")
endif()

set(PARALLEL_LEVEL ${cpu_cores})

ctest_start(Continuous TRACK ${group_name})
ctest_build()
ctest_test(EXCLUDE "${tests_to_exclude}" RETURN_VALUE exitCode)
ctest_submit()

if (exitCode)
  message(SEND_ERROR "Some unit tests failed. CTest exit code: ${exitCode}")
endif()
