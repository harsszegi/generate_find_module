include(CMakeFindDependencyMacro)

if (NOT MSVC)
  find_dependency(Threads REQUIRED)
  set_property(TARGET ASIO::asio APPEND PROPERTY INTERFACE_LINK_LIBRARIES Threads::Threads)
endif()

find_package(Boost COMPONENTS system)
set_property(TARGET ASIO::asio APPEND PROPERTY INTERFACE_LINK_LIBRARIES Boost::system)

if (MSVC)
  if (MSVC_VERSION LESS 1920)
    # Asio needs it when VS 2017 is used: https://github.com/chriskohlhoff/asio/issues/290#issuecomment-377727614
    set_property( TARGET ASIO::asio APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS _SILENCE_CXX17_ALLOCATOR_VOID_DEPRECATION_WARNING )
  endif()
endif()
