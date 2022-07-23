AddCSLuaFile()

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Slam (PAC)"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_slam.mdl"
SWEP.WorldModel = "models/weapons/w_slam.mdl"
SWEP.HoldType = "slam"
SWEP.IconOverride = "entities/weapon_slam.png"

-- Misc
SWEP.ReloadDelay = 1

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 4
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Primary
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 3
SWEP.Primary.Cooldown = 3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "slam"


function SWEP:CanPrimaryAttack()
    if self.Reloading then return false end

    local clipLeft = self:Ammo1() -- Can't override SWEP:Clip1(), and it always give -1 if ClipSize == -1

    if clipLeft < 0 then return false end

    if clipLeft == 0 then
        self:SetNextPrimaryFire( CurTime() + self.ReloadDelay )

        return false
    end

    return true
end

function SWEP:CanSecondaryAttack()
    return true
end
