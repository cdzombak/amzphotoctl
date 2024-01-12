#!/usr/bin/env bash
set -euo pipefail

open -a 'Amazon Photos'

if [ ! -e /etc/sudoers.d/cdzombak-renice ]; then
	echo "[warn] skipping renice since 'sudo renice' may require a password"
	echo "to fix, add this line to '/etc/sudoers.d/cdzombak-renice':"
	echo "cdzombak ALL=NOPASSWD: /usr/bin/renice"
	exit 1
fi
sleep 60
sudo renice 10 $(pgrep 'Amazon Photos')
