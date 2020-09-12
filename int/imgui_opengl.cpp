#include <memory>
#pragma GCC diagnostic ignored "-Wformat-security"

#define DONT_DEFINE_TYPES
#include "../imgui_opengl_binding_source.cpp"



extern "C" void __c__ImGui_ImplOpenGL3_Init(bool *ret, const char * _glsl_version) {
    *ret = (bool )ImGui_ImplOpenGL3_Init(_glsl_version);
}
extern "C" void __c__ImGui_ImplOpenGL3_Shutdown() {
    ImGui_ImplOpenGL3_Shutdown();
}
extern "C" void __c__ImGui_ImplOpenGL3_NewFrame() {
    ImGui_ImplOpenGL3_NewFrame();
}
extern "C" void __c__ImGui_ImplOpenGL3_RenderDrawData(ImDrawData * _draw_data) {
    ImGui_ImplOpenGL3_RenderDrawData(_draw_data);
}
extern "C" void __c__ImGui_ImplOpenGL3_CreateFontsTexture(bool *ret) {
    *ret = (bool )ImGui_ImplOpenGL3_CreateFontsTexture();
}
extern "C" void __c__ImGui_ImplOpenGL3_DestroyFontsTexture() {
    ImGui_ImplOpenGL3_DestroyFontsTexture();
}
extern "C" void __c__ImGui_ImplOpenGL3_CreateDeviceObjects(bool *ret) {
    *ret = (bool )ImGui_ImplOpenGL3_CreateDeviceObjects();
}
extern "C" void __c__ImGui_ImplOpenGL3_DestroyDeviceObjects() {
    ImGui_ImplOpenGL3_DestroyDeviceObjects();
}
