-- loadfile("D:\\dev\\Cheez\\Examples\\libraries\\imgui\\config")
require("config")

source_file = "imgui_vulkan_binding_source.cpp"

function prepend_to_cpp()
    return [[
#include <memory>
#pragma GCC diagnostic ignored "-Wformat-security"

#define DONT_DEFINE_TYPES
#include "../imgui_vulkan_binding_source.cpp"


]]
end

function prepend_to_cheez()
    return [[
#lib("./lib/imgui_vulkan_bindings.lib")
#lib("./lib/imgui.lib")

import std.alloca

use import imgui
use import vulkan

#export_scope
]]
end

function on_typedef(decl, name, text)
    return nil
end

function on_macro(decl, name, value)
    return true, nil
end

function on_enum(enum)
    return nil
end

function on_struct(decl, name)
    if name:find("ImGui_") == 1 then
        return false, nil
    end
    return true, nil
end

function on_function(decl, name)
    if name:find("ImGui_") == 1 then
        return false, nil
    end
    return true, nil
end
