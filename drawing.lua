local drawingmod = {}
drawingmod.__index = drawingmod

function drawingmod:new()
    return setmetatable({drawingstorage = {}},drawingmod)
end

function drawingmod:create(Type,Properties)
    if typeof(Properties) == "table" then else print("Error: Properties is an table!") end
    local drawingitem = Drawing.new(Type)
    for i, v in pairs(Properties) do
        drawingitem[i] = v
    end
    do
        table.insert(_G.drawmod,drawingitem)
    end
    return drawingitem
end

function drawingmod:hide()
    for i = 1, #_G.drawmod do
        local drawingitem = _G.drawmod[i]
        if drawingitem then
            drawingitem.Visible = false
        end
    end
end

function drawingmod:deleteall()
    for i = 1,#_G.drawmod do
        _G.drawmod[i]:Remove()
    end
    setmetatable(_G.drawmod,nil)
end

return drawingmod
