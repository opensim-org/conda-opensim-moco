cd opensim-moco-source
cd ..
mkdir moco_dependencies_build
cd moco_dependencies_build
cmake ../opensim-moco-source/dependencies -LAH ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DOPENSIM_PYTHON_WRAPPING=on ^
    -DOPENSIM_INSTALL_UNIX_FHS=on ^
    -DCMAKE_INSTALL_PREFIX=../moco_dependencies_install
type CMakeFiles/CMakeOutput.log
Rem ninja
Rem cd ..
Rem mkdir build
Rem cd build
Rem cmake ../opensim-moco-source -LAH ^
Rem     -GNinja ^
Rem     -DCMAKE_BUILD_TYPE=Release ^
Rem     -DMOCO_PYTHON_BINDINGS=on ^
Rem     -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
Rem     -DMOCO_INSTALL_UNIX_FHS=on ^
Rem     -DBUILD_TESTING=off ^
Rem     -DMOCO_DEPENDENCIES_DIR=../moco_dependencies_install
Rem ninja install

Rem https://github.com/conda-forge/casadi-feedstock/blob/master/recipe/bld.bat
Rem https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/building-conda-packages.html#toolkit
Rem https://github.com/conda/conda-build/wiki/Windows-recipe-patterns
Rem use env vars like LIBRARY_BIN  https://github.com/conda/conda-recipes/blob/master/libtiff/bld.bat
Rem https://github.com/conda-forge/armadillo-feedstock/blob/37f0a20559aaddbaede9b54cc4eaf725c6d8a7c7/recipe/bld.bat
