AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = ".357 Magnum"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true
SWEP.SetHoldType = "pistol"
SWEP.DrawCrosshair = true
SWEP.IconOverride = "entities/weapon_357.png"

-- Functionals
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Ammo and such
-- Primary
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

-- Secondary
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = ""


SWEP.Slot                = 3
SWEP.SlotPos            = 1
SWEP.IconLetter            = "i"
SWEP.DrawWeaponInfoBox  = true
SWEP.Category           = "PAC SWEPS"

function SWEP:PrimaryAttack()
    self:ShootBullet( 0, 0, 0 )
end
