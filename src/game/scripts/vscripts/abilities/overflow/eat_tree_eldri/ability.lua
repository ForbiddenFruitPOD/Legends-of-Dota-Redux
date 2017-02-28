if eat_tree_eldri == nil then
	eat_tree_eldri = class({})
end
LinkLuaModifier("eat_tree_eldri_mod", "abilities/overflow/eat_tree_eldri/modifier.lua", LUA_MODIFIER_MOTION_NONE)

function eat_tree_eldri:GetCastAnimation()
	return ACT_DOTA_CAST_ABILITY_1
end

function eat_tree_eldri:GetAbilityType()
	return DOTA_ABILITY_TYPE_ULTIMATE
end

function eat_tree_eldri:OnSpellStart()
	local treeMod = self:GetCaster():FindModifierByName("eat_tree_eldri_mod")
	if treeMod then
		local stacks = self:GetCaster():FindModifierByName("eat_tree_eldri_mod"):GetStackCount()
		print(stacks)
		cost = stacks * self:GetSpecialValueFor("mana_cost_per_stack")
		playersMana = self:GetCaster():GetMana()
		if playersMana < cost then return end
		self:GetCaster():SetMana(playersMana - cost)
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_MANA_LOSS, self:GetCaster(), cost, nil)
	end

	

	--print(self:GetAbilityIndex())
	GridNav:DestroyTreesAroundPoint( self:GetCursorPosition() , 1, true)
	EmitSoundOnLocationWithCaster( self:GetCaster():GetOrigin(), "Hero_Omniknight.GuardianAngel", self:GetCaster() )
	self:GetCaster():AddNewModifier( self:GetCaster(), self, "eat_tree_eldri_mod", { duration = self:GetSpecialValueFor("duration") , stack = 1 } )
end

function eat_tree_eldri:GetBehavior()
	local behav = DOTA_ABILITY_BEHAVIOR_UNIT_TARGET
	return behav
end