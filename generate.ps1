New-Item -ItemType Directory -Path "int" -Force

&"../../../CheezLang/CheezCBindingGenerator.exe" imgui.lua "./int"
Write-Host ""
Copy-Item "./int/imgui.che" "./src/imgui.che" -Force

# ./compile.ps1