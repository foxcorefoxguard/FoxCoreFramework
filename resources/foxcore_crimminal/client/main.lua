RegisterCommand("blackmarket", function()
    TriggerEvent("foxcore_ui:open", "Black Market", "Accessing underground dealers...")
end, false)

RegisterCommand("drugsell", function()
    TriggerEvent("foxcore_criminal:dealdrugs")
end, false)

RegisterCommand("kidnap", function()
    TriggerEvent("foxcore_criminal:kidnap")
end, false)
