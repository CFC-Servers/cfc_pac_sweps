AddCSLuaFile('cl_init.lua')
AddCSLuaFile('shared.lua')

include('shared.lua')
SWEP.HoldType = "ar2"
function SWEP:Initialize() 
	self.Weapon:SetHoldType("ar2")
end 