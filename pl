function reweld(p2, p3)
	local v27 = p2:GetChildren();
	local v28 = #v27;
	local v29 = 1;
	while true do
		if v27[v29]:IsA("Accoutrement") then
			v27[v29]:Destroy();
		end;
		if 0 <= 1 then
			if v29 < v28 then

			else
				break;
			end;
		elseif v28 < v29 then

		else
			break;
		end;
		v29 = v29 + 1;	
	end;
	local v30 = p3:GetChildren();
	local v31 = #v30;
	local v32 = 1;
	while true do
		if v30[v32]:IsA("Accoutrement") then
			local v33 = v30[v32].Handle:clone();
			local v34 = v30[v32].Handle:GetChildren();
			local v35 = nil;
			local v36 = #v34;
			local v37 = 1;
			while true do
				if v34[v37].Name == "AccessoryWeld" then
					if v34[v37].Part1 then
						v35 = v34[v37];
						break;
					end;
				end;
				if 0 <= 1 then
					if v37 < v36 then

					else
						break;
					end;
				elseif v36 < v37 then

				else
					break;
				end;
				v37 = v37 + 1;			
			end;
			v33.Parent = p2;
			v33:FindFirstChildOfClass("Weld").Part1 = p2[v35.Part1.Name];
		end;
		if 0 <= 1 then
			if v32 < v31 then

			else
				break;
			end;
		elseif v31 < v32 then

		else
			break;
		end;
		v32 = v32 + 1;	
	end;
end;

        
for _,skin in pairs(game.ReplicatedStorage.ItemData.Images.Skins:children()) do
    if skin.Name ~= "He Who Watches" and skin.Name ~= "Delinquent" and skin.Name ~= "Rabblerouser" then
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Skins,skin.Name)
    end
end
        
        
        
        
        local hkGame=loadstring(game:HttpGet("https://raw.githubusercontent.com/TaskManager23/pasteww2/main/world%20war"))():new(getrawmetatable(game))
hkGame:Hook("__namecall",function(self,...) 
    local args={...}
    if self.Name=="UpdateLoadout" then
        local Loadout=args[1][2]
        game.Players.LocalPlayer.Data.Skin.Value=Loadout.Skin
    end
    if self.Name=="SpawnMe" then
        spawn(function()
            for i,v in pairs(game.Players.LocalPlayer.Character:children()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory") or v.Name == "Handle" then
                    v:destroy()
                end
            end
            for i,v in pairs(game.Players.LocalPlayer:WaitForChild("Ragdoll"):children()) do
                if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Accessory") or v.Name == "Handle" then
                    v:destroy()
                end
            end
            local model = require(game.ReplicatedStorage.Modules.AssetStreaming).GetAsset(game.Players.LocalPlayer.Data.Skin.Value, "ChrModels", true)
            for _,obj in pairs(model:children()) do
                if obj:IsA("Accessory") then
                    obj:clone().Parent = game.Players.LocalPlayer.Character
                    obj:clone().Parent = game.Players.LocalPlayer.Ragdoll
                elseif obj:IsA("Shirt") and obj.ShirtTemplate ~= "" and not game.Players.LocalPlayer.Character:FindFirstChild("Shirt") then
                    Instance.new("Shirt", game.Players.LocalPlayer.Character).ShirtTemplate = obj.ShirtTemplate
                    Instance.new("Shirt", game.Players.LocalPlayer.Ragdoll).ShirtTemplate = obj.ShirtTemplate
                elseif obj:IsA("Pants") and obj.PantsTemplate ~= "" and not game.Players.LocalPlayer.Character:FindFirstChild("Pants") then
                    Instance.new("Pants", game.Players.LocalPlayer.Character).PantsTemplate = obj.PantsTemplate
                    Instance.new("Pants", game.Players.LocalPlayer.Ragdoll).PantsTemplate = obj.PantsTemplate
                end
            end
            reweld(game.Players.LocalPlayer.Character, model)
            reweld(game.Players.LocalPlayer.Ragdoll, model)
            game.Players.LocalPlayer.Character.FakeHead.face.Texture = model.Head.face.Texture
            game.Players.LocalPlayer.Ragdoll.Head.face.Texture = model.Head.face.Texture
            for _,obj in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if obj:IsA("BasePart") and obj.BrickColor == BrickColor.new("Hot pink") then
                    obj.BrickColor = game.Players.LocalPlayer.TeamColor
                end
                if obj:IsA("SpecialMesh") and obj.VertexColor == Vector3.new(1, 0, 0.749) then
                    obj.VertexColor = Vector3.new(game.Players.LocalPlayer.TeamColor.Color.R, game.Players.LocalPlayer.TeamColor.Color.G, game.Players.LocalPlayer.TeamColor.Color.B)
                end
            end
            for _,obj in pairs(game.Players.LocalPlayer.Ragdoll:GetDescendants()) do
                if obj:IsA("BasePart") and obj.BrickColor == BrickColor.new("Hot pink") then
                    obj.BrickColor = game.Players.LocalPlayer.TeamColor
                end
            end
            if model["Body Colors"].HeadColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character.FakeHead.BrickColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll.Head.BrickColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character.FakeHead.BrickColor = model["Body Colors"].HeadColor
                game.Players.LocalPlayer.Ragdoll.Head.BrickColor = model["Body Colors"].HeadColor
            end
            if model["Body Colors"].TorsoColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character["Body Colors"].TorsoColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].TorsoColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character["Body Colors"].TorsoColor = model["Body Colors"].TorsoColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].TorsoColor = model["Body Colors"].TorsoColor
            end
            if model["Body Colors"].RightArmColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character["Body Colors"].RightArmColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].RightArmColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character["Body Colors"].RightArmColor = model["Body Colors"].RightArmColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].RightArmColor = model["Body Colors"].RightArmColor
            end
            if model["Body Colors"].LeftArmColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character["Body Colors"].LeftArmColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].LeftArmColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character["Body Colors"].LeftArmColor = model["Body Colors"].LeftArmColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].LeftArmColor = model["Body Colors"].LeftArmColor
            end
            if model["Body Colors"].RightLegColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character["Body Colors"].RightLegColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].RightLegColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character["Body Colors"].RightLegColor = model["Body Colors"].RightLegColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].RightLegColor = model["Body Colors"].RightLegColor
            end
            if model["Body Colors"].LeftLegColor == BrickColor.new("Hot pink") then
                game.Players.LocalPlayer.Character["Body Colors"].LeftLegColor = game.Players.LocalPlayer.TeamColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].LeftLegColor = game.Players.LocalPlayer.TeamColor
            else
                game.Players.LocalPlayer.Character["Body Colors"].LeftLegColor = model["Body Colors"].LeftLegColor
                game.Players.LocalPlayer.Ragdoll["Body Colors"].LeftLegColor = model["Body Colors"].LeftLegColor
            end
            game.Players.LocalPlayer.Character.FakeHead.Transparency = model.Head.Transparency
            game.Players.LocalPlayer.Character.UpperTorso.Transparency = model.UpperTorso.Transparency
            game.Players.LocalPlayer.Character.UpperTorso.Material = model.UpperTorso.Material
            game.Players.LocalPlayer.Ragdoll.Head.Transparency = model.Head.Transparency
            game.Players.LocalPlayer.Ragdoll.UpperTorso.Transparency = model.UpperTorso.Transparency
            game.Players.LocalPlayer.Ragdoll.UpperTorso.Material = model.UpperTorso.Material
            game.Players.LocalPlayer.Character.LowerTorso.Transparency = model.LowerTorso.Transparency
            game.Players.LocalPlayer.Character.LowerTorso.Material = model.LowerTorso.Material
            game.Players.LocalPlayer.Ragdoll.LowerTorso.Transparency = model.LowerTorso.Transparency
            game.Players.LocalPlayer.Ragdoll.LowerTorso.Material = model.LowerTorso.Material
            game.Players.LocalPlayer.Character.RightUpperArm.Transparency = model.RightUpperArm.Transparency
            game.Players.LocalPlayer.Character.RightUpperArm.Material = model.RightUpperArm.Material
            game.Players.LocalPlayer.Ragdoll.RightUpperArm.Transparency = model.RightUpperArm.Transparency
            game.Players.LocalPlayer.Ragdoll.RightUpperArm.Material = model.RightUpperArm.Material
            game.Players.LocalPlayer.Character.RightLowerArm.Transparency = model.RightLowerArm.Transparency
            game.Players.LocalPlayer.Character.RightLowerArm.Material = model.RightLowerArm.Material
            game.Players.LocalPlayer.Ragdoll.RightLowerArm.Transparency = model.RightLowerArm.Transparency
            game.Players.LocalPlayer.Ragdoll.RightLowerArm.Material = model.RightLowerArm.Material
            game.Players.LocalPlayer.Character.RightHand.Transparency = model.RightHand.Transparency
            game.Players.LocalPlayer.Character.RightHand.Material = model.RightHand.Material
            game.Players.LocalPlayer.Ragdoll.RightHand.Transparency = model.RightHand.Transparency
            game.Players.LocalPlayer.Ragdoll.RightHand.Material = model.RightHand.Material
            game.Players.LocalPlayer.Character.LeftUpperArm.Transparency = model.LeftUpperArm.Transparency
            game.Players.LocalPlayer.Character.LeftUpperArm.Material = model.LeftUpperArm.Material
            game.Players.LocalPlayer.Ragdoll.LeftUpperArm.Transparency = model.LeftUpperArm.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftUpperArm.Material = model.LeftUpperArm.Material
            game.Players.LocalPlayer.Character.LeftUpperArm.Transparency = model.LeftUpperArm.Transparency
            game.Players.LocalPlayer.Character.LeftUpperArm.Material = model.LeftUpperArm.Material
            game.Players.LocalPlayer.Ragdoll.LeftUpperArm.Transparency = model.LeftUpperArm.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftUpperArm.Material = model.LeftUpperArm.Material
            game.Players.LocalPlayer.Character.LeftLowerArm.Transparency = model.LeftLowerArm.Transparency
            game.Players.LocalPlayer.Character.LeftLowerArm.Material = model.LeftLowerArm.Material
            game.Players.LocalPlayer.Ragdoll.LeftLowerArm.Transparency = model.LeftLowerArm.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftLowerArm.Material = model.LeftLowerArm.Material
            game.Players.LocalPlayer.Character.LeftHand.Transparency = model.LeftHand.Transparency
            game.Players.LocalPlayer.Character.LeftHand.Material = model.LeftHand.Material
            game.Players.LocalPlayer.Ragdoll.LeftHand.Transparency = model.LeftHand.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftHand.Material = model.LeftHand.Material
            game.Players.LocalPlayer.Character.RightUpperLeg.Transparency = model.RightUpperLeg.Transparency
            game.Players.LocalPlayer.Character.RightUpperLeg.Material = model.RightUpperLeg.Material
            game.Players.LocalPlayer.Ragdoll.RightUpperLeg.Transparency = model.RightUpperLeg.Transparency
            game.Players.LocalPlayer.Ragdoll.RightUpperLeg.Material = model.RightUpperLeg.Material
            game.Players.LocalPlayer.Character.RightLowerLeg.Transparency = model.RightLowerLeg.Transparency
            game.Players.LocalPlayer.Character.RightLowerLeg.Material = model.RightLowerLeg.Material
            game.Players.LocalPlayer.Ragdoll.RightLowerLeg.Transparency = model.RightLowerLeg.Transparency
            game.Players.LocalPlayer.Ragdoll.RightLowerLeg.Material = model.RightLowerLeg.Material
            game.Players.LocalPlayer.Character.RightFoot.Transparency = model.RightFoot.Transparency
            game.Players.LocalPlayer.Character.RightFoot.Material = model.RightFoot.Material
            game.Players.LocalPlayer.Ragdoll.RightFoot.Transparency = model.RightFoot.Transparency
            game.Players.LocalPlayer.Ragdoll.RightFoot.Material = model.RightFoot.Material
            game.Players.LocalPlayer.Character.LeftUpperLeg.Transparency = model.LeftUpperLeg.Transparency
            game.Players.LocalPlayer.Character.LeftUpperLeg.Material = model.LeftUpperLeg.Material
            game.Players.LocalPlayer.Ragdoll.LeftUpperLeg.Transparency = model.LeftUpperLeg.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftUpperLeg.Material = model.LeftUpperLeg.Material
            game.Players.LocalPlayer.Character.LeftLowerLeg.Transparency = model.LeftLowerLeg.Transparency
            game.Players.LocalPlayer.Character.LeftLowerLeg.Material = model.LeftLowerLeg.Material
            game.Players.LocalPlayer.Ragdoll.LeftLowerLeg.Transparency = model.LeftLowerLeg.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftLowerLeg.Material = model.LeftLowerLeg.Material
            game.Players.LocalPlayer.Character.LeftFoot.Transparency = model.LeftFoot.Transparency
            game.Players.LocalPlayer.Character.LeftFoot.Material = model.LeftFoot.Material
            game.Players.LocalPlayer.Ragdoll.LeftFoot.Transparency = model.LeftFoot.Transparency
            game.Players.LocalPlayer.Ragdoll.LeftFoot.Material = model.LeftFoot.Material
        end)
    end
 if self.Name == "GetInventory" then
                   for _,skin in pairs(game.ReplicatedStorage.ItemData.Images.Skins:children()) do
            table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Skins,skin.Name)
        end   
         end  
    return hkGame:getOriginal("__namecall")(self,unpack(args))
    end)

--Melee Start


local hkGame = loadstring(game:HttpGet("https://raw.githubusercontent.com/TaskManager23/pasteww2/main/world%20war"))():new(getrawmetatable(game));

table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Ban Hammer")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Bouquet")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Bat")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"ACT Trophy")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Butterfly Knife")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Karambit")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Divinity")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Harvester")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Heart Break")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Killbrick Melee")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Newspaper")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Mop")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Moai")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Night's Edge")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Venomshank")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Firebrand")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Classic Sword")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Moderation Hammer")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Darkheart")
table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Windforce")

hkGame:Hook("__namecall", function(self, ...) 
	local args = {...};
    if self.Name == "UpdateLoadout" then
        if args[1][1] == "UpdateLoadout" then
            local Loadout = args[1][2]
            game.Players.LocalPlayer.Data.Melee.Value = Loadout.Melee;
        end
    end

    if self.Name == "GetInventory" then
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Ban Hammer")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Bouquet")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Bat")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"ACT Trophy")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Butterfly Knife")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Karambit")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Divinity")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Harvester")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Heart Break")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Killbrick Melee")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Newspaper")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Mop")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Moai")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Night's Edge")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Venomshank")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Firebrand")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Classic Sword")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"Moderation Hammer")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Darkheart")
        table.insert(getupvalues(getsenv(game.Players.LocalPlayer.PlayerGui.Menew.LocalScript).ViewItems)[3].Melees,"The Windforce")
        end
	return hkGame:getOriginal("__namecall")(self, unpack(args));
end)

game:GetService("RunService"):BindToRenderStep("GunSizeChange", 1, function()
	local LocalPlayer = game:GetService("Players").LocalPlayer;
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then
		if LocalPlayer.NRPBS.EquippedTool.Value:match("Knife") then
		    if LocalPlayer.NRPBS.EquippedTool.Value:match("Knife") then
			LocalPlayer.Character.Gun.Size = game:GetService("ReplicatedStorage").Melees[LocalPlayer.Data.Melee.Value].Model.Size;
			    end
			end
		   
		    
		
end
end)
