local function genRandomString()
    local alphabet = "abcdefghijklmnopqrstuvwxyz"
    local randomString = ""
    for i = 1,8 do
      local randomIndex = math.random(#alphabet)
      local randomChar = alphabet:sub(randomIndex, randomIndex)
      randomString = randomString .. randomChar
    end
    return randomString
end

local decorname = genRandomString()

RegisterServerEvent("requestDecor",function()
    TriggerClientEvent("setDecor",source,decorname)
end)

RegisterNetEvent("verifyDecor",function(decor)
    if decor ~= decorname then
        DropPlayer(source,"[AntiCheat] You have been kicked for attempting to modify the decor name.")
    end
end)