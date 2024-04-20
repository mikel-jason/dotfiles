#!/usr/bin/env bash

set -eo pipefail

pushd "$(dirname "$0")/.." &>/dev/null || (echo "cannot enter setup directory" && exit 1)
trap "popd &>/dev/null" EXIT ERR

# devbox must run first as it's used in other install scripts
echo "Checking devbox"
for file in $(find -H './devbox' -name '*.install')
do
    $file
done

echo "Checking other installations"
for file in $(find -H '.' -name '*.install' -not -path '*/.git/*' -not -path '*/devbox/*')
do
    $file
done

echo "Checking symlinks"
skip_all=false
for file in $(find -H '.' -name '*.symlink' -not -path '*/.git/*')
do
    dst="$HOME/$(basename "${file%.*}")"

    if [[ "$skip_all" == "true" ]]; then
        rm -f "$dst"
    elif [[ -a "$dst" ]]; then
        echo "$dst already exists, what do you want to do?"
        echo "  [b] Backup, creates $dst.backup" file
        echo "  [o] Override file"
        echo "  [O] Override all files"
        echo "  Everything else will skip this file"
        read -r -n1 decision
        echo
        case "$decision" in
            b )
                backup="$dst.backup.$RANDOM"
                mv "$dst" "$backup"
                echo "Created backup file: $backup"
                ;;
            o )
                rm -f "$dst"
                ;;
            O )
                rm -f "$dst"
                skip_all=true
                ;;
            * )
                echo "$dst skipped"
                continue
                ;;
        esac
    fi

    echo "Symlinking $dst"
    ln -s "$(realpath "$file")" "$dst"
done

echo "Bootstrap completed. Restart your shell or source ~/.zshrc"
