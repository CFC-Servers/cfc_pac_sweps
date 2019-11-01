AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
SWEP.HoldType = "smg"
function SWEP:Initialize()
    self:SetHoldType( "smg" )
end