hook.Add("HUDShouldDraw", "hideElementsDarkRP", function(name) if name=="DarkRP_HUD" then return false end end)

function Number(v) if v then if v >= 1 then return v else return 0 end end return "" end

local opacity=GetConVar("guigui_hud_Opacity"):GetString()

hook.Add( "HUDPaint", "guigui_hud_darkrp", function()
	-- Money
	local money=Number(LocalPlayer():getDarkRPVar("money")).." "..GetConVar("guigui_hud_Currency"):GetString()
	draw.DrawText(money,"guigui_hud_font",15,ScrH()-30,Color(255,255,255,opacity),0)

	-- Gun license
	if LocalPlayer():getDarkRPVar("HasGunlicense") then
		surface.SetMaterial(Material("icon16/page_white_text.png"))
		surface.SetDrawColor(255,255,255,opacity) 
		surface.DrawTexturedRect(surface.GetTextSize(money)+25,ScrH()-30,25,25)
	end

	-- Wanted
	if LocalPlayer():getDarkRPVar("wanted") then
		surface.SetMaterial(Material("icon16/star.png"))
		surface.SetDrawColor(255,255,255,opacity) 
		surface.DrawTexturedRect(surface.GetTextSize(money)+62.5, ScrH()-30,25,25)
	end
end)