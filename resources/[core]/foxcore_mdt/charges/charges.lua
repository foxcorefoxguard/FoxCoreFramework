-- Define the Charges table first
Charges = {}

-- 🚔 Misdemeanors (Lower-Level Offenses)
Charges.Misdemeanors = {
    -- Class C Misdemeanors (Lowest Level)
    { name = "Public Intoxication", fine = 500, jailTime = 0, points = 0 },
    { name = "Noise Complaint", fine = 500, jailTime = 0, points = 0 },
    { name = "Minor in Possession of Alcohol", fine = 500, jailTime = 0, points = 0 },
    { name = "Possession of Paraphernalia (Small Amount)", fine = 500, jailTime = 0, points = 0 },
    { name = "Simple Assault (No Injury)", fine = 500, jailTime = 0, points = 0 },
    { name = "Traffic Violation (Minor)", fine = 500, jailTime = 0, points = 1 },
    { name = "Disorderly Conduct (Minor)", fine = 500, jailTime = 0, points = 0 },

    -- Class B Misdemeanors (Moderate Level)
    { name = "Criminal Trespass", fine = 2000, jailTime = 180, points = 2 },
    { name = "Theft Under $100", fine = 2000, jailTime = 180, points = 2 },
    { name = "Driving While License Invalid", fine = 2000, jailTime = 180, points = 2 },
    { name = "Harassment", fine = 2000, jailTime = 180, points = 2 },
    { name = "Possession of Marijuana (Under 2 oz)", fine = 2000, jailTime = 180, points = 2 },
    { name = "Indecent Exposure", fine = 2000, jailTime = 180, points = 2 },
    { name = "Reckless Driving", fine = 2000, jailTime = 180, points = 2 },
    { name = "Disorderly Conduct", fine = 2000, jailTime = 180, points = 2 },
    { name = "Prostitution", fine = 2000, jailTime = 180, points = 2 },

    -- Class A Misdemeanors (Highest Level)
    { name = "Domestic Violence (First Offense)", fine = 4000, jailTime = 365, points = 3 },
    { name = "Resisting Arrest", fine = 4000, jailTime = 365, points = 3 },
    { name = "Simple Assault (Causing Injury)", fine = 4000, jailTime = 365, points = 3 },
    { name = "Theft $100-$750", fine = 4000, jailTime = 365, points = 3 },
    { name = "Assault of a Peace Officer", fine = 4000, jailTime = 365, points = 3 },
    { name = "Burglary of a Motor Vehicle", fine = 4000, jailTime = 365, points = 3 },
    { name = "Terroristic Threats", fine = 4000, jailTime = 365, points = 3 },
    { name = "Criminal Mischief", fine = 4000, jailTime = 365, points = 3 },
    { name = "Failure to Pay Child Support", fine = 4000, jailTime = 365, points = 3 },
    { name = "Violation of Protective Order", fine = 4000, jailTime = 365, points = 3 },

    -- Additional Specific Misdemeanors
    { name = "Discharging Firearm in City Limits", fine = 2000, jailTime = 180, points = 2 },
    { name = "Driving Under Suspension", fine = 2000, jailTime = 180, points = 2 },
    { name = "Gambling", fine = 2000, jailTime = 180, points = 2 },
    { name = "Writing Bad Checks", fine = 2000, jailTime = 180, points = 2 },
    { name = "Theft of Services", fine = 2000, jailTime = 180, points = 2 },
    { name = "Jumping Bail", fine = 4000, jailTime = 365, points = 3 }
}

-- 🚨 Felonies (Serious Offenses)
Charges.Felonies = {
    -- 3rd Degree Felonies
    { name = "Unauthorized Use of Motor Vehicle", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Indecency with a Child", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Stalking", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Possession of Controlled Substance (Less than 1g)", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Tampering with Evidence", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Theft $2,500-$30,000", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Deadly Conduct", fine = 10000, jailTime = 1825, points = 5 },

    -- 2nd Degree Felonies
    { name = "Aggravated Assault", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Robbery", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Manslaughter", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Sexual Assault", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Burglary of Habitation", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Possession of Controlled Substance (1-4g)", fine = 20000, jailTime = 7300, points = 7 },
    { name = "Theft $30,000-$150,000", fine = 20000, jailTime = 7300, points = 7 },

    -- 1st Degree Felonies
    { name = "Attempted Murder", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Kidnapping", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Aggravated Sexual Assault", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Aggravated Robbery", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Arson", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Possession of Controlled Substance (4-200g)", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Continuous Sexual Abuse of Child", fine = 50000, jailTime = 15600, points = 8 },
    { name = "Theft $150,000-$300,000", fine = 50000, jailTime = 15600, points = 8 },

    -- Capital Felonies
    { name = "Murder (Capital Murder)", fine = 100000, jailTime = 36500, points = 10 },
    { name = "Capital Murder", fine = 100000, jailTime = 36500, points = 10 },
    { name = "Aggravated Kidnapping", fine = 100000, jailTime = 36500, points = 10 },
    { name = "Continuous Trafficking of Persons", fine = 100000, jailTime = 36500, points = 10 },
    { name = "Treason", fine = 100000, jailTime = 36500, points = 10 },

    -- Additional High-Level Felonies
    { name = "Drug Trafficking", fine = 50000, jailTime = 15600, points = 9 },
    { name = "Money Laundering", fine = 50000, jailTime = 15600, points = 9 },
    { name = "Organized Criminal Activity", fine = 50000, jailTime = 15600, points = 9 },
    { name = "Terrorism", fine = 100000, jailTime = 36500, points = 10 }
}

-- 🚗 Traffic Violations
Charges.Traffic = {
    { name = "Speeding (1-5 MPH Over)", fine = 200, jailTime = 0, points = 1 },
    { name = "Speeding (6-10 MPH Over)", fine = 250, jailTime = 0, points = 2 },
    { name = "Reckless Driving", fine = 4000, jailTime = 30, points = 3 },
    { name = "Driving Without a License", fine = 500, jailTime = 0, points = 2 },
    { name = "DUI (First Offense)", fine = 2000, jailTime = 180, points = 4 },
    { name = "DUI (Second Offense)", fine = 4000, jailTime = 365, points = 6 },
    { name = "Evading Arrest (Misdemeanor)", fine = 4000, jailTime = 365, points = 6 }
}

-- 🔥 Additional Charges (Custom for DOJ & MDT)
Charges.Special = {
    { name = "Obstruction of Justice", fine = 10000, jailTime = 1825, points = 4 },
    { name = "Bribery of Public Servant", fine = 10000, jailTime = 1825, points = 5 },
    { name = "Terroristic Threats", fine = 10000, jailTime = 7300, points = 9 },
    { name = "Money Laundering", fine = 10000, jailTime = 7300, points = 10 }
}


-- ⚖️ Function to Get Charges Based on Type
function GetChargesByType(type)
    if Charges[type] then
        return Charges[type]
    else
        return {}
    end
end