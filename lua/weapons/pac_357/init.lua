AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )
SWEP.HoldType = "revolver"
function SWEP:Initialize()
    self:SetHoldType( "revolver" )
end
