  # get version
  set(microtar_version_file "${MICROTAR_INCLUDE_DIR}/microtar.h")
  if (EXISTS "${microtar_version_file}")
    file(STRINGS "${microtar_version_file}" microtar_version_str REGEX "^#define[\t ]+MTAR_VERSION[\t ]+\".*\"")
    string(REGEX REPLACE "^#define[\t ]+MTAR_VERSION[\t ]+\"([^\"]*)\".*" "\\1" MICROTAR_VERSION_STRING "${microtar_version_str}")
    unset(microtar_version_str)
  endif()
  unset(microtar_version_file)
