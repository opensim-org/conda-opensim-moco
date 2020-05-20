cd opensim-moco-source
cd ..
mkdir moco_dependencies_build
cd moco_dependencies_build
# Allow casadi to find conda's ipopt.
echo "CONDA PREFIX"
echo $CONDA_PREFIX
export CMAKE_PREFIX_PATH=$CONDA_PREFIX
cmake ../opensim-moco-source/dependencies -LAH \
    -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET} \
    -DCMAKE_BUILD_TYPE=Release \
    -DOPENSIM_PYTHON_WRAPPING=on \
    -DOPENSIM_INSTALL_UNIX_FHS=on \
    -DSUPERBUILD_ipopt=off \
    -DSUPERBUILD_colpack=off \
    -DSUPERBUILD_eigen=off \
    -DSUPERBUILD_adolc=off \
    -DCMAKE_INSTALL_PREFIX=../moco_dependencies_install
# TODO
# make -j${CPU_COUNT}
# cd ..
# mkdir build
# cd build
# cmake ../opensim-moco-source -LAH \
#     -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
#     -DCMAKE_OSX_DEPLOYMENT_TARGET=${MACOSX_DEPLOYMENT_TARGET} \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DMOCO_PYTHON_BINDINGS=on \
#     -DCMAKE_INSTALL_PREFIX=${PREFIX} \
#     -DMOCO_INSTALL_UNIX_FHS=on \
#     -DBUILD_TESTING=off \
#     -DMOCO_WITH_TROPTER=off \
#     -DMOCO_DEPENDENCIES_DIR=../moco_dependencies_install
# make -j${CPU_COUNT}
# make -j${CPU_COUNT} install

# TODO: Is there anything we want to delete?
# TODO: Test that the necessary files exist.
# TODO: Could build for multiple python versions *after* building dependencies.
# TODO: Locally test that Mac installation works without bundling ipopt.
# TODO: Test MOCO_WITH_TROPTER=off
