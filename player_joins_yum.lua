


function PlayerJoined(text)
	game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
		Text = text;
		Color = Color3.fromRGB(0, 255, 26);
		Font = Enum.Font.SciFi;
		TextSize = 20
	})
end


function PlayerLeft(text)
	game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
		Text = text;
		Color = Color3.fromRGB(255, 0, 0);
		Font = Enum.Font.SciFi;
		TextSize = 20
	})
end


game:GetService("Players").PlayerAdded:Connect(function(whojoined)
	PlayerJoined(" "..whojoined.Name.." just joined the server🏳️‍🌈")
end)

game:GetService("Players").PlayerRemoving:Connect(function(wholeft)
	PlayerLeft(" "..wholeft.Name.." just left what a pussy😂")
end)
