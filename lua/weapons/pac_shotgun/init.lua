AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )

include( 'shared.lua' )
SWEP.HoldType = "shotgun"
function SWEP:Initialize()
	self.Weapon:SetHoldType( "shotgun" )
end