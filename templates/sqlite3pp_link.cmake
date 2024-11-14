include(CMakeFindDependencyMacro)
find_package(SQLite3 MODULE REQUIRED)
set_property(TARGET SQLite3pp::sqlite3pp APPEND PROPERTY INTERFACE_LINK_LIBRARIES SQLite::SQLite3)
