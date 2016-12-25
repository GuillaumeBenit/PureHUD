list.Set(
	"DesktopWindows",
	"Pure HUD",
	{
		title="Pure HUD",
		icon="icon16/brick.png",
		width=200,
		height=225,
		onewindow=true,
		init=function(icon,window)

			window.Paint=function(self,w,h)
				draw.RoundedBox(0,0,0,w,h,Color(0,0,0,150))
			end

			local Text=vgui.Create("DLabel",window)
			Text:SetPos(20,25)
			Text:SetSize(150,25)
			Text:SetTextColor(Color(255,255,255))
			Text:SetText("Server name :")

			local DermaText=vgui.Create("DTextEntry", window)
			DermaText:SetPos(20,50)
			DermaText:SetTall(20)
			DermaText:SetWide(110)
			DermaText:SetEnterAllowed(true)
			DermaText:SetText(GetConVar("guigui_hud_ServerName"):GetString())

			local DermaButton=vgui.Create("DButton",window)
			DermaButton:SetText("Ok")
			DermaButton:SetPos(140,50)
			DermaButton:SetSize(40,20)
			DermaButton.DoClick = function ()
				RunConsoleCommand("guigui_hud_ServerName",DermaText:GetValue())
			end

			local Text=vgui.Create("DLabel",window)
			Text:SetPos(20,75)
			Text:SetSize(150,25)
			Text:SetTextColor(Color(255,255,255))
			Text:SetText("Currency (for DarkRP) :")

			local MenuButton=vgui.Create("DButton",window)
			MenuButton:SetText("Menu >")
			MenuButton:SetPos(20,100)
			MenuButton:SetSize(160,20)
			MenuButton.DoClick=function ()
				local MenuButtonOptions = DermaMenu()
				MenuButtonOptions:AddOption("฿", function() RunConsoleCommand("guigui_hud_Currency","฿") end )
				MenuButtonOptions:AddOption("$", function() RunConsoleCommand("guigui_hud_Currency","$") end )
				MenuButtonOptions:AddOption("€", function() RunConsoleCommand("guigui_hud_Currency","€") end )
				MenuButtonOptions:AddOption("£", function() RunConsoleCommand("guigui_hud_Currency","£") end )
				MenuButtonOptions:Open()
			end

			local Text=vgui.Create("DLabel",window)
			Text:SetPos(20,125)
			Text:SetSize(160,25)
			Text:SetTextColor(Color(255,255,255))
			Text:SetText("Opacity (for DarkRP) :")

			local NumSliderThingy=vgui.Create("DNumSlider",window)
			NumSliderThingy:SetPos(20,145)
			NumSliderThingy:SetSize(160,25)
			NumSliderThingy:SetMin(64)
			NumSliderThingy:SetMax(256)
			NumSliderThingy:SetDecimals(0) 
			NumSliderThingy:SetText("Opacity :")
			NumSliderThingy:SetConVar("guigui_hud_opacity")			
		end
	}
)