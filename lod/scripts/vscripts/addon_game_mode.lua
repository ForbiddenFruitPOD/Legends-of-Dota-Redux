-- Check if they are trying to load into remote LoD mode
if GetMapName() == 'connect_to_ash47' then
    print("Connected to one of ash47's servers...")
    SendToServerConsole("connect lod.ash47.net")

    return
end

-- Should we load dedicated config?
if LoadKeyValues('cfg/dedicated.kv') then
    require('dedicated')
end

-- Ensure lod exists
if _G.lod == nil then
    _G.lod = class({})

    -- Checks if we are running in source1, or 2
    local isSource1 = Convars:GetStr('dota_local_addon_game') ~= nil
	function _G.lod:isSource1()
	    return isSource1
	end
end

-- Stat collection
require('lib.statcollection')
statcollection.addStats({
	modID = '2374504c2c518fafc9731a120e67fdf5'
})

-- Init load helper
require('lib.loadhelper')

-- Load modules
require('lod')

if lod == nil then
	print('LOD FAILED TO INIT!')
	return
end

-- Precaching
function Precache(context)
	--[[print('Beginning to precache')

	-- Particle Folders
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ancient_apparition", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_antimage", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_axe", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bane", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_beastmaster", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bloodseeker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_chen", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_crystal_maiden", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_dark_seer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_dazzle", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_dragon_knight", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_doom_bringer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_drow_ranger", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_earthshaker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_enchantress", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_enigma", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_faceless_void", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_furion", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_juggernaut", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_kunkka", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_leshrac", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lich", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_life_stealer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lina", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lion", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_mirana", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_morphling", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_necrolyte", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_nevermore", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_night_stalker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_omniknight", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_puck", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_pudge", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_pugna", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_rattletrap", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_razor", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_riki", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_sand_king", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_shadow_shaman", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_slardar", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_sniper", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_spectre", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_storm_spirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_sven", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_tidehunter", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_tinker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_tiny", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_vengefulspirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_venomancer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_viper", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_weaver", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_windrunner", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_witch_doctor", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_zuus", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_broodmother", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_skeleton_king", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_queenofpain", context)
	--PrecacheResource("particle_folder", "particles/units/heroes/hero_huskar", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_jakiro", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_batrider", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_warlock", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_alchemist", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_death_prophet", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ursa", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bounty_hunter", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_silencer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_spirit_breaker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_invoker", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_clinkz", context)
	--PrecacheResource("particle_folder", "particles/units/heroes/hero_obsidian_destroyer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_shadow_demon", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lycan", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_lone_druid", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_brewmaster", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_phantom_lancer", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_treant", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ogre_magi", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_chaos_knight", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_phantom_assassin", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_gyrocopter", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_rubick", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_luna", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_wisp", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_disruptor", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_undying", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_templar_assassin", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_naga_siren", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_nyx_assassin", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_keeper_of_the_light", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_visage", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_meepo", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_magnataur", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_centaur", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_slark", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_shredder", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_medusa", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_troll_warlord", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_tusk", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_bristleback", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_skywrath_mage", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_elder_titan", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_abaddon", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_earth_spirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_ember_spirit", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_legion_commander", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_phoenix", context)
	PrecacheResource("particle_folder", "particles/units/heroes/hero_terrorblade", context)

	print('Done precaching')]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.lod = lod()
	GameRules.lod:InitGameMode()
end
