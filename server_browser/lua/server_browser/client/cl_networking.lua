if not CLIENT then return end

net.Receive("toggleServerBrowser", function(len)
    if not serverBrowserPanel then
        serverBrowserPanel = vgui.Create("serverBrowser")
        serverBrowserPanel:SetVisible(false)
    end
    if serverBrowserPanel:IsVisible() then
        serverBrowserPanel:SetVisible(false)
        gui.EnableScreenClicker(false)
    else
        serverBrowserPanel:SetVisible(true)
        gui.EnableScreenClicker(true)
    end
end )