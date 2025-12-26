Config.Theme = {
    currentTheme = "default",
    enableOverlay = false, -- Set to false to disable the dim background overlay
    themes = {
        {
            id = "default", -- Cyan / Slate (Default)
            borderRadius = "4px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "0, 0, 0",
            fontFamily = "Inter",
            primaryBackground = "15, 23, 42",   -- Slate 900
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "30, 41, 59", -- Slate 800
            scaleOnHover = false,
            sectionFontWeight = "normal",
            smoothBackgroundTransition = false,
            primaryColor400 = "34, 211, 238", -- Cyan 400
            primaryColor500 = "6, 182, 212",  -- Cyan 500
            primaryColor600 = "8, 145, 178"   -- Cyan 600
        },
        {
            id = "crimson-red", -- Red / Dark Gray
            borderRadius = "4px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "255, 255, 255",
            fontFamily = "Inter",
            primaryBackground = "24, 24, 27",   -- Zinc 900
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "39, 39, 42", -- Zinc 800
            scaleOnHover = true,
            sectionFontWeight = "bold",
            smoothBackgroundTransition = true,
            primaryColor400 = "248, 113, 113", -- Red 400
            primaryColor500 = "239, 68, 68",   -- Red 500
            primaryColor600 = "220, 38, 38"    -- Red 600
        },
        {
            id = "emerald-green", -- Green / Dark Green Tint
            borderRadius = "6px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "255, 255, 255",
            fontFamily = "Inter",
            primaryBackground = "2, 44, 34",   -- Emerald 950 (Darker)
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "6, 78, 59", -- Emerald 900
            scaleOnHover = true,
            sectionFontWeight = "bold",
            smoothBackgroundTransition = true,
            primaryColor400 = "52, 211, 153", -- Emerald 400
            primaryColor500 = "16, 185, 129", -- Emerald 500
            primaryColor600 = "5, 150, 105"   -- Emerald 600
        },
        {
            id = "royal-purple", -- Purple / Deep Dark
            borderRadius = "8px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "255, 255, 255",
            fontFamily = "Inter",
            primaryBackground = "10, 10, 10",   -- Neutral 950
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "23, 23, 23", -- Neutral 900
            scaleOnHover = true,
            sectionFontWeight = "bold",
            smoothBackgroundTransition = true,
            primaryColor400 = "192, 132, 252", -- Purple 400
            primaryColor500 = "168, 85, 247",  -- Purple 500
            primaryColor600 = "147, 51, 234"   -- Purple 600
        },
        {
            id = "sunset-orange", -- Orange / Warm Dark
            borderRadius = "10px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "255, 255, 255",
            fontFamily = "Inter",
            primaryBackground = "28, 25, 23",   -- Stone 900
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "41, 37, 36", -- Stone 800
            scaleOnHover = true,
            sectionFontWeight = "bold",
            smoothBackgroundTransition = true,
            primaryColor400 = "251, 146, 60", -- Orange 400
            primaryColor500 = "249, 115, 22", -- Orange 500
            primaryColor600 = "234, 88, 12"   -- Orange 600
        },
        {
            id = "classic-gold", -- Gold / Black
            borderRadius = "2px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "0, 0, 0",
            fontFamily = "Inter",
            primaryBackground = "0, 0, 0",      -- Pure Black
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "20, 20, 20", -- Dark Gray
            scaleOnHover = false,
            sectionFontWeight = "normal",
            smoothBackgroundTransition = false,
            primaryColor400 = "250, 204, 21", -- Yellow 400
            primaryColor500 = "234, 179, 8",  -- Yellow 500
            primaryColor600 = "202, 138, 4"   -- Yellow 600
        },
        {
            id = "midnight-blue", -- Deep Blue
            borderRadius = "12px",
            fontColor = "255, 255, 255",
            fontColorHover = "255, 255, 255",
            fontColorSelected = "255, 255, 255",
            fontFamily = "Poppins",
            primaryBackground = "2, 6, 23",     -- Slate 950
            primaryBackgroundSelected = "255, 255, 255",
            secondaryBackground = "15, 23, 42", -- Slate 900
            scaleOnHover = true,
            sectionFontWeight = "bold",
            smoothBackgroundTransition = true,
            primaryColor400 = "96, 165, 250", -- Blue 400
            primaryColor500 = "59, 130, 246", -- Blue 500
            primaryColor600 = "37, 99, 235"   -- Blue 600
        }
    }
}
