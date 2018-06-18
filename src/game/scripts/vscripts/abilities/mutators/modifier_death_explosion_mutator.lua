--=======================================================================================
-- Generated by TypescriptToLua transpiler https://github.com/Perryvw/TypescriptToLua 
-- Date: Sun May 13 2018
--=======================================================================================
require("typescript_lualib")
--LinkLuaModifier("modifier_death_explosion_mutator","",LUA_MODIFIER_MOTION_NONE)
modifier_death_explosion_mutator = {}
modifier_death_explosion_mutator.__index = modifier_death_explosion_mutator
function modifier_death_explosion_mutator.new(construct, ...)
    local instance = setmetatable({}, modifier_death_explosion_mutator)
    if construct and modifier_death_explosion_mutator.constructor then modifier_death_explosion_mutator.constructor(instance, ...) end
    return instance
end
function modifier_death_explosion_mutator.IsPermanent(self)
    return true
end
function modifier_death_explosion_mutator.IsPurgable(self)
    return false
end
function modifier_death_explosion_mutator.IsHidden(self)
    return true
end
function modifier_death_explosion_mutator.OnCreated(self)
    self.damage_base=150
    self.damage_per_level=25
    self.aoe=300
    self.delay_ms=900
end
function modifier_death_explosion_mutator.DeclareFunctions(self)
    return {MODIFIER_EVENT_ON_DEATH}
end
function modifier_death_explosion_mutator.OnDeath(self,kv)
    if self:GetParent()==kv.unit then
        
        self:StartIntervalThink(1)
            
    end
end

function modifier_death_explosion_mutator:OnIntervalThink()
    
    local origin = self:GetParent():GetAbsOrigin()
    local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_techies/techies_land_mine_explode.vpcf", PATTACH_ABSORIGIN, self:GetParent())
    ParticleManager:SetParticleControl(particle, 0, origin)
    ParticleManager:SetParticleControl(particle, 1, origin)
    ParticleManager:SetParticleControl(particle, 2, Vector(self.aoe, 1, 1))
    ParticleManager:ReleaseParticleIndex(particle)

    local damageTable = {damage=self.damage_base+(self.damage_per_level*self:GetParent():GetLevel()),attacker=self:GetParent(),victim=self:GetParent(),damage_type=DAMAGE_TYPE_MAGICAL}

    local units = FindUnitsInRadius(DOTA_TEAM_NEUTRALS,self:GetParent():GetAbsOrigin(),nil,self.aoe,DOTA_UNIT_TARGET_TEAM_BOTH,DOTA_UNIT_TARGET_HERO+DOTA_UNIT_TARGET_BASIC,DOTA_UNIT_TARGET_FLAG_NONE,FIND_ANY_ORDER,false)

    local knockback_param ={   
        should_stun = 0,
        knockback_duration = 0.5,
        duration = 0.5,
        knockback_distance = 200 + (10 * self:GetParent():GetLevel()),
        knockback_height = 20 + (10 * self:GetParent():GetLevel()),
        center_x = origin.x,
        center_y = origin.y,
        center_z = origin.z
    }

    TS_forEach(units, function(unit)
        damageTable.victim=unit
        unit:AddNewModifier(nil,nil,"modifier_knockback",knockback_param)
    end)   

    Timers:CreateTimer(function()
        TS_forEach(units, function(unit)
            if IsValidEntity(unit) then
                damageTable.victim=unit
                ApplyDamage(damageTable)
            end
        end)
    end, DoUniqueString('damage_after_knockback'), 0.5)
    self:StartIntervalThink(-1)
end
 