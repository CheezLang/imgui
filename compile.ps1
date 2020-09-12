Write-Host "Compiling C++ part"
&clang -c "./int/imgui.cpp" -o "./int/imgui_binding.o" -DFORCE_CPP
&llvm-lib "/out:./int/binding.lib" "./int/imgui_binding.o"
Copy-Item "./int/binding.lib" "./src/lib/binding.lib" -Force