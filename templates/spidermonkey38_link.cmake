include(CMakeFindDependencyMacro)
if(Spidermonkey38_USE_STATIC_LIBS)
  set(STATIC_POSTFIX "-static")
endif()

set_property(TARGET Spidermonkey::js${STATIC_POSTFIX} APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${Spidermonkey38_ROOT}/include/mozjs-38")

set_property(TARGET Spidermonkey::js${STATIC_POSTFIX} APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS MOZ_JS_VER=38)

if (WIN32)
  set_property(TARGET Spidermonkey::js${STATIC_POSTFIX} APPEND PROPERTY INTERFACE_LINK_LIBRARIES 
    psapi winmm Ws2_32
    Spidermonkey::nspr${STATIC_POSTFIX}
    Spidermonkey::plc${STATIC_POSTFIX}
    Spidermonkey::plds${STATIC_POSTFIX}
  )
endif()