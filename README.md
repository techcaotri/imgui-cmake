# imgui-cmake
**IMGUI with CMake build**

1. Clone or pull the latest _imgui_ source code and setup CMake:
   ```
   $ ./cmake_setup_scripts/git-clone-and-prepare.sh
   ```
2. Build the _imgui_ static library
   ```
   $ cd imgui
   $ cmake -B build
   $ cmake --build build --parallel 6
   ```
3. Install the _imgui_ static library
   ```
   $ cmake --install build --prefix ./install
   ```
4. Build and run _example_glfw_opengl3_ example:
   ```
   $ cd examples/example_glfw_opengl3
   $ cmake -B build
   $ cmake --build build --parallel 6
   $ ./build/example_glfw_opengl3
   ```