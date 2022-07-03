load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary", "npm_package_bin")

def single_file_bundler(name, data = [], bundle_file_name = "bundle", output_file_name = "bundle"):

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
            "--bundle-file-name",
            bundle_file_name,
            "--output-file-name",
            output_file_name,
        ],
        outs = [
            "{}.js".format(output_file_name),
        ],
        tool = ":{}_bundle".format(name),
        data = data,
    )
