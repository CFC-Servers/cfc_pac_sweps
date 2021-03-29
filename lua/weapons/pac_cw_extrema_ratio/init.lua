AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
SWEP.HoldType = "knife"
function SWEP:Initialize()
    self:SetHoldType( "knife" )
end