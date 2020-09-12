[CmdletBinding()]
param (
    [Parameter()]
    [bool]
    $Vulkan,

    [Parameter()]
    [bool]
    $OpenGL
)

New-Item -ItemType Directory -Path "int" -Force

&"../../../CheezLang/CheezCBindingGenerator.exe" imgui.lua "./int"
Write-Host ""
Copy-Item "./int/imgui.che" "./src/imgui.che" -Force

if ($Vulkan) {
    Write-Host "generating imgui_vulkan bindings"
    &"../../../CheezLang/CheezCBindingGenerator.exe" imgui_vulkan.lua "./int"
    Write-Host ""
    Copy-Item "./int/imgui_vulkan.che" "./src/imgui_vulkan.che" -Force
}

if ($OpenGL) {
    Write-Host "generating imgui_opengl bindings"
    &"../../../CheezLang/CheezCBindingGenerator.exe" imgui_opengl.lua "./int"
    Write-Host ""
    Copy-Item "./int/imgui_opengl.che" "./src/imgui_opengl.che" -Force
}

./compile.ps1 -Vulkan $Vulkan -OpenGL $OpenGL