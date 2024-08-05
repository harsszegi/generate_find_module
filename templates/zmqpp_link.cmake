include(CMakeFindDependencyMacro)
find_dependency(ZeroMQ CONFIG)
set_property(TARGET Zmqpp::zmqpp APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzmq)
set_property(TARGET Zmqpp::zmqpp-static APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzmq-static)
