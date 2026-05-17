# shellcheck shell=sh

# shellcheck disable=SC2175
up() { cd "$(eval printf '../'%.0s {1.."$1"})" && pwd; }

mkd() {
    # shellcheck disable=SC2164
    mkdir -p "$@" && cd "$@"
}
