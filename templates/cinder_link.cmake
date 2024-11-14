include(CMakeFindDependencyMacro)

if (NOT CMAKE_SYSTEM_PROCESSOR STREQUAL "wasm" AND NOT CMAKE_SYSTEM_NAME STREQUAL "Emscripten")
  find_package(Boost COMPONENTS filesystem)
  set_property(TARGET Cinder::cinder APPEND PROPERTY INTERFACE_LINK_LIBRARIES Boost::filesystem)
endif()

if (WIN32)
  find_dependency(angle CONFIG)
  find_dependency(ZLIB MODULE)
  set_property(TARGET Cinder::cinder APPEND PROPERTY INTERFACE_LINK_LIBRARIES angle::GLESv2 angle::EGL ZLIB::ZLIB)
endif()

if (UNIX)
  find_dependency(Fontconfig MODULE)
  find_dependency(ZLIB MODULE)
  find_dependency(PNG MODULE)
  find_dependency(Brotli MODULE)
  find_dependency(CURL CONFIG)
  find_dependency(Libssh2 CONFIG)
  find_dependency(freetype CONFIG)
  find_dependency(libxml2 CONFIG)

  set_property(TARGET Cinder::cinder APPEND PROPERTY INTERFACE_LINK_LIBRARIES 
    OpenGL GLX X11 Xext Xcursor Xinerama Xrandr Xi 
    Fontconfig::Fontconfig
    freetype
    CURL::libcurl Brotli::brotlicommon Brotli::brotlidec 
    ZLIB::ZLIB PNG::PNG
    LibXml2::LibXml2
  )
endif()
