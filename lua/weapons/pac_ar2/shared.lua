AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Pulse-Rifle"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_irifle.mdl"
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.HoldType = "ar2"
SWEP.IconOverride = "entities/weapon_ar2.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 2
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 1.6

-- Primary
SWEP.Primary.ClipSize = 30
SWEP.Primary.Cooldown = 0.1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

-- Secondary
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 10
SWEP.Secondary.Cooldown = 2.35
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "AR2AltFire"
