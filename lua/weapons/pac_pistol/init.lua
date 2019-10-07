AddCSLuaFile( 'cl_init.lua' )
AddCSLuaFile( 'shared.lua' )

include( 'shared.lua' )
SWEP.HoldType = "pistol"
function SWEP:Initialize()
	self.Weapon:SetHoldType( "pistol" )
end