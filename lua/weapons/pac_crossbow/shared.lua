AddCSLuaFile()
DEFINE_BASECLASS( "pac_swep_base" )

-- General info
SWEP.Author = "CFC"
SWEP.Purpose = "Sweps for buildmode PAC."
SWEP.PrintName = "Crossbow (PAC)"
SWEP.Category = "PAC SWEPS"

-- Visuals
SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.HoldType = "crossbow"
SWEP.IconOverride = "entities/weapon_crossbow.png"

-- Functionals
SWEP.Base = "pac_swep_base"
SWEP.Slot = 3
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.AdminOnly = false

--[[
    - The hl2 crossbow auto-reloads the moment it gets fired.
        - To simulate this, but also maintain a small gap between shooting and reload start (so that timing in pacs doesn't become strange),
            there will be a short delay before the reload actually begins for this swep.
        - This delay is defined by SWEP.Primary.Cooldown
    - Additionally, there is no secondary ammo, but the hl2 crossbow has a right-click zoom toggle.
        - We won't be adding that zoom, but it's not uncommon for crossbows to be used for grappling hook style tools in GMod,
            so this swep will still trigger pac_event for its secondary fire, in case a player wanted to have a right-click function.
--]]

-- Primary
SWEP.Primary.ClipSize = 1
SWEP.Primary.Cooldown = 0.3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "XBowBolt"

-- Secondary
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.Cooldown = 0.3
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

-- Misc
SWEP.ReloadDelay = 2 - SWEP.Primary.Cooldown


function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() then return end

    BaseClass.PrimaryAttack( self )

    -- Auto-reload
    timer.Simple( self.Primary.Cooldown, function()
        self:Reload()
    end )
end

function SWEP:CanSecondaryAttack()
    if self.Reloading then return false end

    return true
end
