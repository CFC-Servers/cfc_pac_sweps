AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
SWEP.HoldType = "rpg"
function SWEP:Initialize()
    self:SetHoldType( "rpg" )
end