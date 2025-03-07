Citizen.CreateThread(function()
    while true do
        Citizen.Wait(600000) -- Interest applies every 10 minutes

        MySQL.query("SELECT identifier, savings, interest_rate FROM banking_accounts", {}, function(results)
            for _, row in pairs(results) do
                if row.savings > 0 then
                    local interest = math.floor(row.savings * row.interest_rate)
                    MySQL.execute("UPDATE banking_accounts SET savings = savings + ? WHERE identifier = ?", {interest, row.identifier})
                    print("[Bank] Applied $" .. interest .. " interest to " .. row.identifier)
                end
            end
        end)
    end
end)
