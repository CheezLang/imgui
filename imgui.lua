-- loadfile("D:\\dev\\Cheez\\Examples\\libraries\\imgui\\config")
require("config")

source_file = "imgui_binding_source.cpp"

function prepend_to_cpp()
    return [[
#include <memory>
#include "../imgui_binding_source.cpp"
#pragma GCC diagnostic ignored "-Wformat-security"

using ImGuiTextRange = ImGuiTextFilter::ImGuiTextRange;
using ImGuiStoragePair = ImGuiStorage::ImGuiStoragePair;
]]
end

function prepend_to_cheez()
    return [[
#lib("./lib/imgui_bindings.lib")
#lib("./lib/imgui.lib")

import std.alloca
use import std.io.stdio

use import glfw

#export_scope
IM_COL32 :: (r: u8, g: u8, b: u8, a: u8 = 255) -> u32 #macro {
    @bin_or(
        @bin_lsl(u32(r), 0),
        @bin_lsl(u32(g), 8),
        @bin_lsl(u32(b), 16),
        @bin_lsl(u32(a), 24)
    )
}

FILE :: void
FLT_MAX :: f32.max
]]
end

function on_typedef(decl, name, text)
    if exclude_typedefs[name] then
        return nil
    end
    return ""
end

function on_macro(decl, name, value)
    if excludes[name] then
        return true, nil
    end

    local special = special_macros[name]
    if special == nil then
        return false, nil
    end

    return true, (name .. " :: " .. special)
end

function split_camel_case(name)
    local result = {}
    local temp = ""
    for i=1, #name do
        local c = name:sub(i, i)
        if c == c:upper() then
            if not (temp == "") then
                result[#result+1] = temp
                temp = ""
            end
        end
        temp = temp .. c
    end
    if not (temp == "") then
        result[#result+1] = temp
        temp = ""
    end
    return result
end

function fix_member_name(container_name, member_name)
    local member_parts = {}
    local i = 1

    local container_parts = split_camel_case(container_name)
    member_parts = split_camel_case(member_name)

    while i <= #container_parts and i <= #member_parts do
        local enum = container_parts[i]:lower()
        local member = member_parts[i]:lower()
        if not (enum == member) then
            break
        end
        i = i + 1
    end

    local result = ""
    for k=i, #member_parts do
        local part = member_parts[k]:sub(1, 1):upper() .. member_parts[k]:sub(2):lower()

        if i > 1 and i == #member_parts and part == "Bit" then
            break
        end
        result = result .. part
    end

    if (result:find("_") == 1) then
        result = result:sub(2)
    end
    if (result:find("_") == #result) then
        result = result:sub(1, #result - 1)
    end
    -- if builtin_types[result] then
    --     result = "_" .. result
    -- end

    if tonumber(result:sub(1, 1)) ~= nil then
        result = "_" .. result
    end

    return result
end

function on_enum(enum)
    if not (enum.name:find("_") == #enum.name) then
        enum.name = enum.name .. "_"
    end

    if (enum.name:find("Flags_")) or (enum.name:find("FlagsPrivate_")) then
        enum.directives[#enum.directives] = "#tag_type(i32)"
        enum.directives[#enum.directives + 1] = "#flags"
    end

    for k,v in pairs(enum.members) do
        v.name = fix_member_name(enum.name, v.name)
    end

    if (enum.name:find("_") == #enum.name) then
        enum.name = enum.name:sub(1, #enum.name - 1)
    end

    return enum
end

function on_function(decl, name)
    if name:find("_") == 1 then
        -- doesn't start with glfw*, so don't emit anything
        return true, nil
    end

    -- if exclude_functions[name] then
    --     return true, nil
    -- end
    
    return false, nil
end
