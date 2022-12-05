local reductmod = {
    drawings = {},
    connections = {},
    files = {
        "reduct/",
        "reduct/config",s
    }
}
reductmod.__index = reductmod

function reductmod:panic()
    reductmod:panicdrawing()
    reductmod:panicconnection()
end

function reductmod:newdrawing(Type,Props)
    local item = Drawing.new(Type)
    for i, v in next, Props do
        item[i] = v
    end
    table.insert(reductmod.drawings,item)
    return item
end

function reductmod:panicdrawing()
    for i = 1,#reductmod.drawings do
        reductmod.drawings[i]:Remove()
    end
end

function reductmod:newconnection(Type,Callback)
    local connection = Type:Connect(Callback)
    table.insert(reductmod.connections,connection)
    return connection
end

function reductmod:panicconnection()
    for i = 1,#reductmod.connections do
        reductmod.connections[i]:Disconnect()
    end
end

function reductmod:downloadfiles()
    if not isfolder("reduct") then
        makefolder(reductmod.files)
    end
end

function reductmod:coverstring(string,symbolLEFT,symbolRIGHT)
    if typeof(string) == "string" and typeof(symbolLEFT) == "string" and typeof(symbolRIGHT) == "string" then
        local symL = symbolLEFT
        local symR = symbolRIGHT
        local str = "L"..string.."R"

        local result1 = string.gsub(str,"L",symL)
        local result2 = string.gsub(result1,"R",symR)
        local final = result2
        return final
    end
    return final
end

function reductmod:getURL(URL)
    if typeof(URL) == "string" then
        return loadstring(game:HttpGetAsync(URL))()
    end
end

return reductmod
