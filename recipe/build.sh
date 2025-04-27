#!/bin/bash

export SETUPTOOLS_SCM_PRETEND_VERSION="$PKG_VERSION"
echo "version = \"$PKG_VERSION\"" >src/build123d/_version.py
# Running python build on the sources works, but these are missed in conda-build?
echo "include src/build123d/template_render.js" >> MANIFEST.in
echo "include src/build123d/py.typed" >> MANIFEST.in

"$PYTHON" -m pip install . -vv --no-deps --no-build-isolation
