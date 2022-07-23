AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Crowbar"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.HoldType = "melee"
SWEP.IconOverride = "entities/weapon_crowbar.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 0
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false


-- Primary
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Cooldown = 0.5
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = ""


function SWEP:CanPrimaryAttack()
    return true
end
