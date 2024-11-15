  # get version
  set(libssh2_version_file "${LIBSSH2_INCLUDE_DIR}/libssh2.h")

  if(EXISTS "${libssh2_version_file}")
    file(STRINGS "${libssh2_version_file}" libssh2_version_major_string
         REGEX "^[\t ]*#define[\t ]+LIBSSH2_VERSION_MAJOR[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${libssh2_version_file}" libssh2_version_minor_string
         REGEX "^[\t ]*#define[\t ]+LIBSSH2_VERSION_MINOR[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${libssh2_version_file}" libssh2_version_patch_string
         REGEX "^[\t ]*#define[\t ]+LIBSSH2_VERSION_PATCH[\t ]+[0-9]+[\t ]*$")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           libssh2_v_major "${libssh2_version_major_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           libssh2_v_minor "${libssh2_version_minor_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           libssh2_v_patch "${libssh2_version_patch_string}")
    set(LIBSSH2_VERSION_STRING
        "${libssh2_v_major}.${libssh2_v_minor}.${libssh2_v_patch}")
    unset(libssh2_version_major_string)
    unset(libssh2_version_minor_string)
    unset(libssh2_version_patch_string)
    unset(libssh2_v_major)
    unset(libssh2_v_minor)
    unset(libssh2_v_patch)
  endif()

  unset(libssh2_version_file)
