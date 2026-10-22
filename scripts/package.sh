#!/bin/bash
set -euo pipefail
VERSION="${VERSION:-dev}"
BUILD_NO="${BUILD_NO:-local}"
RUN_ID="${RUN_ID:-local}"
COMMIT="${COMMIT:-unknown}"
PYTHON_VERSION="${PYTHON_VERSION:-unknown}"
NAME=ops-lab1-o3
PKG="${NAME}_${VERSION}_source"
mkdir -p "dist/${PKG}"
cp README.md wordcount.py test_wordcount.py "dist/${PKG}/"
printf 'name=%s\nversion=%s\nbuild_no=%s\nrun_id=%s\ncommit=%s\npython=%s\n' \
  "$NAME" "$VERSION" "$BUILD_NO" "$RUN_ID" "$COMMIT" "$PYTHON_VERSION" > "dist/${PKG}/BUILD_INFO"
tar --sort=name --owner=0 --group=0 --numeric-owner --mtime=@0 -C dist -cf - "$PKG" | gzip -n > "dist/${PKG}.tar.gz"
(
  cd dist
  sha256sum "${PKG}.tar.gz" > "${PKG}.tar.gz.sha256"
)
