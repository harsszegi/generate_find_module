# Read GenICam version file
set(GenICam_version_file ${GENICAM_INCLUDE_DIR}/_GenICamVersion.h)
if (EXISTS ${GenICam_version_file})
  # Read preprocessor definitions from file
  file(STRINGS
    ${GenICam_version_file}
    GenICam_version_strings
    REGEX "^#define GENICAM_.*$"
  )

  # Extract variable name and value from strings of the form "#define <key> <val>"
  # Example: "#define GENICAM_VERSION_MAJOR 3" leads to "GenICam_VERSION_MAJOR" being set to "3"
  foreach (GenICam_version_string ${GenICam_version_strings})
    # Split the line at spaces
    string(REGEX REPLACE "[ ]+" ";" GenICam_version_string "${GenICam_version_string}")
    list(GET GenICam_version_string 1 GenICam_version_string_key)
    list(GET GenICam_version_string 2 GenICam_version_string_val)

    # Replace some terminology and case in key variable
    string(REPLACE "GENICAM" "GenICam" GenICam_version_string_key "${GenICam_version_string_key}")
    string(REPLACE "SUBMINOR" "PATCH" GenICam_version_string_key "${GenICam_version_string_key}")

    # Set variable
    set(${GenICam_version_string_key} ${GenICam_version_string_val})
  endforeach ()

  # Set version var
  set (GENICAM_VERSION_STR "${GenICam_VERSION_MAJOR}.${GenICam_VERSION_MINOR}.${GenICam_VERSION_PATCH}")
  unset(GenICam_version_strings)
  unset(GenICam_VERSION_MAJOR)
  unset(GenICam_VERSION_MINOR)
  unset(GenICam_VERSION_PATCH)
endif ()
unset(GenICam_version_file)