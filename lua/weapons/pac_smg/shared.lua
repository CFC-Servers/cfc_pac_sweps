AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "SMG (PAC)"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.HoldType = "smg"
SWEP.IconOverride = "entities/weapon_smg1.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 2
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 1.5

-- Primary
SWEP.Primary.ClipSize = 45
SWEP.Primary.Cooldown = 0.07
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

-- Secondary
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Cooldown = 1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "SMG1_Grenade"


function SWEP:CanSecondaryAttack()
    if self.Reloading then return false end

    local clipLeft = self:Ammo2() -- Can't override SWEP:Clip2(), and it always give -1 if ClipSize == -1

    if clipLeft < 0 then return false end

    if clipLeft == 0 then
        self:SetNextSecondaryFire( CurTime() + 0.2 )

        return false
    end

    return true
end
