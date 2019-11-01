AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
SWEP.HoldType = "melee"
function SWEP:Initialize()
    self.Weapon:SetHoldType( "melee" )
end