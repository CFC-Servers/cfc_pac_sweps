AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Dual pistols"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/v_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.HoldType = "dual"
SWEP.IconOverride = "entities/weapon_pistol.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 1
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 3.77

-- Primary
SWEP.Primary.ClipSize = 30
SWEP.Primary.Cooldown = 0.25
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"
