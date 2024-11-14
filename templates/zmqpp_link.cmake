include(CMakeFindDependencyMacro)
find_dependency(ZeroMQ CONFIG)
if(NOT Zmqpp_USE_STATIC_LIBS)
  set_property(TARGET Zmqpp::zmqpp APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzmq)
endif()

if (Zmqpp_USE_STATIC_LIBS)
  set_property(TARGET Zmqpp::zmqpp-static APPEND PROPERTY INTERFACE_LINK_LIBRARIES libzmq-static)
endif()
