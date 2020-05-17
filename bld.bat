cd opensim-moco-source
cd ..
mkdir moco_dependencies_build
cd moco_dependencies_build
cmake ../opensim-moco-source/dependencies ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DOPENSIM_PYTHON_WRAPPING=on ^
    -DOPENSIM_INSTALL_UNIX_FHS=on ^
    -DCMAKE_INSTALL_PREFIX=../moco_dependencies_install
cmake . -LAH
ninja
cd ..
mkdir build
cd build
cmake ../opensim-moco-source ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DMOCO_PYTHON_BINDINGS=on ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DMOCO_INSTALL_UNIX_FHS=on ^
    -DBUILD_TESTING=off ^
    -DMOCO_DEPENDENCIES_DIR=../moco_dependencies_install
cmake . -LAH
ninja install

Rem https://github.com/conda-forge/casadi-feedstock/blob/master/recipe/bld.bat
Rem https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/building-conda-packages.html#toolkit
Rem https://github.com/conda/conda-build/wiki/Windows-recipe-patterns
Rem use env vars like LIBRARY_BIN  https://github.com/conda/conda-recipes/blob/master/libtiff/bld.bat
Rem https://github.com/conda-forge/armadillo-feedstock/blob/37f0a20559aaddbaede9b54cc4eaf725c6d8a7c7/recipe/bld.bat
