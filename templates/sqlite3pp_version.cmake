  # get version
  set(sqlite3pp_version_file "${SQLITE3PP_INCLUDE_DIR}/sqlite3pp.h")

  if(EXISTS "${sqlite3pp_version_file}")
    file(STRINGS "${sqlite3pp_version_file}" sqlite3pp_version_major_string
         REGEX "^[\t ]*#define[\t ]+SQLITE3PP_VERSION_MAJOR[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${sqlite3pp_version_file}" sqlite3pp_version_minor_string
         REGEX "^[\t ]*#define[\t ]+SQLITE3PP_VERSION_MINOR[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${sqlite3pp_version_file}" sqlite3pp_version_patch_string
         REGEX "^[\t ]*#define[\t ]+SQLITE3PP_VERSION_PATCH[\t ]+[0-9]+[\t ]*$")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           sqlite3pp_v_major "${sqlite3pp_version_major_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           sqlite3pp_v_minor "${sqlite3pp_version_minor_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           sqlite3pp_v_patch "${sqlite3pp_version_patch_string}")
    set(SQLITE3PP_VERSION_STRING
        "${sqlite3pp_v_major}.${sqlite3pp_v_minor}.${sqlite3pp_v_patch}")
    unset(sqlite3pp_version_major_string)
    unset(sqlite3pp_version_minor_string)
    unset(sqlite3pp_version_patch_string)
    unset(sqlite3pp_v_major)
    unset(sqlite3pp_v_minor)
    unset(sqlite3pp_v_patch)
  endif()

  unset(sqlite3pp_version_file)
