load("@bazel_skylib//lib:dicts.bzl", "dicts")
load("@npm//@bazel/typescript:index.bzl", "ts_project")

def ts_node(name = "", srcs = [], deps = [], compiler_options = {}):
    ts_project(
        name = name,
        srcs = srcs,
        extends = "//:tsconfig",
        tsconfig = {
            # This does not affect the editor (VSCode).
            # See tsconfig.json in the root of the project
            "compilerOptions": dicts.add({
                "lib": ["ES2021", "dom"],
                "types": ["node"],
                "declaration": True,
                "sourceMap": True,
                "composite": True,
            }, compiler_options),
        },
        deps = ["@npm//@types/node"] + deps,
    )
