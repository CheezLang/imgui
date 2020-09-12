#if !defined(DONT_DEFINE_TYPES)

struct VkInstance_T {};
struct VkPhysicalDevice_T {};
struct VkDevice_T {};
struct VkSurfaceKHR_T {};
struct VkQueueKHR_T {};
struct VkRenderPass_T {};
struct VkPipeline_T {};
struct VkPipelineCache_T {};
struct VkDescriptorPool_T {};
struct VkCommandBuffer_T {};
struct VkSwapchainKHR_T {};

typedef VkInstance_T* VkInstance;
typedef VkPhysicalDevice_T* VkPhysicalDevice;
typedef VkDevice_T* VkDevice;
typedef VkQueueKHR_T* VkQueue;
typedef VkSurfaceKHR_T* VkSurfaceKHR;
typedef VkRenderPass_T* VkRenderPass;
typedef VkPipeline_T* VkPipeline;
typedef VkPipelineCache_T* VkPipelineCache;
typedef VkDescriptorPool_T* VkDescriptorPool;
typedef VkCommandBuffer_T* VkCommandBuffer;
typedef VkSwapchainKHR_T* VkSwapchainKHR;

typedef void (*PFN_vkAllocationFunction)();
typedef void (*PFN_vkReallocationFunction)();
typedef void (*PFN_vkFreeFunction)();
typedef void (*PFN_vkInternalAllocationNotification)();
typedef void (*PFN_vkInternalFreeNotification)();


enum VkPresentModeKHR {};
enum VkFormat {};
enum VkColorSpaceKHR {};
enum VkPresentModeKHR {};
enum VkSampleCountFlagBits {};

struct VkAllocationCallbacks {
    void*                                   pUserData;
    PFN_vkAllocationFunction                pfnAllocation;
    PFN_vkReallocationFunction              pfnReallocation;
    PFN_vkFreeFunction                      pfnFree;
    PFN_vkInternalAllocationNotification    pfnInternalAllocation;
    PFN_vkInternalFreeNotification          pfnInternalFree;
};

struct VkSurfaceFormatKHR {
    VkFormat           format;
    VkColorSpaceKHR    colorSpace;
};

union VkClearColorValue {
    float       float32[4];
    int32_t     int32[4];
    uint32_t    uint32[4];
};

struct VkClearDepthStencilValue {
    float       depth;
    uint32_t    stencil;
};

union VkClearValue {
    VkClearColorValue           color;
    VkClearDepthStencilValue    depthStencil;
};

// struct ImGui_ImplVulkan_InitInfo
// {
//     VkInstance          Instance;
//     VkPhysicalDevice    PhysicalDevice;
//     VkDevice            Device;
//     uint32_t            QueueFamily;
//     VkQueue             Queue;
//     VkPipelineCache     PipelineCache;
//     VkDescriptorPool    DescriptorPool;
//     uint32_t            MinImageCount;          // >= 2
//     uint32_t            ImageCount;             // >= MinImageCount
//     VkSampleCountFlagBits        MSAASamples;   // >= VK_SAMPLE_COUNT_1_BIT
//     const VkAllocationCallbacks* Allocator;
//     void                (*CheckVkResultFn)(VkResult err);
// };


struct ImDrawData {};
#endif

#include <stdint.h>
#include "F:/Programming/CppLibs/imgui/imgui/examples/imgui_impl_vulkan.h"
