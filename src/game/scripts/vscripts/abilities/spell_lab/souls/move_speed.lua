if spell_lab_souls_move_speed == nil then
	spell_lab_souls_move_speed = class({})
end

LinkLuaModifier("spell_lab_souls_move_speed_modifier", "abilities/spell_lab/souls/move_speed.lua", LUA_MODIFIER_MOTION_NONE)

function spell_lab_souls_move_speed:GetIntrinsicModifierName() return "spell_lab_souls_move_speed_modifier" end


if spell_lab_souls_move_speed_modifier == nil then
	spell_lab_souls_move_speed_modifier = require "abilities/spell_lab/souls/base"
end

function spell_lab_souls_move_speed_modifier:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
    MODIFIER_EVENT_ON_DEATH
	}
	return funcs
end

function spell_lab_souls_move_speed_modifier:GetModifierMoveSpeedBonus_Constant()
	return self:GetSoulsBonus() * self:GetAbility():GetSpecialValueFor("per_soul")
end

function spell_lab_souls_move_speed_modifier:GetColour ()
	return {214,209,150}
end
