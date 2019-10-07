AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )

include( 'shared.lua' )
SWEP.HoldType = "crossbow"
function SWEP:Initialize()
	self.Weapon:SetHoldType( "crossbow" )
end