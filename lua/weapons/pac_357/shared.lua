AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = ".357 Magnum"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.HoldType = "revolver"
SWEP.IconOverride = "entities/weapon_357.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 1
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 3.7

-- Primary
SWEP.Primary.ClipSize = 6
SWEP.Primary.Cooldown = 0.75
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
