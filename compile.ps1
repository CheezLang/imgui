[CmdletBinding()]
param (
    [Parameter()]
    [bool]
    $GLFW,

    [Parameter()]
    [bool]
    $Vulkan = $False,

    [Parameter()]
    [bool]
    $OpenGL = $False,

    [Parameter()]
    [bool]
    $CompileImgui = $False
)

$imgui_dir = "F:\Programming\CppLibs\imgui\imgui"
$vulkan_dir = "D:\VulkanSDK\1.2.148.1\Include"
$glfw_dir = "D:\dev\libs\glfw-3.3.2.bin.WIN64\include"
$glad_dir = "F:\Programming\CppLibs\glad\include"

if ($CompileImgui) {
    Write-Host "Compiling ImGui"
    Push-Location $imgui_dir
    New-Item "int" -ItemType Directory -Force
    &clang++ -c "imgui.cpp" -o "./int/imgui.o"
    &clang++ -c "imgui_demo.cpp" -o "./int/imgui_demo.o"
    &clang++ -c "imgui_widgets.cpp" -o "./int/imgui_widgets.o"
    &clang++ -c "imgui_draw.cpp" -o "./int/imgui_draw.o"
    &clang++ -c "examples/imgui_impl_opengl3.cpp" -o "./int/imgui_impl_opengl3.o" -I. "-I$vulkan_dir" "-I$glfw_dir" "-I$glad_dir"
    &clang++ -c "examples/imgui_impl_glfw.cpp" -o "./int/imgui_impl_glfw.o" -I. "-I$vulkan_dir" "-I$glfw_dir" "-I$glad_dir"
    &clang++ -c "examples/imgui_impl_vulkan.cpp" -o "./int/imgui_impl_vulkan.o" -I. "-I$vulkan_dir" "-I$glfw_dir" "-I$glad_dir"
    &llvm-lib "/out:./int/imgui.lib" "./int/imgui_impl_glfw.o" "./int/imgui_impl_opengl3.o" "./int/imgui_impl_vulkan.o" "./int/imgui_widgets.o" "./int/imgui.o" "./int/imgui_demo.o" "./int/imgui_draw.o"
    Pop-Location
    Copy-Item "$imgui_dir/int/imgui.lib" "./src/lib/imgui.lib"
}

Write-Host "Compiling imgui C wrapper"
&clang++ -c "./int/imgui.cpp" -o "./int/imgui_bindings.o" "-I$imgui_dir" "-I$vulkan_dir" "-I$glfw_dir" "-I$glad_dir"
&llvm-lib "/out:./int/imgui_bindings.lib" "./int/imgui_bindings.o"
Copy-Item "./int/imgui_bindings.lib" "./src/lib/imgui_bindings.lib" -Force

if ($GLFW) {
    Write-Host "Compiling imgui_glfw C wrapper"
    &clang++ -c "./int/imgui_glfw.cpp" -o "./int/imgui_glfw_bindings.o" "-I$imgui_dir" "-I$glfw_dir"
    &llvm-lib "/out:./int/imgui_glfw_bindings.lib" "./int/imgui_glfw_bindings.o"
    Copy-Item "./int/imgui_glfw_bindings.lib" "./src/lib/imgui_glfw_bindings.lib" -Force
}

if ($Vulkan) {
    Write-Host "Compiling imgui_vulkan C wrapper"
    &clang++ -c "./int/imgui_vulkan.cpp" -o "./int/imgui_vulkan_bindings.o" "-I$imgui_dir" "-I$vulkan_dir"
    &llvm-lib "/out:./int/imgui_vulkan_bindings.lib" "./int/imgui_vulkan_bindings.o"
    Copy-Item "./int/imgui_vulkan_bindings.lib" "./src/lib/imgui_vulkan_bindings.lib" -Force
}

if ($OpenGL) {
    Write-Host "Compiling imgui_opengl C wrapper"
    &clang++ -c "./int/imgui_opengl.cpp" -o "./int/imgui_opengl_bindings.o" "-I$imgui_dir" "-I$glad_dir"
    &llvm-lib "/out:./int/imgui_opengl_bindings.lib" "./int/imgui_opengl_bindings.o"
    Copy-Item "./int/imgui_opengl_bindings.lib" "./src/lib/imgui_opengl_bindings.lib" -Force
}