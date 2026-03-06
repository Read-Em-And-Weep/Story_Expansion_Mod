mod.newOtherDenizensCodexData = {
    NPC_Orpheus_Hub_StoryExpansion = {
        Entries = {
            {
			UnlockGameStateRequirements =
				{
					{
								PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingOrpheusDialogue" },
					},
				},
			Text = "CodexData_Orpheus_01",
			},
        },
        Image = "Codex_Portrait_Orpheus",
    },
    NPC_Thanatos_Hub_StoryExpansion = {
        Entries =
				{
					{
						UnlockGameStateRequirements =
						{
							{
								PathTrue = { "GameState", "TextLinesRecord", "StoryExpansionFreeingThanatosDialogue" },
							},
						},
						Text = "CodexData_Thanatos_01",
					},
				},
				Image = "Codex_Portrait_Thanatos",
                BoonInfoEnemyName = "NPC_Thanatos_Field_StoryExpansion",
    }
}

for key, data in pairs(mod.newOtherDenizensCodexData) do
    CodexData.OtherDenizens.Entries[key] = data
    table.insert(CodexOrdering.OtherDenizens, key)
end