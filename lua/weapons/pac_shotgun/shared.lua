AddCSLuaFile()
DEFINE_BASECLASS( "pac_swep_base" )

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Shotgun (PAC)"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.HoldType = "shotgun"
SWEP.IconOverride = "entities/weapon_shotgun.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 3
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 1

-- Primary
SWEP.Primary.ClipSize = 6
SWEP.Primary.Cooldown = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Buckshot"

-- Secondary
SWEP.Secondary.Cooldown = 1.2


function SWEP:SecondaryAttack()
    if not self:CanPrimaryAttack() then return end

    if self:Clip1() == 1 then return self:PrimaryAttack() end

    local owner = self:GetOwner()

    owner:SetAnimation( PLAYER_ATTACK1 )
    self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
    self:TakePrimaryAmmo( 2 )
    self:SetNextPrimaryFire( CurTime() + self.Secondary.Cooldown )
    self:SetNextSecondaryFire( CurTime() + self.Secondary.Cooldown )

    -- PAC interaction
    if CLIENT and IsFirstTimePredicted() then
        owner:ConCommand( "pac_event swep_secondary 0" ) -- Pulse
        owner:ConCommand( "pac_event swep_secondary_" .. self:GetClass() .. " 0" )
    end
end
