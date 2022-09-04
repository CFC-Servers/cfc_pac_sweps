AddCSLuaFile()
DEFINE_BASECLASS( "pac_swep_base" )

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Pistol (PAC)"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.HoldType = "pistol"
SWEP.IconOverride = "entities/weapon_pistol.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 1
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 1.45

-- Primary
SWEP.Primary.ClipSize = 18
SWEP.Primary.Cooldown = 0.5 -- Cooldown for auto-firing
SWEP.Primary.CooldownTap = 0.2 -- Cooldown for rapid tap-release
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"


-- Adjust primary cooldown if the player releases the fire button (since the hl2 pistol lets you shoot faster by tapping repeatedly)
hook.Add( "KeyRelease", "CFC_PacSweps_PistolQuickTap", function( ply, key )
    if key ~= IN_ATTACK then return end

    local wep = ply:GetActiveWeapon()

    if not IsValid( wep ) or wep:GetClass() ~= "pac_pistol" then return end

    wep:SetNextPrimaryFire( wep:LastShootTime() + wep.Primary.CooldownTap )
end )
