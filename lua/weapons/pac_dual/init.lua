AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )

include( 'shared.lua' )
SWEP.HoldType = "duel"
function SWEP:Initialize()
    self.Weapon:SetHoldType( "duel" )
end