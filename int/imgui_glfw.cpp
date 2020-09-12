#include <memory>
#pragma GCC diagnostic ignored "-Wformat-security"

#define DONT_DEFINE_TYPES
#include "../imgui_glfw_binding_source.cpp"



extern "C" void __c__ImGui_ImplGlfw_InitForOpenGL(bool *ret, GLFWwindow * _window, bool _install_callbacks) {
    *ret = (bool )ImGui_ImplGlfw_InitForOpenGL(_window, _install_callbacks);
}
extern "C" void __c__ImGui_ImplGlfw_InitForVulkan(bool *ret, GLFWwindow * _window, bool _install_callbacks) {
    *ret = (bool )ImGui_ImplGlfw_InitForVulkan(_window, _install_callbacks);
}
extern "C" void __c__ImGui_ImplGlfw_Shutdown() {
    ImGui_ImplGlfw_Shutdown();
}
extern "C" void __c__ImGui_ImplGlfw_NewFrame() {
    ImGui_ImplGlfw_NewFrame();
}
extern "C" void __c__ImGui_ImplGlfw_MouseButtonCallback(GLFWwindow * _window, int32_t _button, int32_t _action, int32_t _mods) {
    ImGui_ImplGlfw_MouseButtonCallback(_window, _button, _action, _mods);
}
extern "C" void __c__ImGui_ImplGlfw_ScrollCallback(GLFWwindow * _window, double _xoffset, double _yoffset) {
    ImGui_ImplGlfw_ScrollCallback(_window, _xoffset, _yoffset);
}
extern "C" void __c__ImGui_ImplGlfw_KeyCallback(GLFWwindow * _window, int32_t _key, int32_t _scancode, int32_t _action, int32_t _mods) {
    ImGui_ImplGlfw_KeyCallback(_window, _key, _scancode, _action, _mods);
}
extern "C" void __c__ImGui_ImplGlfw_CharCallback(GLFWwindow * _window, uint32_t _c) {
    ImGui_ImplGlfw_CharCallback(_window, _c);
}
extern "C" void __c__ImGui_ImplGlfw_MonitorCallback(GLFWmonitor * _monitor, int32_t _event) {
    ImGui_ImplGlfw_MonitorCallback(_monitor, _event);
}
