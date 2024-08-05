find_package(Libnghttp3 MODULE REQUIRED)
include(CMakeFindDependencyMacro)
find_dependency(BoringSSL CONFIG)
set_property(TARGET Libngtcp2::Libngtcp2 APPEND PROPERTY INTERFACE_LINK_LIBRARIES Libnghttp3::Libnghttp3)
# Forcefully static
set_property( TARGET Libngtcp2::Libngtcp2 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS NGTCP2_STATICLIB)
