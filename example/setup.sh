#!/bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

# Buckify

set -e

(cd ..; cargo build)

# Build a BUCK file to build third-party crates.
# This is separate from vendoring as you may need to run it a few times if it reports needing a fixup.
# It will create a template fixup.toml which you can edit as needed. You would typically commit
# these fixups and the generated third-party/BUCK in the same commit as above.
../target/debug/reindeer --third-party-dir third-party buckify
