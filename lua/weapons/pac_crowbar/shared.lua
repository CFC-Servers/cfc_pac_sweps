
AddCSLuaFile( "shared.lua" )
SWEP.HoldType = "melee"

SWEP.DrawAmmo            = false
SWEP.DrawCrosshair        = false
SWEP.ViewModelFOV        = 76
SWEP.ViewModelFlip        = false

SWEP.Slot                = 3
SWEP.SlotPos            = 1
SWEP.IconLetter            = "i"
SWEP.DrawWeaponInfoBox  = true
SWEP.Category           = "PAC SWEPS"

------------
-- Info --
------------
SWEP.PrintName        = "PAC_CROWBAR"
SWEP.Purpose        = "Imitate a Crowbar"


-------------
-- Misc. --
-------------
SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true


----------------------
-- Primary Fire --
----------------------
SWEP.Primary.NumShots        = 0
SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Ammo            = "none"
SWEP.FiresUnderwater         = false


-------------------------
-- Secondary Fire --
-------------------------
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Ammo            = "none"

-------------------------
-- Effects/Visual --
-------------------------
SWEP.ViewModel                = "models/weapons/v_crowbar.mdl";
SWEP.WorldModel                = "models/weapons/w_crowbar.mdl";


