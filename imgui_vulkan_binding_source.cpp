#if !defined(DONT_DEFINE_TYPES)

struct VkRenderPass_T {} ;
struct VkCommandBuffer_T {} ;
struct VkPipeline_T {} ;
struct VkInstance_T {} ;
struct VkPhysicalDevice_T {} ;
struct VkDevice_T {} ;
struct VkSurfaceKHR_T {} ;

typedef VkRenderPass_T* VkRenderPass;
typedef VkCommandBuffer_T* VkCommandBuffer;
typedef VkPipeline_T* VkPipeline;
typedef VkInstance_T* VkInstance;
typedef VkPhysicalDevice_T* VkPhysicalDevice;
typedef VkDevice_T* VkDevice;
typedef VkSurfaceKHR_T* VkSurfaceKHR;

typedef void (*PFN_vkAllocationFunction)();
typedef void (*PFN_vkReallocationFunction)();
typedef void (*PFN_vkFreeFunction)();
typedef void (*PFN_vkInternalAllocationNotification)();
typedef void (*PFN_vkInternalFreeNotification)();

struct ImDrawData {};

enum VkPresentModeKHR {};
enum VkFormat {};
enum VkColorSpaceKHR {};
enum VkPresentModeKHR {};

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

#endif

#include "F:/Programming/CppLibs/imgui/imgui/examples/imgui_impl_vulkan.h"
