#!/bin/sh
# This MacBook is personal. On the work machine: ./mbp_rebuild.sh work
host=${1:-personal}
case "$host" in
  personal|work) ;;
  *)
    echo "usage: $0 [personal|work]" >&2
    exit 1
    ;;
esac
sudo darwin-rebuild switch --flake ~/code/dotfiles#"$host"
