Utils = {}

-- Random Reward Calculation
function Utils.CalculateReward(base, multiplier)
    return math.random(base, base * multiplier)
end
