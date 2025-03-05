Jobs = {}

Jobs.List = {
    ["police"] = { name = "Police", salary = 500 },
    ["ems"] = { name = "EMS", salary = 450 },
    ["mechanic"] = { name = "Mechanic", salary = 400 },
    ["unemployed"] = { name = "Unemployed", salary = 250 }
}

function Jobs.GetJob(jobName)
    return Jobs.List[jobName] or Jobs.List["unemployed"]
end
