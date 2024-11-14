include(CMakeFindDependencyMacro)
find_package(Urcu MODULE REQUIRED)
set_property(TARGET LTTngUST::lttng-ust APPEND PROPERTY INTERFACE_LINK_LIBRARIES LTTngUST::lttng-ust-tracepoint Urcu::bp Urcu::cds ${CMAKE_DL_LIBS})
