# Derive GenICam target name
if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
  if (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86")
    set (GenICam_TARGET "Linux32_i86")
  elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
    set (GenICam_TARGET "Linux64_x64")
  elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
    set (GenICam_TARGET "Linux64_ARM")
  else ()
    message(ERROR "FindGenICam.cmake does not support CMAKE_SYSTEM_PROCESSOR = ${CMAKE_SYSTEM_PROCESSOR}")
    set(GenICam_TARGET "Unknown")
  endif ()
elseif (CMAKE_SYSTEM_NAME STREQUAL "Windows")
  if (CMAKE_SIZEOF_VOID_P EQUAL 4)
    set (GenICam_TARGET "Win32_i86")
  elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
    set (GenICam_TARGET "Win64_x64")
  else ()
    message(ERROR "FindGenICam.cmake does not support CMAKE_SIZEOF_VOID_P = ${CMAKE_SIZEOF_VOID_P}")
    set(GenICam_TARGET "Unknown")
  endif ()
else ()
  message(ERROR "FindGenICam.cmake does not support CMAKE_SYSTEM_NAME = ${CMAKE_SYSTEM_NAME}")
  set(GenICam_TARGET "Unknown")
endif ()

# Find library suffix
file(GLOB GenICam_sample_library_glob "${GenICam_ROOT}/bin/${GenICam_TARGET}/*GCBase_*")
list(GET GenICam_sample_library_glob 0 GenICam_sample_library_path)
get_filename_component(GenICam_LIB_SUFFIX "${GenICam_sample_library_path}" NAME)
# Remove "lib" prefix from basename (libGCBase_gcc48_v3_2.so -> GCBase_gcc48_v3_2.so)
string(REGEX REPLACE "^lib" "" GenICam_LIB_SUFFIX "${GenICam_LIB_SUFFIX}")
# Remove extension (GCBase_gcc48_v3_2.so -> GCBase_gcc48_v3_2, GCBase_MD_VC141_v3_2.dll -> GCBase_MD_VC141_v3_2)
string(REGEX REPLACE "\\..*$" "" GenICam_LIB_SUFFIX "${GenICam_LIB_SUFFIX}")
# Remove library name (GCBase_gcc48_v3_2 -> _gcc48_v3_2, GCBase_MD_VC141_v3_2 -> _MD_VC141_v3_2)
string(REGEX REPLACE "^GCBase" "" GenICam_LIB_SUFFIX "${GenICam_LIB_SUFFIX}")
unset(GenICam_sample_library_glob)
unset(GenICam_sample_library_path)

list(APPEND LIBRARY_SEARCH_PATHS
  ${GenICam_ROOT}/library/CPP/lib
)

list(APPEND LIBRARY_SEARCH_PATHS 
  ${GenICam_ROOT}/bin
)

set(FIND_LIBRARY_PATH_SUFFIXES
  PATH_SUFFIXES ${GenICam_TARGET}
)
