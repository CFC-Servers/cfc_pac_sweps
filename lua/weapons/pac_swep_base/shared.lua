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
SWEP.ViewModel        = ""
SWEP.WorldModel        = ""

-- Functionals
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.Spawnable = false
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

-- Misc
SWEP.ReloadDelay = 1
SWEP.DontConsumeAmmoReserve = true -- If true, reloading doesn't drain the player's ammo cache. These are for PAC and not pvp, after all.

-- Primary
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1000
SWEP.Primary.Cooldown = 0.5
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

-- Secondary
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Cooldown = 0.5
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""


SWEP.Slot               = 3
SWEP.SlotPos            = 1
SWEP.DrawWeaponInfoBox  = true
SWEP.Category           = "PAC SWEPS"

function SWEP:Initialize()
    self:SetHoldType( self.HoldType )
end

function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() then return end

    local owner = self:GetOwner()
    local nextShootTime = CurTime() + self.Primary.Cooldown

    owner:SetAnimation( PLAYER_ATTACK1 )
    self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
    self:TakePrimaryAmmo( 1 )
    self:SetNextPrimaryFire( nextShootTime )
    self:SetNextSecondaryFire( nextShootTime )

    -- PAC interaction
    if CLIENT and IsFirstTimePredicted() then
        owner:ConCommand( "pac_event swep_primary 0" ) -- Pulse
        owner:ConCommand( "pac_event swep_primary_" .. self:GetClass() .. " 0" )
    end
end

function SWEP:SecondaryAttack()
    if not self:CanSecondaryAttack() then return end

    local owner = self:GetOwner()
    local nextShootTime = CurTime() + self.Secondary.Cooldown

    owner:SetAnimation( PLAYER_ATTACK1 )
    self:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
    self:TakeSecondaryAmmo( 1 )
    self:SetNextPrimaryFire( nextShootTime )
    self:SetNextSecondaryFire( nextShootTime )

    -- PAC interaction
    if CLIENT and IsFirstTimePredicted() then
        owner:ConCommand( "pac_event swep_secondary 0" ) -- Pulse
        owner:ConCommand( "pac_event swep_secondary_" .. self:GetClass() .. " 0" )
    end
end

function SWEP:CanPrimaryAttack()
    if self.Reloading then return false end

    local clipLeft = self:Clip1()

    if clipLeft < 0 then return false end

    if clipLeft == 0 then
        self:SetNextPrimaryFire( CurTime() + self.ReloadDelay )
        self:Reload()

        return false
    end

    return true
end

function SWEP:CanSecondaryAttack()
    if self.Secondary.Ammo == "" then return false end
    if self.Reloading then return false end

    local clipLeft = self:Clip2()

    if clipLeft < 0 then return false end

    if clipLeft == 0 then
        self:SetNextSecondaryFire( CurTime() + 0.2 )

        return false
    end

    return true
end

function SWEP:Reload()
    if self.Reloading then return end
    if self:Ammo1() == 0 then return end

    local clipLeft = self:Clip1()
    local clipMax = self.Primary.ClipSize

    if clipLeft == clipMax or clipMax == -1 then return end

    local reloadDelay = self.ReloadDelay
    local nextShootTime = CurTime() + reloadDelay
    local class = self:GetClass()
    local owner = self:GetOwner()

    -- Begin reloading
    self.Reloading = true
    self:GetOwner():SetAnimation( PLAYER_RELOAD )
    self:SendWeaponAnim( ACT_VM_RELOAD )
    self:SetNextPrimaryFire( nextShootTime )
    self:SetNextSecondaryFire( nextShootTime )

    -- PAC interaction
    if CLIENT and IsFirstTimePredicted() then
        owner:ConCommand( "pac_event swep_reload 0" ) -- Pulse
        owner:ConCommand( "pac_event swep_reload_" .. class .. " 0" )
        owner:ConCommand( "pac_event swep_reloading 1" ) -- Enable
        owner:ConCommand( "pac_event swep_reloading_" .. class .. " 1" )
    end

    -- Finish reload
    timer.Simple( reloadDelay, function()
        if not self.Reloading then return end -- In case the reload got canceled by switching weps, etc

        self.Reloading = false

        owner = self:GetOwner()
        if not IsValid( owner ) then return end

        local ammoLeft = self:Ammo1()
        if ammoLeft == 0 then return end

        local amountToTransfer = math.min( clipMax - clipLeft, ammoLeft )

        if not self.DontConsumeAmmoReserve then
            owner:RemoveAmmo( amountToTransfer )
        end

        self:SetClip1( clipLeft + amountToTransfer )

        -- PAC interaction
        if CLIENT and IsFirstTimePredicted() then
            owner:ConCommand( "pac_event swep_reloaded 0" ) -- Pulse
            owner:ConCommand( "pac_event swep_reloaded_" .. class .. " 0" )
            owner:ConCommand( "pac_event swep_reloading 3" ) -- Disable
            owner:ConCommand( "pac_event swep_reloading_" .. class .. " 3" )
        end
    end )
end

function SWEP:Holster( newWep )
    if newWep == self then return true end

    self.Reloading = false

    return true
end

function SWEP:OnDrop()
    self.Reloading = false
end

function SWEP:OwnerChanged()
    self.Reloading = false
end
