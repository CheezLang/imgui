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

excludes = {
    IMGUI_IMPL_API = true,
    ImDrawCallback_ResetRenderState = true,
    IMGUI_CDECL = true,
    ImQsort = true,
    IM_TABSIZE = true,
    IM_NEWLINE = true,
    BENIGN_RACE_BEGIN         = true,
    BENIGN_RACE_END           = true,
    NO_COMPETING_THREAD_BEGIN = true,
    NO_COMPETING_THREAD_END   = true,
    NULL                      = true,
    errno                     = true,
    INT8_MIN                  = true,
    INT16_MIN                 = true,
    INT32_MIN                 = true,
    INT64_MIN                 = true,
    INT8_MAX                  = true,
    INT16_MAX                 = true,
    INT32_MAX                 = true,
    INT64_MAX                 = true,
    UINT8_MAX                 = true,
    UINT16_MAX                = true,
    UINT32_MAX                = true,
    UINT64_MAX                = true,
    INT_LEAST8_MIN            = true,
    INT_LEAST16_MIN           = true,
    INT_LEAST32_MIN           = true,
    INT_LEAST64_MIN           = true,
    INT_LEAST8_MAX            = true,
    INT_LEAST16_MAX           = true,
    INT_LEAST32_MAX           = true,
    INT_LEAST64_MAX           = true,
    UINT_LEAST8_MAX           = true,
    UINT_LEAST16_MAX          = true,
    UINT_LEAST32_MAX          = true,
    UINT_LEAST64_MAX          = true,
    INT_FAST8_MIN             = true,
    INT_FAST16_MIN            = true,
    INT_FAST32_MIN            = true,
    INT_FAST64_MIN            = true,
    INT_FAST8_MAX             = true,
    INT_FAST16_MAX            = true,
    INT_FAST32_MAX            = true,
    INT_FAST64_MAX            = true,
    UINT_FAST8_MAX            = true,
    UINT_FAST16_MAX           = true,
    UINT_FAST32_MAX           = true,
    UINT_FAST64_MAX           = true,
    INTPTR_MIN                = true,
    INTPTR_MAX                = true,
    UINTPTR_MAX               = true,
    INTMAX_MIN                = true,
    INTMAX_MAX                = true,
    UINTMAX_MAX               = true,
    PTRDIFF_MIN               = true,
    PTRDIFF_MAX               = true,
    SIZE_MAX                  = true,
    SIG_ATOMIC_MIN            = true,
    SIG_ATOMIC_MAX            = true,
    WCHAR_MIN                 = true,
    WCHAR_MAX                 = true,
    WINT_MIN                  = true,
    WINT_MAX                  = true,
    VULKAN_CORE_H_            = true,
    va_list                   = true,
    ptrdiff_t                 = true,
    intptr_t                  = true,
    __vcrt_bool               = true,
    __crt_bool                = true,
    errno_t                   = true,
    wint_t                    = true,
    wctype_t                  = true,
    __time32_t                = true,
    __time64_t                = true,
    __crt_locale_data_public  = true,
    __crt_locale_pointers     = true,
    _locale_t                 = true,
    _Mbstatet                 = true,
    mbstate_t                 = true,
    time_t                    = true,
    rsize_t                   = true,
    int_least8_t              = true,
    int_least16_t             = true,
    int_least32_t             = true,
    int_least64_t             = true,
    uint_least8_t             = true,
    uint_least16_t            = true,
    uint_least32_t            = true,
    uint_least64_t            = true,
    int_fast8_t               = true,
    int_fast16_t              = true,
    int_fast32_t              = true,
    int_fast64_t              = true,
    uint_fast8_t              = true,
    uint_fast16_t             = true,
    uint_fast32_t             = true,
    uint_fast64_t             = true,
    intmax_t                  = true,
    uintmax_t                 = true,
    __crt_locale_data_public  = true,
    __crt_locale_pointers     = true,
    _Mbstatet                 = true,
    stdin                         = true,
    stdout                        = true,
    stderr                        = true,
    WEOF                          = true,
    BUFSIZ                        = true,
    EOF                           = true,
    L_tmpnam                      = true,
    L_tmpnam_s                    = true,
    SEEK_CUR                      = true,
    SEEK_END                      = true,
    SEEK_SET                      = true,
    FILENAME_MAX                  = true,
    FOPEN_MAX                     = true,
    TMP_MAX                       = true,
    TMP_MAX_S                     = true,
    SYS_OPEN                      = true,
    CHAR_BIT                      = true,
    SCHAR_MIN                     = true,
    SCHAR_MAX                     = true,
    UCHAR_MAX                     = true,
    CHAR_MIN                      = true,
    CHAR_MAX                      = true,
    MB_LEN_MAX                    = true,
    SHRT_MIN                      = true,
    SHRT_MAX                      = true,
    USHRT_MAX                     = true,
    INT_MIN                       = true,
    INT_MAX                       = true,
    UINT_MAX                      = true,
    LONG_MIN                      = true,
    LONG_MAX                      = true,
    ULONG_MAX                     = true,
    LLONG_MAX                     = true,
    LLONG_MIN                     = true,
    ULLONG_MAX                    = true,
    RSIZE_MAX                     = true,
    EXIT_SUCCESS                  = true,
    EXIT_FAILURE                  = true,
    onexit_t                      = true,
    RAND_MAX                      = true,
    MB_CUR_MAX                    = true,
    sys_errlist                   = true,
    sys_nerr                      = true,
    environ                       = true,
    INFINITY                      = true,
    HUGE_VAL                      = true,
    HUGE_VALF                     = true,
    HUGE_VALL                     = true,
    NAN                           = true,
    FP_INFINITE                   = true,
    FP_NAN                        = true,
    FP_NORMAL                     = true,
    FP_SUBNORMAL                  = true,
    FP_ZERO                       = true,
    FP_ILOGB0                     = true,
    FP_ILOGBNAN                   = true,
    MATH_ERRNO                    = true,
    MATH_ERREXCEPT                = true,
    math_errhandling              = true,
    DOMAIN                        = true,
    SING                          = true,
    OVERFLOW                      = true,
    UNDERFLOW                     = true,
    TLOSS                         = true,
    PLOSS                         = true,
    matherr                       = true,
    STB_TEXTEDIT_STRING           = true,
    STB_TEXTEDIT_CHARTYPE         = true,
    STB_TEXTEDIT_GETWIDTH_NEWLINE = true,
    STB_TEXTEDIT_UNDOSTATECOUNT   = true,
    STB_TEXTEDIT_UNDOCHARCOUNT    = true,
    STB_TEXTEDIT_POSITIONTYPE     = true,
    FLT_EVAL_METHOD    = true,
    DBL_DECIMAL_DIG    = true,
    DBL_DIG            = true,
    DBL_EPSILON        = true,
    DBL_HAS_SUBNORM    = true,
    DBL_MANT_DIG       = true,
    DBL_MAX            = true,
    DBL_MAX_10_EXP     = true,
    DBL_MAX_EXP        = true,
    DBL_MIN            = true,
    DBL_MIN_10_EXP     = true,
    DBL_MIN_EXP        = true,
    DBL_TRUE_MIN       = true,
    FLT_DECIMAL_DIG    = true,
    FLT_DIG            = true,
    FLT_EPSILON        = true,
    FLT_HAS_SUBNORM    = true,
    FLT_GUARD          = true,
    FLT_MANT_DIG       = true,
    FLT_MAX            = true,
    FLT_MAX_10_EXP     = true,
    FLT_MAX_EXP        = true,
    FLT_MIN            = true,
    FLT_MIN_10_EXP     = true,
    FLT_MIN_EXP        = true,
    FLT_NORMALIZE      = true,
    FLT_RADIX          = true,
    FLT_TRUE_MIN       = true,
    LDBL_DIG           = true,
    LDBL_EPSILON       = true,
    LDBL_HAS_SUBNORM   = true,
    LDBL_MANT_DIG      = true,
    LDBL_MAX           = true,
    LDBL_MAX_10_EXP    = true,
    LDBL_MAX_EXP       = true,
    LDBL_MIN           = true,
    LDBL_MIN_10_EXP    = true,
    LDBL_MIN_EXP       = true,
    LDBL_TRUE_MIN      = true,
    DECIMAL_DIG        = true,
    FLT_ROUNDS         = true,
    clear87            = true,
    status87           = true,
    control87          = true,
    DBL_RADIX          = true,
    DBL_ROUNDS         = true,
    LDBL_RADIX         = true,
    LDBL_ROUNDS        = true,
    EM_AMBIGUIOUS      = true,
    EM_AMBIGUOUS       = true,
    MCW_EM             = true,
    EM_INVALID         = true,
    EM_DENORMAL        = true,
    EM_ZERODIVIDE      = true,
    EM_OVERFLOW        = true,
    EM_UNDERFLOW       = true,
    EM_INEXACT         = true,
    MCW_IC             = true,
    IC_AFFINE          = true,
    IC_PROJECTIVE      = true,
    MCW_RC             = true,
    RC_CHOP            = true,
    RC_UP              = true,
    RC_DOWN            = true,
    RC_NEAR            = true,
    MCW_PC             = true,
    PC_24              = true,
    PC_53              = true,
    PC_64              = true,
    CW_DEFAULT         = true,
    SW_INVALID         = true,
    SW_DENORMAL        = true,
    SW_ZERODIVIDE      = true,
    SW_OVERFLOW        = true,
    SW_UNDERFLOW       = true,
    SW_INEXACT         = true,
    SW_UNEMULATED      = true,
    SW_SQRTNEG         = true,
    SW_STACKOVERFLOW   = true,
    SW_STACKUNDERFLOW  = true,
    FPE_INVALID        = true,
    FPE_DENORMAL       = true,
    FPE_ZERODIVIDE     = true,
    FPE_OVERFLOW       = true,
    FPE_UNDERFLOW      = true,
    FPE_INEXACT        = true,
    FPE_UNEMULATED     = true,
    FPE_SQRTNEG        = true,
    FPE_STACKOVERFLOW  = true,
    FPE_STACKUNDERFLOW = true,
    FPE_EXPLICITGEN    = true,
    va_start           = true,
    va_arg             = true,
    va_end             = true,
    EPERM              = true,
    ENOENT             = true,
    ESRCH              = true,
    EINTR              = true,
    EIO                = true,
    ENXIO              = true,
    E2BIG              = true,
    ENOEXEC            = true,
    EBADF              = true,
    ECHILD             = true,
    EAGAIN             = true,
    ENOMEM             = true,
    EACCES             = true,
    EFAULT             = true,
    EBUSY              = true,
    EEXIST             = true,
    EXDEV              = true,
    ENODEV             = true,
    ENOTDIR            = true,
    EISDIR             = true,
    ENFILE             = true,
    EMFILE             = true,
    ENOTTY             = true,
    EFBIG              = true,
    ENOSPC             = true,
    ESPIPE             = true,
    EROFS              = true,
    EMLINK             = true,
    EPIPE              = true,
    EDOM               = true,
    EDEADLK            = true,
    ENAMETOOLONG       = true,
    ENOLCK             = true,
    ENOSYS             = true,
    ENOTEMPTY          = true,
    EINVAL             = true,
    ERANGE             = true,
    EILSEQ             = true,
    STRUNCATE          = true,
    EDEADLOCK          = true,
    EADDRINUSE         = true,
    EADDRNOTAVAIL      = true,
    EAFNOSUPPORT       = true,
    EALREADY           = true,
    EBADMSG            = true,
    ECANCELED          = true,
    ECONNABORTED       = true,
    ECONNREFUSED       = true,
    ECONNRESET         = true,
    EDESTADDRREQ       = true,
    EHOSTUNREACH       = true,
    EIDRM              = true,
    EINPROGRESS        = true,
    EISCONN            = true,
    ELOOP              = true,
    EMSGSIZE           = true,
    ENETDOWN           = true,
    ENETRESET          = true,
    ENETUNREACH        = true,
    ENOBUFS            = true,
    ENODATA            = true,
    ENOLINK            = true,
    ENOMSG             = true,
    ENOPROTOOPT        = true,
    ENOSR              = true,
    ENOSTR             = true,
    ENOTCONN           = true,
    ENOTRECOVERABLE    = true,
    ENOTSOCK           = true,
    ENOTSUP            = true,
    EOPNOTSUPP         = true,
    EOTHER             = true,
    EOVERFLOW          = true,
    EOWNERDEAD         = true,
    EPROTO             = true,
    EPROTONOSUPPORT    = true,
    EPROTOTYPE         = true,
    ETIME              = true,
    ETIMEDOUT          = true,
    ETXTBSY            = true,
    EWOULDBLOCK        = true,
    wcswcs             = true
}

special_macros = {
}

exclude_typedefs = {
    ImGuiDataAuthority = true,
    ImGuiLayoutType = true,
    ImGuiButtonFlags = true,
    ImGuiColumnsFlags = true,
    ImGuiItemFlags = true,
    ImGuiItemStatusFlags = true,
    ImGuiNavHighlightFlags = true,
    ImGuiNavDirSourceFlags = true,
    ImGuiNavMoveFlags = true,
    ImGuiNextItemDataFlags = true,
    ImGuiNextWindowDataFlags = true,
    ImGuiSeparatorFlags = true,
    ImGuiTextFlags = true,
    ImGuiTooltipFlags = true,
    ImDrawCornerFlags = true,
    ImDrawListFlags = true,
    ImFontAtlasFlags = true,
    ImGuiBackendFlags = true,
    ImGuiColorEditFlags = true,
    ImGuiConfigFlags = true,
    ImGuiComboFlags = true,
    ImGuiDockNodeFlags = true,
    ImGuiDragDropFlags = true,
    ImGuiFocusedFlags = true,
    ImGuiHoveredFlags = true,
    ImGuiInputTextFlags = true,
    ImGuiKeyModFlags = true,
    ImGuiPopupFlags = true,
    ImGuiSelectableFlags = true,
    ImGuiSliderFlags = true,
    ImGuiTabBarFlags = true,
    ImGuiTabItemFlags = true,
    ImGuiTreeNodeFlags = true,
    ImGuiViewportFlags = true,
    ImGuiWindowFlags = true,
    ImGuiCol = true,
    ImGuiCond = true,
    ImGuiDataType = true,
    ImGuiDir = true,
    ImGuiKey = true,
    ImGuiNavInput = true,
    ImGuiMouseButton = true,
    ImGuiMouseCursor = true,
    ImGuiStyleVar = true
}

function on_typedef(decl, name, text)
    if exclude_typedefs[name] then
        return ""
    end
    return nil
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
