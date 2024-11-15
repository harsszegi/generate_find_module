#!/usr/bin/env python3

#
# Generates a find module for CMake
#

import sys
import subprocess
import argparse
import string
import os.path
import io
import jinja2
import json

def render(tpl_path, context):
    path, filename = os.path.split(tpl_path)

    return jinja2.Environment(
        block_start_string='<%',
        block_end_string="%>",
        variable_start_string='%%',
        variable_end_string='%%',
        loader=jinja2.FileSystemLoader(path or './'),
        trim_blocks=True
    ).get_template(filename).render(context)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = "Generates find module(s) for CMake")
    parser.add_argument("--outdir", default = "modules", help = "Output directory", required = False)
    args = parser.parse_args()

    template_file = os.path.join(os.path.dirname(__file__), "generate_find_module.template")

    with open('packages.json', 'r') as f:
        packages = json.load(f)

    for p in packages["packages"]:
        sys.stdout.write(".")
        sys.stdout.flush()

        version_data = None
        if "version" in p:
            version_file = p["version"]
            with open(os.path.join('templates', version_file), 'r') as f:
                version_data = f.read()

        link_data = None
        if "link" in p:
            link_file = p["link"]
            with open(os.path.join('templates', link_file), 'r') as f:
                link_data = f.read()

        find_data = None
        if "find" in p:
            find_file = p["find"]
            with open(os.path.join('templates', find_file), 'r') as f:
                find_data = f.read()

        after_find_data = None
        if "after_find" in p:
            after_find_file = p["after_find"]
            with open(os.path.join('templates', after_find_file), 'r') as f:
                after_find_data = f.read()

        libs = p["libs"] if "libs" in p else None
        libs_linux = p["libs_linux"] if "libs_linux" in p else None
        libs_windows = p["libs_windows"] if "libs_windows" in p else None
        libs_static = p["libs_static"] if "libs_static" in p else None

        targets = p["targets"] if "targets" in p else [ f'{p["name"]}:{p["name"]}' ]
        targets_linux = p["targets_linux"] if "targets_linux" in p else None
        targets_windows = p["targets_windows"] if "targets_windows" in p else None
        targets_static = p["targets_static"] if "targets_static" in p else None

        include_path_suffix = p["include_path_suffix"] if "include_path_suffix" in p else None
        root_path = p["root_path"] if "root_path" in p else None

        skip_cmake = p["skip_cmake"] if "skip_cmake" in p else False

        context = { 
            "skip_cmake": skip_cmake,
            "name": p["name"], 
            "include": p["include"], 
            "include_path_suffix": include_path_suffix,
            "root_path": root_path,
            "libs": libs,
            "libs_linux": libs_linux,
            "libs_windows": libs_windows,
            "libs_static": libs_static,
            "targets": targets,
            "targets_linux": targets_linux,
            "targets_windows": targets_windows,
            "targets_static": targets_static,
            "package": p["package"] if "package" in p else None, 
            "version": version_data,
            "link": link_data,
            "find": find_data,
            "after_find": after_find_data
        }

        result = render(template_file, context)

        filename = "Find{}.cmake".format(p["name"])
        if args.outdir:
            filename = os.path.join(args.outdir, filename)

        with io.open(filename,'w', newline='\n') as f:
            f.write(result)
            f.close()

        cmd = ['cmake-format', '-i', filename]
        result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                universal_newlines=True)
        if result.returncode != 0:
            raise Exception(f"Error formatting {filename}, perhaps 'cmakelang' is not installed")
