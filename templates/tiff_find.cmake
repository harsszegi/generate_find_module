if (WIN32)
  if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(Tiff_LIB_SUFFIX "d")
  endif()
endif()
