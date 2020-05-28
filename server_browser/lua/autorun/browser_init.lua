serverBrowser = serverBrowser or {}

if SERVER then AddCSLuaFile("server_browser/browser_config.lua") end
include("server_browser/browser_config.lua")

if SERVER then
    AddCSLuaFile("server_browser/client/cl_networking.lua")
    AddCSLuaFile("server_browser/vgui/cl_main.lua")
    AddCSLuaFile("server_browser/client/cl_utils.lua")

    include("server_browser/server/sv_hooks.lua")
    include("server_browser/server/sv_networking.lua")
else
    include("server_browser/client/cl_networking.lua")
    include("server_browser/vgui/cl_main.lua")
    include("server_browser/client/cl_utils.lua")

    for k,v in pairs(serverBrowser.servers) do
        loadUrl(v.imageUrl)
    end

end