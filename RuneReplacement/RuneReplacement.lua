local f = CreateFrame("Frame") 
local class, PlayerClass = UnitClass("player")
if (PlayerClass ~= "DEATHKNIGHT") then return end

local timer = true

local bloodtex  = "Interface\\PLAYERFRAME\\UI-PlayerFrame-Deathknight-Blood"
local frosttex  = "Interface\\PLAYERFRAME\\UI-PlayerFrame-Deathknight-Frost"
local unholytex = "Interface\\PLAYERFRAME\\UI-PlayerFrame-Deathknight-Unholy"

local function init()
	local currentSpec = GetSpecialization()
	--print("Your current spec:", currentSpec)
	if (currentSpec == 1) then
		for i = 1, 6 do
		local runeButton = _G["RuneButtonIndividual"..i.."Rune"];
		runeButton:SetTexture(bloodtex)
		end
	elseif (currentSpec == 2) then
		for i = 1, 6 do
		local runeButton = _G["RuneButtonIndividual"..i.."Rune"];
		runeButton:SetTexture(frosttex)
		end
	elseif (currentSpec == 3) then
		for i = 1, 6 do
		local runeButton = _G["RuneButtonIndividual"..i.."Rune"];
		runeButton:SetTexture(unholytex)
		end
	end
	if timer then 
		for i = 1, 6 do
		local runeButton = _G["RuneButtonIndividual"..i];
		runeButton.Cooldown:SetHideCountdownNumbers(false);
		end
	end
end

f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
f:SetScript("OnEvent", init)