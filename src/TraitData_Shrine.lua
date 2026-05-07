local newMetaUpgrades = {
    StoryExpansionNoManaMetaUpgrade = {
        Name = "StoryExpansionNoManaMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				Multiply = 100,
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 0.25 },
			{ Points = 1, ChangeValue = 0.5 },
			{Points = 1, ChangeValue = 0.75},
			{Points = 2, ChangeValue = 1}
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionNoManaMetaUpgrade_Flavor",
    },
	StoryExpansionHammerlessMetaUpgrade = {
        Name = "StoryExpansionHammerlessMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 3, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionHammerlessMetaUpgrade_Flavor",
    },
	StoryExpansionLowManaStartMetaUpgrade = {
        Name = "StoryExpansionLowManaStartMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Multiply = -100,
				Add = 100,
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionLowManaStartMetaUpgrade_Flavor",
    },
	StoryExpansionEnemyDodgeMetaUpgrade = {
        Name = "StoryExpansionEnemyDodgeMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				Multiply = 100,
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 0.03 },
			{ Points = 1, ChangeValue = 0.06 },
			{ Points = 2, ChangeValue = 0.09 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionEnemyDodgeMetaUpgrade_Flavor",
    },
	StoryExpansionEclipseMetaUpgrade = {
        Name = "StoryExpansionEclipseMetaUpgrade",
		IneligibleForCirceRemoval = true,
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionEclipseMetaUpgrade_Flavor",
    },
	StoryExpansionFirstHitMetaUpgrade = {
        Name = "StoryExpansionFirstHitMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				Multiply = 100,
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 1 },
			{ Points = 2, ChangeValue = 3 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionFirstHitMetaUpgrade_Flavor",
    },
	StoryExpansionBlindRewardMetaUpgrade = {
        Name = "StoryExpansionBlindRewardMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				Multiply = 100,
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 0.25 },
			{ Points = 2, ChangeValue = 0.5 },
			{Points = 2, ChangeValue = 0.75},
			{Points = 3, ChangeValue = 1}
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionBlindRewardMetaUpgrade_Flavor",
    },
	StoryExpansionPurgingMetaUpgrade = {
        Name = "StoryExpansionPurgingMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionPurgingMetaUpgrade_Flavor",
    },
	StoryExpansionNoElementsMetaUpgrade = {
        Name = "StoryExpansionNoElementsMetaUpgrade",
		IneligibleForCirceRemoval = true,
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 2, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionNoElementsMetaUpgrade_Flavor",
    },
	StoryExpansionTaxMetaUpgrade = {
        Name = "StoryExpansionTaxMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 10 },
			{ Points = 1, ChangeValue = 15 },
			{ Points = 2, ChangeValue = 20 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionTaxMetaUpgrade_Flavor",
    },
	StoryExpansionNoHelpMetaUpgrade = {
        Name = "StoryExpansionNoHelpMetaUpgrade",
		IneligibleForCirceRemoval = true,
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 2, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionNoHelpMetaUpgrade_Flavor",
    },
	StoryExpansionPomLevelsMetaUpgrade = {
        Name = "StoryExpansionPomLevelsMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 2, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionPomLevelsMetaUpgrade_Flavor",
    },
	StoryExpansionExpirationMetaUpgrade = {
        Name = "StoryExpansionExpirationMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				Multiply = 100,
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 0.25 },
			{ Points = 1, ChangeValue = 0.5 },
			{ Points = 2, ChangeValue = 0.75 },
			{ Points = 2, ChangeValue = 1 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionExpirationMetaUpgrade_Flavor",
    },
	StoryExpansionKeepsakeLevelMetaUpgrade = {
        Name = "StoryExpansionKeepsakeLevelMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		IneligibleForCirceRemoval = true,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 2, ChangeValue = 1 },
			{ Points = 3, ChangeValue = 2 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		OnDisabledFunctionName = _PLUGIN.guid..".ReupgradeKeepsake",
		FlavorText = "StoryExpansionKeepsakeLevelMetaUpgrade_Flavor",
    },
	StoryExpansionLoweredRarityMetaUpgrade = {
        Name = "StoryExpansionLoweredRarityMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 3, ChangeValue = 1 },
			{ Points = 1, ChangeValue = 2 },
			{Points = 1, ChangeValue = 3}
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionLoweredRarityMetaUpgrade_Flavor",
    },
	StoryExpansionLessChoicesMetaUpgrade = {
        Name = "StoryExpansionLessChoicesMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 2, ChangeValue = 1 },
			{ Points = 3, ChangeValue = 2 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionLessChoicesMetaUpgrade_Flavor",
    },
	StoryExpansionDevotionWeaponMetaUpgrade = {
        Name = "StoryExpansionDevotionWeaponMetaUpgrade",
        InheritFrom = { "BaseMetaUpgrade", },
		Icon = "ShrineIcon_PrimeUpgrade",
		InactiveChangeValue = 0.0,
		UseWideAnimations = true,
		IneligibleForCirceRemoval = true,
		SimpleExtractValues =
		{
			{
				Property = "ChangeValue",
				NewProperty = "DisplayValue",
			},
		},
		Ranks =
		{
			{ Points = 1, ChangeValue = 1 },
			{ Points = 2, ChangeValue = 2 },
			{ Points = 3, ChangeValue = 3 },
			{ Points = 4, ChangeValue = 4 },
		},
		SelectedVoiceLines =
		{
			PlayOnceFromTableThisRun = true,
			PreLineWait = 0.65,
			UsePlayerSource = true,
			SkipAnim = true,
			SuccessiveChanceToPlay = 0.35,
			Cooldowns =
			{
				{ Name = "MelinoeShrineUpgradeSpeech", Time = 4 },
			},

			-- { Cue = "/VO/Melinoe_2893", Text = "{#Emph}Bask in Pain." },
		},
		FlavorText = "StoryExpansionDevotionWeaponMetaUpgrade_Flavor",
    },
}

for newMetaUpgradeName, newMetaUpgradeData in pairs(newMetaUpgrades) do
    game.ProcessDataInheritance(newMetaUpgradeData, game.MetaUpgradeData)
    game.MetaUpgradeData[newMetaUpgradeName]=newMetaUpgradeData
	game.MetaUpgradeData[newMetaUpgradeName].Name = newMetaUpgradeName
end

modutil.mod.Path.Wrap("ProcessSimpleExtractValues", function(base,data)
	if Contains({"StoryExpansionHammerlessMetaUpgrade","StoryExpansionEclipseMetaUpgrade", "StoryExpansionNoHelpMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			if newValue == 1 then
				newValue = "will not"
			else
				newValue = "may"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end
	elseif Contains({"StoryExpansionPurgingMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			if newValue == 1 then
				newValue = "be forced"
			else
				newValue = "not be forced"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end
	elseif Contains({"StoryExpansionNoElementsMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			if newValue == 1 then
				newValue = "will no longer"
			else
				newValue = "will"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end
	--[[elseif Contains({ "StoryExpansionBlindRewardMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			if newValue == 1 then
				newValue = "will"
			else
				newValue = "will not"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end]]
	elseif Contains({"StoryExpansionPomLevelsMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			if newValue == 1 then
				newValue = "will"
			else
				newValue = "will not"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end
	elseif Contains({"StoryExpansionLoweredRarityMetaUpgrade"}, data.Name) then
		for i, extractData in ipairs( data.SimpleExtractValues ) do
			local originalValue = data[extractData.Property]
			local newValue = originalValue
			
			if newValue == 1 then
				newValue = "{#EpicFormat}Epic{#Prev}"
			elseif newValue == 2 then
				newValue = "{#RareFormat}Rare{#Prev}"
			elseif newValue == 3 then
				newValue = "{#CommonFormat}{#BoldFormat}Common{#Prev}{#Prev}"
			else
				newValue = "{#LegendaryFormat}Legendary{#Prev}"
			end
			--DebugPrint({ Text = "newValue = "..newValue })
			data[extractData.NewProperty] = newValue
		end
	else
		return base(data)
	end
end)