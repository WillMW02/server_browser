if not SERVER then return end
serverBrowser = serverBrowser or {}

hook.Add("PlayerSay", "handleChatCommand", function (ply, text)
    local _cmd = string.Explode(" ", text)
    if #_cmd > 0 and _cmd[1] == serverBrowser.command then
        net.Start("toggleServerBrowser")
        net.Send(ply)
    end
end)