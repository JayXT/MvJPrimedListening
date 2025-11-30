local mp = require('mp')

local function read_yesno(name)
    local p = mp.command_native({ "expand-path", "~~/mpv.conf" })
    local f = io.open(p, "r")
    if not f then return nil end
    name = name:lower()
    for l in f:lines() do
        l = (l:gsub("#.*","")):match("^%s*(.-)%s*$")
        local k,v = l:match("^(.-)%s*=%s*(.-)%s*$")
        if k and v and k:lower() == name then
            f:close()
            v = v:lower()
            if v == "yes" then return true end
            if v == "no"  then return false end
            return nil
        end
    end
    f:close()
end

local enabled = read_yesno("mvj-primed-listening") or false

local post_delay = 0.3
local timer, post_timer, was_playing, hiding, last_sub = nil, nil, false, false, nil

local function cancel()
    if timer then timer:kill() end
    if post_timer then post_timer:kill() end
    timer, post_timer, was_playing = nil, nil, false
end

local function char_count(s)
    if not s then return 0 end

    local need_strip = s:find("{") or s:find("<")
    if type(utf8) == "table" and type(utf8.len) == "function" then
        if need_strip then s = s:gsub("{.-}", ""):gsub("<.->", "") end
        return utf8.len(s)
    end
    if need_strip then s = s:gsub("{.-}", ""):gsub("<.->", "") end
    local bytes = #s
    local cont = select(2, s:gsub('[\128-\191]', ''))
    return bytes - cont
end

local function choose_pause(len)
    if len < 12 then return 1
    elseif len < 30 then return 2
    elseif len < 55 then return 3
    else return 4
    end
end

local function sub_change(_, val)
    if not enabled then return end
    if val and val ~= "" then
        if hiding then
            mp.set_property_bool("sub-visibility", true)
            hiding = false
        end
        if val ~= last_sub then
            last_sub = val
            if not mp.get_property_bool("pause") then
                was_playing = true
                mp.set_property_bool("pause", true)
                if timer then timer:kill() end
                if post_timer then post_timer:kill() end
                local len = char_count(val)
                local pause_time = choose_pause(len)
                timer = mp.add_timeout(pause_time, function()
                    hiding = true
                    mp.set_property_bool("sub-visibility", false)
                    timer = nil
                    post_timer = mp.add_timeout(post_delay, function()
                        if was_playing and mp.get_property_bool("pause") then
                            mp.set_property_bool("pause", false)
                        end
                        post_timer = nil
                    end)
                end)
            end
        end
    else
        last_sub = nil
    end
end

local function toggle()
    enabled = not enabled
    mp.osd_message("MvJ Primed Listening Mode: " .. (enabled and "ON" or "OFF"), 3)
    if not enabled then
        cancel()
        if hiding then mp.set_property_bool("sub-visibility", true) end
        if was_playing and mp.get_property_bool("pause") then
            mp.set_property_bool("pause", false)
        end
        hiding, was_playing, last_sub = false, false, nil
    end
end

mp.observe_property("sub-text", "string", sub_change)
mp.add_key_binding("Alt+p", "mvj-primed-listening-toggle", toggle)
mp.register_event("end-file", function()
    cancel()
    if hiding then mp.set_property_bool("sub-visibility", true) end
end)
