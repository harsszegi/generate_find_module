if (WIN32)
    set_property(TARGET GenICam::GCBase APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS GENICAM_NO_AUTO_IMPLIB)
    set_property(TARGET GenICam::GenApi APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS GENICAM_NO_AUTO_IMPLIB)
endif()
