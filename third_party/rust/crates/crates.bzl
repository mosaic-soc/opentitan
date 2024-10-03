###############################################################################
# @generated
# This file is auto-generated by the cargo-bazel tool.
#
# DO NOT MODIFY: Local changes may be replaced in future executions.
###############################################################################
"""Rules for defining repositories for remote `crates_vendor` repositories"""

load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# buildifier: disable=bzl-visibility
load("@lowrisc_opentitan//third_party/rust/crates:defs.bzl", _crate_repositories = "crate_repositories")

# buildifier: disable=bzl-visibility
load("@rules_rust//crate_universe/private:crates_vendor.bzl", "crates_vendor_remote_repository")

def crate_repositories():
    """Generates repositories for vendored crates.

    Returns:
      A list of repos visible to the module through the module extension.
    """
    maybe(
        crates_vendor_remote_repository,
        name = "crate_index",
        build_file = Label("@lowrisc_opentitan//third_party/rust/crates:BUILD.bazel"),
        defs_module = Label("@lowrisc_opentitan//third_party/rust/crates:defs.bzl"),
    )

    direct_deps = [struct(repo = "crate_index", is_dev_dep = False)]
    direct_deps.extend(_crate_repositories())
    return direct_deps
