if (CMAKE_SYSTEM_NAME STREQUAL "Linux" AND CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
  include(CMakeFindDependencyMacro)
  find_package(Fontconfig MODULE REQUIRED)
  find_package(libxml2 CONFIG REQUIRED)
  set_property(TARGET Skia::skia APPEND PROPERTY INTERFACE_LINK_LIBRARIES Fontconfig::Fontconfig LibXml2::LibXml2)
endif()

if (NOT CMAKE_SYSTEM_PROCESSOR STREQUAL "wasm" AND NOT CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
  set_property(TARGET Skia::skshaper APPEND PROPERTY INTERFACE_LINK_LIBRARIES Skia::skia)
  set_property(TARGET Skia::skunicode APPEND PROPERTY INTERFACE_LINK_LIBRARIES Skia::skia)
endif()


# GOD Skia is lame, it has #include <include/xxxx> all over the place
set_property(TARGET Skia::skia APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${Skia_ROOT}")
set_property(TARGET Skia::skshaper APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${Skia_ROOT}")
set_property(TARGET Skia::skunicode APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${Skia_ROOT}")
