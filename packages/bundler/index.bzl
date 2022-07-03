load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary", "npm_package_bin")

def single_file_bundler(name, entry_point, data = [], bundle_file_name = "bundle", output_file_name = "bundle"):
    JS_ENTRY_POINT = None
    JS_MAP_ENTRY_POINT = None
    if entry_point.endswith("tsx"):
        JS_ENTRY_POINT = entry_point.replace(".tsx", ".js")
        JS_MAP_ENTRY_POINT = entry_point.replace(".tsx", ".js.map")
    if entry_point.endswith("ts"):
        JS_ENTRY_POINT = entry_point.replace(".ts", ".js")
        JS_MAP_ENTRY_POINT = entry_point.replace(".ts", ".js.map")

    nodejs_binary(
        name = name + "_bundle",
        data = [
            "//packages/bundler:bundle_lib",
        ],
        entry_point = "//packages/bundler:index.ts",
    )

    npm_package_bin(
        name = name,
        args = [
            "--output-dir",
            "$(@D)",
            "--entry-point",
            "$(location :{})".format(JS_ENTRY_POINT),
            "--bundle-file-name",
            bundle_file_name,
            "--output-file-name",
            output_file_name,
        ],
        outs = [
            "{}.js".format(output_file_name),
            "{}.js.map".format(output_file_name),
        ],
        tool = ":{}_bundle".format(name),
        data = [JS_ENTRY_POINT, JS_MAP_ENTRY_POINT] + data,
    )
