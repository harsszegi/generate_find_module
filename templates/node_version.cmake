  # get version
  set(node_version_file "${NODE_INCLUDE_DIR}/node.h")

  if(EXISTS "${node_version_file}")
    file(STRINGS "${node_version_file}" node_version_major_string
         REGEX "^[\t ]*#define[\t ]+NODE_MAJOR_VERSION[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${node_version_file}" node_version_minor_string
         REGEX "^[\t ]*#define[\t ]+NODE_MINOR_VERSION[\t ]+[0-9]+[\t ]*$")
    file(STRINGS "${node_version_file}" node_version_patch_string
         REGEX "^[\t ]*#define[\t ]+NODE_PATCH_VERSION[\t ]+[0-9]+[\t ]*$")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           node_v_major "${node_version_major_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           node_v_minor "${node_version_minor_string}")
    string(REGEX REPLACE ".*[\t ]+([0-9]+).*" "\\1"
           node_v_patch "${node_version_patch_string}")
    set(NODE_VERSION_STRING
        "${node_v_major}.${node_v_minor}.${node_v_patch}")
    unset(node_version_major_string)
    unset(node_version_minor_string)
    unset(node_version_patch_string)
    unset(node_v_major)
    unset(node_v_minor)
    unset(node_v_patch)
  endif()

  unset(node_version_file)
