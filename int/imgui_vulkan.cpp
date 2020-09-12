#include <memory>
#pragma GCC diagnostic ignored "-Wformat-security"

#define DONT_DEFINE_TYPES
#include "../imgui_vulkan_binding_source.cpp"



extern "C" void __c__ImGui_ImplVulkanH_Window_new_15(ImGui_ImplVulkanH_Window* self) {
    new (self) ImGui_ImplVulkanH_Window();
}
extern "C" void __c__ImGui_ImplVulkan_Init(bool *ret, ImGui_ImplVulkan_InitInfo * _info, VkRenderPass_T * _render_pass) {
    *ret = (bool )ImGui_ImplVulkan_Init(_info, _render_pass);
}
extern "C" void __c__ImGui_ImplVulkan_Shutdown() {
    ImGui_ImplVulkan_Shutdown();
}
extern "C" void __c__ImGui_ImplVulkan_NewFrame() {
    ImGui_ImplVulkan_NewFrame();
}
extern "C" void __c__ImGui_ImplVulkan_RenderDrawData(ImDrawData * _draw_data, VkCommandBuffer_T * _command_buffer, VkPipeline_T * _pipeline) {
    ImGui_ImplVulkan_RenderDrawData(_draw_data, _command_buffer, _pipeline);
}
extern "C" void __c__ImGui_ImplVulkan_CreateFontsTexture(bool *ret, VkCommandBuffer_T * _command_buffer) {
    *ret = (bool )ImGui_ImplVulkan_CreateFontsTexture(_command_buffer);
}
extern "C" void __c__ImGui_ImplVulkan_DestroyFontUploadObjects() {
    ImGui_ImplVulkan_DestroyFontUploadObjects();
}
extern "C" void __c__ImGui_ImplVulkan_SetMinImageCount(int32_t _min_image_count) {
    ImGui_ImplVulkan_SetMinImageCount(_min_image_count);
}
extern "C" void __c__ImGui_ImplVulkanH_CreateOrResizeWindow(VkInstance_T * _instance, VkPhysicalDevice_T * _physical_device, VkDevice_T * _device, ImGui_ImplVulkanH_Window * _wnd, int32_t _queue_family, VkAllocationCallbacks * _allocator, int32_t _w, int32_t _h, int32_t _min_image_count) {
    ImGui_ImplVulkanH_CreateOrResizeWindow(_instance, _physical_device, _device, _wnd, _queue_family, _allocator, _w, _h, _min_image_count);
}
extern "C" void __c__ImGui_ImplVulkanH_DestroyWindow(VkInstance_T * _instance, VkDevice_T * _device, ImGui_ImplVulkanH_Window * _wnd, VkAllocationCallbacks * _allocator) {
    ImGui_ImplVulkanH_DestroyWindow(_instance, _device, _wnd, _allocator);
}
extern "C" void __c__ImGui_ImplVulkanH_SelectSurfaceFormat(VkSurfaceFormatKHR *ret, VkPhysicalDevice_T * _physical_device, VkSurfaceKHR_T * _surface, const VkFormat * _request_formats, int32_t _request_formats_count, VkColorSpaceKHR _request_color_space) {
    *ret = (VkSurfaceFormatKHR )ImGui_ImplVulkanH_SelectSurfaceFormat(_physical_device, _surface, _request_formats, _request_formats_count, _request_color_space);
}
extern "C" void __c__ImGui_ImplVulkanH_SelectPresentMode(VkPresentModeKHR *ret, VkPhysicalDevice_T * _physical_device, VkSurfaceKHR_T * _surface, const VkPresentModeKHR * _request_modes, int32_t _request_modes_count) {
    *ret = (VkPresentModeKHR )ImGui_ImplVulkanH_SelectPresentMode(_physical_device, _surface, _request_modes, _request_modes_count);
}
extern "C" void __c__ImGui_ImplVulkanH_GetMinImageCountFromPresentMode(int32_t *ret, VkPresentModeKHR _present_mode) {
    *ret = (int32_t )ImGui_ImplVulkanH_GetMinImageCountFromPresentMode(_present_mode);
}
