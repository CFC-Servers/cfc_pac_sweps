AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "BASESWEP"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.UseHands = true
SWEP.SetHoldType = ""
SWEP.DrawCrosshair = true
SWEP.IconOverride = ""
SWEP.ViewModel		= ""
SWEP.WorldModel		= ""

-- Functionals
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.Spawnable = false
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
SWEP.DrawWeaponInfoBox  = true
SWEP.Category           = "PAC SWEPS"

function SWEP:Initialize()
    self:SetHoldType( self.HoldType )
end

function SWEP:PrimaryAttack()
    self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
    self:SendWeaponAnim( 181 )
    return true
end

function SWEP:Reload()
    self:GetOwner():SetAnimation( PLAYER_ATTACK1 )
    self:SendWeaponAnim( 183 )
    return true
end

function SWEP:SecondaryAttack()
    return
end
