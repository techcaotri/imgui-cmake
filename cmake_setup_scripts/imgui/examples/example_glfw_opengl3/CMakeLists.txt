cmake_minimum_required(VERSION 3.17)
project(example_glfw_opengl3 CXX)

list(APPEND CMAKE_PREFIX_PATH "../../install/lib/cmake")

set(IMGUI_SRC_DIR ../..)
find_package(IMGUI REQUIRED)
add_executable(example_glfw_opengl3
              main.cpp
              ${IMGUI_SRC_DIR}/imgui.cpp
              ${IMGUI_SRC_DIR}/imgui_demo.cpp
              ${IMGUI_SRC_DIR}/imgui_draw.cpp
              ${IMGUI_SRC_DIR}/imgui_tables.cpp
              ${IMGUI_SRC_DIR}/imgui_widgets.cpp)
target_link_libraries(example_glfw_opengl3 imgui::imgui)