#!/bin/bash

set -exuo pipefail

export CARGO_HOME=/tmp/cargo

export MISE_DATA_DIR="${GAMFAM_MISE_ROOT_DIR}/data"
export MISE_CACHE_DIR=/var/cache/mise/cache
export MISE_STATE_DIR=/tmp/mise/state
mkdir -p "${MISE_DATA_DIR}" "${MISE_CACHE_DIR}" "${MISE_STATE_DIR}"

cd "${GAMFAM_MISE_ROOT_DIR}"

mise install

mapfile -t mise_bin_paths < <(mise bin-paths)
for shim in "${MISE_DATA_DIR}"/shims/*; do
    shim_file="$(basename "${shim}")"
    for bin_path in "${mise_bin_paths[@]}"; do
        if [[ -x "${bin_path}/${shim_file}" ]]; then
            ln -s "${bin_path}/${shim_file}" "/usr/bin/${shim_file}"
            break
        fi
    done
done

rm -r "${MISE_DATA_DIR}/downloads"
