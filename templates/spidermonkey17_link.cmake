include(CMakeFindDependencyMacro)
find_package(ZLIB MODULE REQUIRED)
set_property(TARGET Spidermonkey::js APPEND PROPERTY INTERFACE_LINK_LIBRARIES ZLIB::ZLIB)

set_property(TARGET Spidermonkey::js APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${Spidermonkey17_ROOT}/include/js-17.0")

if (WIN32)
  set_property(TARGET Spidermonkey::js APPEND PROPERTY INTERFACE_LINK_LIBRARIES psapi winmm Ws2_32)
endif()