# Third-party dependencies fetched by Bazel
# Unlike WORKSPACE, the content of this file is unordered.
# We keep them separate to make the WORKSPACE file more maintainable.

# Install the nodejs "bootstrap" package
# This provides the basic tools for running and packaging nodejs programs in Bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_dependencies():
    http_archive(
        name = "build_bazel_rules_nodejs",
        # sha256 = "c911b5bd8aee8b0498cc387cacdb5f917098ce477fb4182db07b0ef8a9e045c0",
        # urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/4.7.1/rules_nodejs-4.7.1.tar.gz"],

        sha256 = "ee3280a7f58aa5c1caa45cb9e08cbb8f4d74300848c508374daf37314d5390d6",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.5.1/rules_nodejs-5.5.1.tar.gz"],
    )
