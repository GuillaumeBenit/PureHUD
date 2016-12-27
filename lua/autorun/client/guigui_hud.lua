surface.CreateFont( "guigui_hud_font", {
	font="Arial",
	size=25,
	antialias=true,

} )
surface.CreateFont( "guigui_hud_font_armor", {
	font="Arial black",
	size=25,
	antialias=true,

} )

hook.Add("HUDShouldDraw", "HideDefaultHud", function(name) if name=="CHudHealth" or name=="CHudBattery" or name=="CHudSuitPower" then return false end end)

hook.Add( "HUDPaint", "guigui_hud", function()
	-- Health
	local health=LocalPlayer():Health()
	if health<=83 and health>=0 then
		local hud = {
			["$pp_colour_addr"]=0, 
			["$pp_colour_addg"]=0, 
			["$pp_colour_addb"]=0, 
			["$pp_colour_brightness"]=0, 
			["$pp_colour_contrast"]=1, 
			["$pp_colour_colour"]=health/100, 
			["$pp_colour_mulr"]=0, 
			["$pp_colour_mulg"]=0, 
			["$pp_colour_mulb"]=0
		}
		DrawColorModify(hud)
	end	

	-- Armor
	local armor_text=GetConVar("guigui_hud_Armor"):GetString()
	local armor=LocalPlayer():Armor()
	if armor>=1 then
		draw.DrawText(armor_text,"guigui_hud_font_armor",ScrW()-15,ScrH()-30,Color(0,0,250,armor*5),2)
	end

	-- Server
	local server=GetConVar("guigui_hud_ServerName"):GetString()
	draw.DrawText(server,"guigui_hud_font",5,5,Color(255,255,255,255),0)
end)