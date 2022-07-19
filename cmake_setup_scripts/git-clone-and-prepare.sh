#!/bin/bash -e
#
# git-clones the specified package and copies our CMake files into the clone.
#
# Usage:
#
#     git-clone.sh [--dir=<DIR>]
#
# where
#
#     <DIR> is the the parent directory of the clone
#     The default dir is the parent dir of this repo so the package's repo
#     will be a sibling of the cmakefied directory.
#

cd "$(dirname $0)/.."
deps_dir=$PWD
cd - >/dev/null

cd "$(dirname $0)"
current_dir=$PWD
cd - >/dev/null

gitit () {
    url="$1"
    name="imgui"
    branch="$3"
    dir="$deps_dir/$name"
    echo "deps_dir/name=$deps_dir/$name"
    echo "dir=$dir"
    echo "current_dir=$current_dir"
    echo "$current_dir/$2"
    if [[ ! -d "$dir" ]]; then
        echo -e "\n-- Cloning [$name]: git clone $url $dir"
        git clone "$url" "$dir"
        if [[ -n "$branch" ]]; then
            cd "$dir"
            git checkout "$branch"
            cd - >/dev/null
        fi
    else
        cd "$dir"
        echo -e "\n-- Updating [$name]: cd $dir && git pull --ff-only"
        if [[ -n "$branch" ]]; then
            git checkout "$branch"
        fi
        git fetch --all -p
        git pull --ff-only
        cd - >/dev/null
    fi
    echo "$current_dir/$name"
    echo "$dir"
    cp -Rv "$current_dir/$name"/* "$dir"
}

if [[ $1 =~ --dir=(.*) ]]; then
    deps_dir="${BASH_REMATCH[1]}"
    shift
fi

echo $1

gitit "https://github.com/ocornut/imgui.git" $1
