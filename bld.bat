
cd opensim-moco-source
git submodule update --init
cd ..
mkdir moco_dependencies_build
cd moco_dependencies_build
cmake ../opensim-moco-source/dependencies ^
    -G "%CMAKE_GENERATOR%" ^
    -DOPENSIM_PYTHON_WRAPPING=on ^
    -DOPENSIM_INSTALL_UNIX_FHS=on ^
    -DCMAKE_INSTALL_PREFIX=../moco_dependencies_install
cmake --build . --config Release -- /maxcpucount:%CPU_COUNT%
cd ..
mkdir build
cd build
cmake ../opensim-moco-source ^
    -DMOCO_PYTHON_BINDINGS=on ^
    -DCMAKE_INSTALL_PREFIX=${PREFIX} ^
    -DMOCO_INSTALL_UNIX_FHS=on ^
    -DMOCO_DEPENDENCIES_DIR=../moco_dependencies_install

cmake --build . --target INSTALL --config Release -- /maxcpucount:%CPU_COUNT%
