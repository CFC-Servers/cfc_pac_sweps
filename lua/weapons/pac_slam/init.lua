AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )

include( 'shared.lua' )
SWEP.HoldType = "slam"
function SWEP:Initialize()
    self.Weapon:SetHoldType( "slam" )
end