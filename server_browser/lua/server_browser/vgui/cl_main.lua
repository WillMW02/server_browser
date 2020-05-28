if not CLIENT then return end
serverBrowser = serverBrowser or {}
serverBrowser.materials = serverBrowser.materials or {}

local PANEL = {
    Init = function(self)
        self:SetSize(ScrW(), ScrH())
        self:Center()
        self:SetVisible(true)

        local x, y = self:GetSize()
        local pgBase = vgui.Create("DPanel", self)
        pgBase:SetSize(x * 0.75, y * 0.75)
        pgBase:Center()
        pgBase.Paint = function(self, w, h)
            surface.SetDrawColor(70,70,70)
            surface.DrawRect(0, 0, w, h)
        end

        x,y = pgBase:GetSize()
        local serverList = vgui.Create("DScrollPanel", pgBase)
        serverList:SetSize(x, y * 0.9)
        serverList:SetPos(0, y * 0.075)

        x, y = serverList:GetSize()
        for k,v in pairs(serverBrowser.servers) do
            local numberAcross = 4
            local width = x / 4.5
            local height = y / 1.5
            local padding = (x - (numberAcross * width)) / (numberAcross + 1)
            local column = (k - 1) % numberAcross
            local row = math.floor((k - 1) / numberAcross)

            local server = vgui.Create("DPanel", serverList)
            server:SetPos(padding + (column * (width + padding)), padding + (row * (height + padding)))
            server:SetSize(width, height)
            server.Paint = function(self, w, h)
                surface.SetDrawColor(90,90,90)
                surface.DrawRect(0, 0, w, h)
            end

        end
    end
}

vgui.Register("serverBrowser", PANEL)
