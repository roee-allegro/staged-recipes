#!/bin/sh

echo "**************************************************"
which cython
cython --version
echo "**************************************************"
which python
python --version
echo "**************************************************"
echo "$PYTHON" 
$PYTHON --version
echo "**************************************************"
echo "$PYTHONPATH"

mkdir build && cd build

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DWITH_GUDHI_PYTHON=OFF \
  ..

# install include files and utils
make install -j${CPU_COUNT}

# install the python package
cmake -DWITH_GUDHI_PYTHON=ON .
cd cython
echo "**************************************************"
pwd
echo "**************************************************"
ls
echo "**************************************************"
$PYTHON -c "import cython; print(cython.__version__)"
echo "**************************************************"
$PYTHON setup.py install

