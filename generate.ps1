[CmdletBinding()]
param (
    [Parameter()]
    [bool]
    $Vulkan
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
./compile.ps1 -Vulkan $Vulkan