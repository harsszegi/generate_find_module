  # get version
  set(lttngust_version_file "${LTTngUST_INCLUDE_DIR}/lttng/lttngust.h")

  if(EXISTS "${lttngust_version_file}")
    file(STRINGS "${lttngust_version_file}" lttngust_version_major_string
         REGEX "^[\t ]*#define[\t ]+LTTNG_UST_MAJOR_VERSION[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${lttngust_version_file}" lttngust_version_minor_string
         REGEX "^[\t ]*#define[\t ]+LTTNG_UST_MINOR_VERSION[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${lttngust_version_file}" lttngust_version_patch_string
         REGEX "^[\t ]*#define[\t ]+LTTNG_UST_PATCHLEVEL_VERSION[\t ]+[0-9]+[\t ]*$")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           lttngust_v_major "${lttngust_version_major_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           lttngust_v_minor "${lttngust_version_minor_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           lttngust_v_patch "${lttngust_version_patch_string}")
    set(LTTNGUST_VERSION_STRING
        "${lttngust_v_major}.${lttngust_v_minor}.${lttngust_v_patch}")
    unset(lttngust_version_major_string)
    unset(lttngust_version_minor_string)
    unset(lttngust_version_patch_string)
    unset(lttngust_v_major)
    unset(lttngust_v_minor)
    unset(lttngust_v_patch)
  endif()

  unset(lttngust_version_file)
