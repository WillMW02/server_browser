if not CLIENT then return end
serverBrowser = serverBrowser or {}

if not file.IsDir( "server_browser_materials", "DATA" ) then
    file.CreateDir "server_browser_materials"
end

serverBrowser.materials = serverBrowser.materials or {}

function loadUrl(url)
    if serverBrowser.materials[url] then return end

    local ext = string.GetExtensionFromFilename(url)
    if not ext then return end
    local _file = "server_browser_materials/" .. util.CRC(url) .. ext
    if file.Exists(_file, "DATA") then
        serverBrowser.materials[url] = Material("data/" .. _file)
        return
    end
    http.Fetch(url, function(img)
        file.Write(_file, img)
        serverBrowser.materials[url] = Material("data/" .. _file)
    end)
end