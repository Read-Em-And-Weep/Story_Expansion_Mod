if not gods.IsKeepsakeRegistered("StoryExpansionFearForDamageKeepsake") then
gods.CreateKeepsake({
    characterName = "Nyx",
    internalKeepsakeName = "StoryExpansionFearForDamageKeepsake",

    RarityLevels = {
        Common = 1.5,
        Rare = 2.5,
        Epic = 3.5,
        Heroic = 4.5,
    },

    Keepsake = {
        displayName = "Mirror Shard",
        description = "You will deal {#UpgradeFormat} {$TooltipData.ExtractData.Multiplier:P} {#Prev} this night, but you will also take up to {#PenaltyFormat} 12 {#Prev} random {!Icons.ShrinePoint}.",
        signoffMax = "From {#AwardMaxFormat}Nyx{#Prev}{!Icons.ObjectiveSeparatorDark}Though you knew her not while growing up, you still felt her gentle embrace.",
        trayExpired = "This {$Keywords.KeepsakeAlt}'s effect has expired for this night."
    },

    Icons = {
        iconPathOverrides = {
        iconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
		maxCornerIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_small\\Demeter",
		maxIcon = "GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\KeepsakeMaxGift_big\\Demeter",
        }
    },

    ExtraFields = {
AcquireFunctionName = _PLUGIN.guid..".GainRandomFear",
		AcquireFunctionArgs = 
		{
			FearAmount = 12,
		},    
        AddOutgoingDamageModifiers = {
            GameStateMultiplier = {
                BaseValue = 1.1,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},

            },
            ReportValues = {ReportedMultiplier = "GameStateMultiplier"}
        },
    },

    ExtractValues = {
        {
            Key = "ReportedMultiplier",
            ExtractAs = "Multiplier",
            Format = "PercentDelta",
        }
    },

    customGiftData = {
		maxRequirement = {PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift08" },},
		minRequirement = {PathTrue = { "GameState", "TextLinesRecord", "DemeterGift01" },},
	},

})
end

gods.CreateBoon({
    internalBoonName = "StoryExpansionFearForDamageKeepsakePermanent",
    InheritFrom = {},
    characterName = "NPC_Nyx_Hub_StoryExpansion",
    BlockStacking = true,
    reuseBaseIcons = true,
    boonIconPath = "GUI\\Screens\\AwardMenu\\Keepsake_49",
    displayName = "Mirror Shard",
    description = "You will deal {#UpgradeFormat} {$TooltipData.ExtractData.Multiplier:P} {#Prev} this night, but you will also take {#PenaltyFormat} 12 {#Prev} random {!Icons.ShrinePoint}.",
    RarityLevels = {
        Common = 1.5,
        Rare = 2.5,
        Epic = 3.5,
        Heroic = 4.5,

    },
ExtraFields = {
    		FrameRarities =
		{
			Common = "Frame_Keepsake_Rank1",
			Rare = "Frame_Keepsake_Rank2",
			Epic = "Frame_Keepsake_Rank3",
			Heroic = "Frame_Keepsake_Rank4",
		},
		PreCreateActiveOverlay = true,

		HideInRunHistory = true,
		CustomRarityLevels =
		{
			"TraitLevel_Keepsake1",
			"TraitLevel_Keepsake2",
			"TraitLevel_Keepsake3",
			"TraitLevel_Keepsake4",
		},
		RecordCacheOnEquip = true,
		InfoBackingAnimation = "KeepsakeSlotBase",

		PinAnimationIn = "TraitPinIn_Keepsake",
		PinAnimationOut = "TraitPinOut_Keepsake",
		TrayHighlightAnimScale = 1.2,

		TrayTextBackingAnimation = "TraitTray_LevelBacking_Alt",
		TrayTextBackingOffsetY = 9,
		TrayTextOffsetY = -10,
		NewTraitHighlightAnimation = "NewTraitHighlightKeepsake",
AddOutgoingDamageModifiers = {
            GameStateMultiplier = {
                BaseValue = 1.1,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},

            },
            ReportValues = {ReportedMultiplier = "GameStateMultiplier"}
        },
    },
    ExtractValues =
		{
			 {
            Key = "ReportedMultiplier",
            ExtractAs = "Multiplier",
            Format = "PercentDelta",
        }
		}
})