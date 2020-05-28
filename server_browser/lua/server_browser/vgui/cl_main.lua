if not CLIENT then return end

local PANEL = {
    Init = function(self)
        self:SetSize(ScrW(), ScrH())
        self:Center()
        self:SetVisible(true)
        local x, y = self:GetSize()

        local pgBase = vgui.Create("DPanel", self)
        pgBase:SetSize(x * 0.75, y * 0.75)
        pgBase:Center()
    end
}

vgui.Register("serverBrowser", PANEL)
