local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xcmsnd/QQ515966991/refs/heads/main/Ware_UI%20AL%E9%AB%98%E4%BB%BFV1.0.lua"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("🇨🇳时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)


local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local bai = {
    waterwalk = false,
    awaysday = false,
    awaysdnight = false,
    nofog = false
}

-- 发送通知的函数
function SendNotification(Title, Text, Duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Icon = nil;
        Duration = Duration
    })
end
local lp=game.Players.LocalPlayer
local mouse = lp:GetMouse()
local CurrentSlot = game.Players.LocalPlayer:WaitForChild("CurrentSaveSlot").Value
local ScriptLoadOrSave = false
local CurrentlySavingOrLoading = game.Players.LocalPlayer:WaitForChild("CurrentlySavingOrLoading")
local bai = {
  autoaxedupe=false,
  cuttreeselect="Generic",
  axedupepick=nil,
  autodupe=false,
  dxmz="",
  slot=-1,
  zlwjia="",
  zix=1,
  zlz=3,
  bringamount=1,
  bringtree=false,
  waterwalk=false,
  awaysday=false,
  awaysdnight=false,
  nofog=false,
  cswjiail=nil,
  itemset=nil,
  autocsdx=nil,
  autobuystop=false,
  autobuyamount=1,
  away = nil
}

local function notify(Title,Text,Duration) -- Sends Notification in the bottom right of the screen
  game.StarterGui:SetCore("SendNotification", {
    Title = Title;
    Text = Text;
    Icon = nil;
    Duration = Duration
  })
end
function Dupeaxe()


  lp.Character.Humanoid:UnequipTools()
  local oldpos = lp.Character.HumanoidRootPart.CFrame
  for i,v in pairs(game:service"Players".LocalPlayer.Backpack:GetChildren()) do
    game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(v,"Drop tool")
  end

  game:service"Players".LocalPlayer.Character.Head:Destroy()
  wait(6)
  lp.Character.HumanoidRootPart.CFrame=oldpos
end
local Vehicle
local function cartp(targetCFrame)
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        local SeatPart = lp.Character.Humanoid.SeatPart
        if SeatPart and SeatPart.Parent then
            local Vehicle = SeatPart.Parent
            if Vehicle and Vehicle:FindFirstChild("PrimaryPart") then
                for i = 1, 3 do
                    task.wait()
                    Vehicle:SetPrimaryPartCFrame(targetCFrame)
                end
            end
        end
    end
end
function ItemStackeraxe(ItemType, XAxis, ZAxis)
  local Player = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 3.5, 0)
  local Items = {}

  for i, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
    if v:FindFirstChild("Owner") and tostring(v.Owner.Value) ==bai.zlwjia
      then if (
        v:FindFirstChild "DraggableItem" and tostring(v.DraggableItem.Parent) == ItemType)
        then table
        .
        insert(Items, v)
      end
    end
  end
  local Count = 0
  for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do for X = 1, XAxis do for Z = 1, ZAxis do Count = Count
        + 1
        game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedStructure:FireServer(nil,
        CFrame.new(X * Items[1].Main.Size.X, Y * Items[1].Main.Size.Y, Z * Items[1].Main.Size.Z) + Player
        ,
        game.Players.LocalPlayer, nil, Items[Count], true)
      end
    end
  end
end
function ItemStackerbox(ItemType, XAxis, ZAxis)
  local Player = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 4, 0)
  local Items = {}

  for i, v in pairs(game:GetService("Workspace").PlayerModels:GetChildren()) do
    if v:FindFirstChild("Owner") and tostring(v.Owner.Value) ==bai.zlwjia
      then if (
        v:FindFirstChild("PurchasedBoxItemName") and tostring(v.PurchasedBoxItemName.Value) == ItemType)
        then table
        .
        insert(Items, v)
      end
    end
  end
  local Count = 0
  for Y = 1, math.ceil(#Items / (XAxis * ZAxis)) do for X = 1, XAxis do for Z = 1, ZAxis do Count = Count
        + 1
        game:GetService("ReplicatedStorage").PlaceStructure.ClientPlacedStructure:FireServer(nil,
        CFrame.new(X * Items[1].Main.Size.X, Y * Items[1].Main.Size.Y, Z * Items[1].Main.Size.Z) + Player
        ,
        game.Players.LocalPlayer, nil, Items[Count], true)
      end
    end
  end
end
local function CheckIfSlotAvailable(Slot)
  for a,b in pairs(game.ReplicatedStorage.LoadSaveRequests.GetMetaData:InvokeServer(game.Players.LocalPlayer)) do
    if a == Slot then
      for c,d in pairs(b) do
        if c == "NumSaves" and d ~= 0 then
          return true
         else
          return false
        end
      end
    end
  end
end

local function CheckSlotNumber() --Checks if the slot number is right
  if bai.slot == "1" or bai.slot == "2" or bai.slot == "3" or bai.slot == "4" or bai.slot == "5" or bai.slot == "6" then
    local SlotNumber = tonumber(bai.slot)
    return SlotNumber
   else return false
  end
end




function toolsta(toolname)
  return require(game.ReplicatedStorage.Purchasables.Tools.AllTools[toolname].AxeClass).new()
end

local function table_foreach(table, callback)
  for i=1,#table do
    callback(i, table[i])
  end
end


local function tp(pos)
    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
        if typeof(pos) == "CFrame" then
            lp.Character.HumanoidRootPart.CFrame = pos
        elseif typeof(pos) == "Vector3" then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end
    end
end

function sellwood()
  for _, Log in pairs(workspace.LogModels:GetChildren()) do
    if Log.Name:sub(1, 6) == "Loose_" and Log:findFirstChild("Owner") then
      if Log.Owner.Value == game.Players.LocalPlayer then
        for i,v in pairs(Log:GetChildren()) do
          if v.Name=="WoodSection" then
            spawn(function()
              for i=1,100 do
                wait();
                game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(v.WoodSection)
                game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v.WoodSection)
                v.CFrame=CFrame.new(Vector3.new(315, -0.296, 85.791))*CFrame.Angles(math.rad(90),0,0)
              end
            end)
          end
        end

      end
    end
  end
end



local function cutPart (tool,event, treeClass,axestr)
  game:GetService"ReplicatedStorage".Interaction.RemoteProxy:FireServer(event, {
    tool = tool,
    faceVector = Vector3.new(0, 0,-1),
    height = 0.3,
    sectionId = 1,
    hitPoints = axestr,
    cooldown = -14,
    cuttingClass = "Axe"
  })
end
local treeListener = function(treeClass, callback)
  local childAdded
  a= workspace.LogModels.ChildAdded:Connect(function(child)
    local owner = child:WaitForChild("Owner")
    if owner.Value == lp and child.TreeClass.Value == treeClass then
      a:Disconnect()
      callback(child)
    end
  end)
end


local getBiggestTree = function(treeClass)
  for _,v in next,workspace:children()do
    if tostring(v)=="TreeRegion"then
      for _,g in next,v:children()do
        if g:FindFirstChild("TreeClass")and tostring(g.TreeClass.Value)==treeClass and g:FindFirstChild("Owner")then
          if g.Owner.Value==nil or tostring(g.Owner.Value)==tostring(lp)then
            if #g:children() > 5 and g:FindFirstChild("WoodSection")then
              for h,j in next,g:children() do
                if j:FindFirstChild("ID")and j.ID.Value==1 and j.Size.Y>.5 then
                  return j;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  return false;
end
local function lowerBridge(value)

  if value=="Higher"then
    for _,v in pairs(game.workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
      v.CFrame = v.CFrame + Vector3.new(0, 26, 0)
    end

   elseif value=="Lower"then
    for _,v in pairs(game.workspace.Bridge.VerticalLiftBridge.Lift:GetChildren()) do
      v.CFrame = v.CFrame + Vector3.new(0, -26, 0)
    end
  end;
end
function modwood()
  local wood
  local Saw
  notify("自动加工", "请点击一颗树", 4)
  local ModTree = mouse.Button1Up:Connect(function()
    local obj = mouse.Target.Parent
    if not obj:FindFirstChild "RootCut" and obj.Parent.Name == "TreeRegion" then
      return notify("错误!", "这棵树还没有砍!", 3)
    end
    if obj:FindFirstChild "Owner" and obj.Owner.Value == lp and obj:FindFirstChild "WoodSection" then
      wood = obj
      notify("一键加工", "已选择树!", 3)
    end
    if obj.Name:find("Sawmill")then
      Saw=sawmill;
      notify("小中","剧木机已选择",4)
     elseif obj.Parent.Name:find("Sawmill")or obj.Parent:FindFirstChild"BlockageAlert"then
      Saw=obj.Parent
      notify("小中","剧木机已选择",4)
    end;
  end
  )
  repeat
    task.wait(.01)
  until wood and Saw ~= nil
  ModTree:Disconnect()
  ModTree = nil
  local SawC = Saw.Particles.CFrame + Vector3.new(0.7, 0)
  local cu,cw= 0,nil
  for p, I in next, wood:GetChildren() do
    if I.Name == "WoodSection" then
      if I.ID.Value > cu then
        cu = I.ID.Value
        cw=I
      end
    end
  end
  for p, I in next, wood:GetChildren() do
    if I.Name == "WoodSection" then

      for p, b in next, I.ChildIDs:GetChildren() do

        if b.Value ==cu then
          cv = I

        end
      end
    end
  end
  tp(cv.CFrame)
  wait()
  repeat wait(0.1)
    cv.CFrame = game.Workspace["Region_Volcano"].Lava.Lava.CFrame
  until cv:FindFirstChild("LavaFire");
  cv:FindFirstChild("LavaFire"):Destroy();
  tp(cw.CFrame)
  for i=1,20 do
    cw:MoveTo(Saw)
    cw.CFrame=SawC
  end
end
local function bringTree(treeClass)
  lp.Character.Humanoid:UnequipTools()
  local oldPos=lp.Character.HumanoidRootPart.CFrame;
  local tool
  local tool=0
  for i,v in pairs (lp.Backpack:GetChildren()) do
    if v.Name ~= "BlueprintTool"then
      tool=tool+1
    end
  end
  if tool==0 then
    return
    notify("小中","你需要斧头",4)
  end


  for i,v in pairs (lp.Backpack:GetChildren()) do
    if v.Name ~= "BlueprintTool"then

      tool = v
    end
  end
  local toolname
  for i ,v in pairs (tool:GetChildren()) do
    if v.Name=="ToolName" then
      toolname=v.Value

    end
  end

  local axestr=toolsta(toolname)
  if axestr.SpecialTrees and axestr.SpecialTrees[treeClass] then
    for i, v in next, axestr.SpecialTrees[treeClass] do
      axestr[i] = v
    end
  end
  local tree = getBiggestTree(treeClass)

  if not tree then
    return notify("小中","没有找到树",4)
  end




  local treeCut = false
  if treeClass=="LoveCave" and axestr.Damage<10000000 then
    return notify("小中","要更强的斧头") end
  if treeClass=="Shine" and axestr.Damage<80000000 then
    return notify("小中","要更加的斧头") end
  if treeClass=="Shine" and axestr.Damage<80000000 then
    return notify("小中","要更加的斧头") end
  if treeClass=="Magma" and axestr.Damage<10000000 then
    return notify("小中","要更加的斧头") end
  if treeClass=="Ice" and axestr.Damage<8000000 then
    return notify("小中","要更加的斧头") end
  if treeClass== "Radioactive" and axestr.Damage<10000000 then
    return notify("小中","要更加的斧头") end
  if treeClass== "Scale" and axestr.Damage<40000000 then
    return notify("小中","要更加的斧头") end

  workspace.Camera.CameraSubject = tree
  treeListener(treeClass, function(tree)
    tree.PrimaryPart = tree:FindFirstChild("WoodSection")
    treeCut = true
    wait()
    workspace.Camera.CameraSubject = lp.Character

  end)

  task.wait()


  repeat


    cutPart(tool,tree.Parent.CutEvent, treeClass,axestr.Damage)
    wait()
  until treeCut


end
local cashierIds = {}
local connection = game.ReplicatedStorage.NPCDialog.PromptChat.OnClientEvent:connect(function(bu, data)
  if cashierIds[data.Name] == nil then
    cashierIds[data.Name] = data.ID;
  end
end)

game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(1)
spawn(function()
  repeat wait(0.5) until cashierIds["Thom"] ~= nil
  wait(3)
  connection:Disconnect()
  connection = nil
  game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(0)

end)
local bt = false;

function finditem(BItem)
  local NameStore,Cashier,CID,StoreItems, Counter
  for _,w in pairs (s.ShopItems:GetChildren()) do
    if w.Name=="Bed1" or w.Name=="Seat_Couch" then
      NameStore = "Corey"
      Cashier = game.Workspace.Stores.FurnitureStore.Corey
      StoreItems =l
      Counter = game.Workspace.Stores.FurnitureStore.Counter.CFrame + Vector3.new(0, .4, 0)

     elseif w.Name=="Sawmill" or w.Name=="Sawmill2" then
      NameStore = "Thom"
      Cashier = game.Workspace.Stores.WoodRUs.Thom
      StoreItems =l
      Counter = game.Workspace.Stores.WoodRUs.Counter.CFrame + Vector3.new(0, .4, 0)

     elseif w.Name=="Trailer2" or w.Name=="UtilityTruck2" then
      NameStore = "Jenny"
      Cashier = game.Workspace.Stores.CarStore.Jenny
      StoreItems =l
      Counter = game.Workspace.Stores.CarStore.Counter.CFrame + Vector3.new(0, .4, 0)

     elseif w.Name=="CanOfWorms" or w.Name=="Dynamite" then
      NameStore = "Bob"
      Cashier = game.Workspace.Stores.ShackSho.Bob
      StoreItems =l
      Counter = game.Workspace.Stores.ShackShop.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="Painting1" or w.Name=="Painting2" then
      NameStore = "Timothy"
      Cashier = game.Workspace.Stores.FineArt.Timothy
      StoreItems =l
      Counter = game.Workspace.Stores.FineArt.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="GateXOR" or w.Name=="NeonWireOrange" then
      NameStore = "Lincoln"
      Cashier = game.Workspace.Stores.LogicStore.Lincoln
      StoreItems =l
      Counter = game.Workspace.Stores.LogicStore.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="BeachBall" or w.Name=="Cookie" then
      NameStore = "Guy"
      Cashier = game:GetService("Workspace").Stores.SeaSide.Guy
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.SeaSide.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="StrangeMan" or w.Name=="EndtimesChainsaw" then
      NameStore = "sneakypotato7"
      Cashier = game:GetService("Workspace").Stores.BlackMarket.sneakypotato7
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.BlackMarket.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="GoldGameCube" or w.Name=="GoldConveyorFunnel" then
      NameStore = "Todd"
      Cashier =game:GetService("Workspace").Stores.VIPSHOP.Todd
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.VIPSHOP.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="Playstation" or w.Name=="SawmillGift" then
      NameStore = "Mr.Bacon"
      Cashier =game:GetService("Workspace").Stores.MountainSide["Mr.Bacon"]
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.MountainSide.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="MegaConveyorFunnel" or w.Name=="GameCube" then
      NameStore = "Bloxyway"
      Cashier =game:GetService("Workspace").Stores.SamsStuff.Bloxyway
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.SamsStuff.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="StorageBox" or w.Name=="StorageBox" then
      NameStore = "Geck"
      Cashier =game:GetService("Workspace").Stores.BoatsStore.Geck
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.BoatsStore.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="FireRock" or w.Name=="PotFrost" then
      NameStore = "OGxOutcast"
      Cashier =game:GetService("Workspace").Stores.PlanterStore.OGxOutcast
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.PlanterStore.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="LumberCD" or w.Name=="UtilityVolt" then
      NameStore = "NotPlantomic56"
      Cashier =game:GetService("Workspace").Stores.TravelingTrader.NotPlantomic56
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.TravelingTrader.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="Eye1" or w.Name=="PumpkinClassic" then
      NameStore = "Sally"
      Cashier =game:GetService("Workspace").Stores.SallysSeasonal.Sally
      StoreItems =l
      Counter =game:GetService("Workspace").Stores.SallysSeasonal.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="LumberCDDab" or w.Name=="Lemon" then
      NameStore = "dab529"
      Cashier =game:GetService("Workspace").Stores.StoneRUs.dab529
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.StoneRUs.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="LeafCutters" or w.Name=="LeafFurnace" then
      NameStore = "William"
      Cashier =game:GetService("Workspace").Stores.AutumnCatalog.William
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.AutumnCatalog.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="AxeIce" or w.Name=="Cocoa" then
      NameStore = "Cold Guy"
      Cashier =game:GetService("Workspace").Stores.Igloo["Cold Guy"]
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.Igloo.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="Egg" or w.Name=="HappyBall" then
      NameStore = "Plantomic56"
      Cashier =game:GetService("Workspace").Stores.PlantomicsChoice.Plantomic56
      StoreItems =l
      Counter = game:GetService("Workspace").Stores.PlantomicsChoice.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="Wall2Round" or w.Name=="WritableSign" then
      NameStore = "Manachron"
      Cashier =game:GetService("Workspace").Stores.FineFinds.Manachron
      StoreItems =l
      Counter= game:GetService("Workspace").Stores.FineFinds.Counter.CFrame + Vector3.new(0, .4, 0)
     elseif w.Name=="SaplingCrate" or w.Name=="Planter2" then
      NameStore = "Billy"
      Cashier =game:GetService("Workspace").Stores.SaplingCart.Billy
      StoreItems =l
      Counter= game:GetService("Workspace").Stores.SaplingCart.Counter.CFrame + Vector3.new(0, .4, 0)




    end

  end




  if NameStore~=nil then
    return{NameStore,Cashier,cashierIds[Cashier.Name],Counter,StoreItems}
  end
end



local function shuaxinlb(includeSelf)
    bai.dropdown = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        if includeSelf or player ~= lp then
            table.insert(bai.dropdown, player.Name)
        end
    end
end
shuaxinlb(true)  
repeat task.wait() until game:IsLoaded()
game.StarterGui:SetCore("SendNotification", {
  Title = "小部分源码是白脚本的请原谅(没有倒卖)🥺",
  Text = "作者:小中/QQ名:L",
  Icon = "",
  Duration = 10,
})

local library = {}
local ToggleUI = false
library.currentTab = nil
library.flags = {}

local services = setmetatable({}, {
  __index = function(t, k)
    return game.GetService(game, k)
  end
})

local mouse = services.Players.LocalPlayer:GetMouse()

function Tween(obj, t, data)
  services.TweenService:Create(obj, TweenInfo.new(t[1], Enum.EasingStyle[t[2]], Enum.EasingDirection[t[3]]), data):Play()
  return true
end

function Ripple(obj)
  spawn(function()
    if obj.ClipsDescendants ~= true then
      obj.ClipsDescendants = true
    end
    local Ripple = Instance.new("ImageLabel")
    Ripple.Name = "Ripple"
    Ripple.Parent = obj
    Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ripple.BackgroundTransparency = 1.000
    Ripple.ZIndex = 8
    Ripple.Image = "rbxassetid://16785029075"
    Ripple.ImageTransparency = 0.800
    Ripple.ScaleType = Enum.ScaleType.Fit
    Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Ripple.Position = UDim2.new((mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0)
    Tween(Ripple, {.3, 'Linear', 'InOut'}, {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)})
    wait(0.15)
    Tween(Ripple, {.3, 'Linear', 'InOut'}, {ImageTransparency = 1})
    wait(.3)
    Ripple:Destroy()
  end)
end

local toggled = false

-- # Switch Tabs # --
local switchingTabs = false
function switchTab(new)
  if switchingTabs then return end
  local old = library.currentTab
  if old == nil then
    new[2].Visible = true
    library.currentTab = new
    services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
    services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
    return
  end

  if old[1] == new[1] then return end
  switchingTabs = true
  library.currentTab = new

  services.TweenService:Create(old[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
  services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
  services.TweenService:Create(old[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
  services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

  old[2].Visible = false
  new[2].Visible = true

  task.wait(0.1)

  switchingTabs = false
end

-- # Drag, Stolen from Kiriot or Wally # --
function drag(frame, hold)
  if not hold then
    hold = frame
  end
  local dragging
  local dragInput
  local dragStart
  local startPos

  local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
  end

  hold.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      dragging = true
      dragStart = input.Position
      startPos = frame.Position

      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          dragging = false
        end
      end)
    end
  end)

  frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
      dragInput = input
    end
  end)

  services.UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
      update(input)
    end
  end)
end

function library.new(library, name,theme)
  for _, v in next, services.CoreGui:GetChildren() do
    if v.Name == "qing" then
      v:Destroy()
    end
  end
  if theme == 'qing' then
    MainColor = Color3.fromRGB(10, 25, 255)
    Background = Color3.fromRGB(10, 25, 255)
    zyColor= Color3.fromRGB(10, 25, 255)
    beijingColor = Color3.fromRGB(10, 25, 255)
   else
    MainColor = Color3.fromRGB(0, 51, 179)
    Background = Color3.fromRGB(0, 51, 179)
    zyColor= Color3.fromRGB(0, 51, 179)
    beijingColor = Color3.fromRGB(0, 51, 179)
  end
  local dogent = Instance.new("ScreenGui")
  local OP = Instance.new("ImageLabel")
  local Main = Instance.new("Frame")
  local TabMain = Instance.new("Frame")
  local MainC = Instance.new("UICorner")
  local SB = Instance.new("Frame")
  local SBC = Instance.new("UICorner")
  local Side = Instance.new("Frame")
  local SideG = Instance.new("UIGradient")
  local TabBtns = Instance.new("ScrollingFrame")
  local TabBtnsL = Instance.new("UIListLayout")
  local ScriptTitle = Instance.new("TextLabel")
  local SBG = Instance.new("UIGradient")
  local Open = Instance.new("TextButton")
  local UIG=Instance.new("UIGradient")
  local DropShadowHolder = Instance.new("Frame")
  local DropShadow = Instance.new("ImageLabel")
  local UICornerMain = Instance.new("UICorner")
  local UIGradient=Instance.new("UIGradient")
  local UIGradientTitle=Instance.new("UIGradient")

  if syn and syn.protect_gui then syn.protect_gui(dogent) end

  dogent.Name = "qing"
  dogent.Parent = services.CoreGui

  function UiDestroy()
    dogent:Destroy()
  end

  function ToggleUILib()
    if not ToggleUI then
      dogent.Enabled = false
      ToggleUI = true
     else
      ToggleUI = false
      dogent.Enabled = true
    end
  end

  Main.Name = "Main"
  Main.Parent = dogent
  Main.AnchorPoint = Vector2.new(0.5, 0.5)
  Main.BackgroundColor3 = Background
  Main.BorderColor3 = MainColor
  Main.Position = UDim2.new(0.5, 0, 0.5, 0)
  Main.Size = UDim2.new(0, 572, 0, 353)
  Main.ZIndex = 1
  Main.Active = true
  Main.Draggable = true
  services.UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftControl then
      if Main.Visible == true then
        Main.Visible = false else
        Main.Visible = true
      end
    end
  end)
  drag(Main)

  UICornerMain.Parent = Main
  UICornerMain.CornerRadius = UDim.new(0,3)

  OP.Parent = Main
  OP.Image = "rbxassetid://16785029075"
  OP.Size = UDim2.new(0, 572, 0, 353)

  DropShadowHolder.Name = "DropShadowHolder"
  DropShadowHolder.Parent = Main
  DropShadowHolder.BackgroundTransparency = 1.000
  DropShadowHolder.BorderSizePixel = 0
  DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
  DropShadowHolder.BorderColor3 = Color3.fromRGB(255,255,255)
  DropShadowHolder.ZIndex = 0

  DropShadow.Name = "DropShadow"
  DropShadow.Parent = DropShadowHolder
  DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
  DropShadow.BackgroundTransparency = 1.000
  DropShadow.BorderSizePixel = 0
  DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
  DropShadow.Size = UDim2.new(1, 43, 1, 43)
  DropShadow.ZIndex = 0
  DropShadow.Image = "rbxassetid://6015897843"
  DropShadow.ImageColor3 = Color3.fromRGB(255,255,255)
  DropShadow.ImageTransparency = 0.500
  DropShadow.ScaleType = Enum.ScaleType.Slice
  DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)


  UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))}
  UIGradient.Parent = DropShadow

  local TweenService = game:GetService("TweenService")
  local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
  local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
  tween:Play()

  function toggleui()
    toggled = not toggled
    spawn(function()
      if toggled then wait(0.3) end
    end)
    Tween(Main, {0.3, 'Sine', 'InOut'}, {
      Size = UDim2.new(0, 609, 0, (toggled and 505 or 0))
    })
  end

  TabMain.Name = "TabMain"
  TabMain.Parent = Main
  TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TabMain.BackgroundTransparency = 1.000
  TabMain.Position = UDim2.new(0.217000037, 0, 0, 3)
  TabMain.Size = UDim2.new(0, 448, 0, 353)

  MainC.CornerRadius = UDim.new(0, 5.5)
  MainC.Name = "MainC"
  MainC.Parent = Main

  SB.Name = "SB"
  SB.Parent = Main
  SB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  SB.BorderColor3 = MainColor
  SB.Size = UDim2.new(0, 8, 0, 353)

  SBC.CornerRadius = UDim.new(0, 6)
  SBC.Name = "SBC"
  SBC.Parent = SB

  Side.Name = "Side"
  Side.Parent = SB
  Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Side.BorderColor3 = Color3.fromRGB(255, 255, 255)
  Side.BorderSizePixel = 0
  Side.ClipsDescendants = true
  Side.Position = UDim2.new(1, 0, 0, 0)
  Side.Size = UDim2.new(0, 110, 0, 353)

  SideG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
  SideG.Rotation = 90
  SideG.Name = "SideG"
  SideG.Parent = Side

  TabBtns.Name = "TabBtns"
  TabBtns.Parent = Side
  TabBtns.Active = true
  TabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  TabBtns.BackgroundTransparency = 1.000
  TabBtns.BorderSizePixel = 0
  TabBtns.Position = UDim2.new(0, 0, 0.0973535776, 0)
  TabBtns.Size = UDim2.new(0, 110, 0, 318)
  TabBtns.CanvasSize = UDim2.new(0, 0, 1, 0)
  TabBtns.ScrollBarThickness = 0

  TabBtnsL.Name = "TabBtnsL"
  TabBtnsL.Parent = TabBtns
  TabBtnsL.SortOrder = Enum.SortOrder.LayoutOrder
  TabBtnsL.Padding = UDim.new(0, 12)

  ScriptTitle.Name = "ScriptTitle"
  ScriptTitle.Parent = Side
  ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  ScriptTitle.BackgroundTransparency = 1.000
  ScriptTitle.Position = UDim2.new(0, 0, 0.00953488424, 0)
  ScriptTitle.Size = UDim2.new(0, 102, 0, 20)
  ScriptTitle.Font = Enum.Font.GothamSemibold
  ScriptTitle.Text = name
  ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
  ScriptTitle.TextSize = 14.000
  ScriptTitle.TextScaled = true
  ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left

  UIGradientTitle.Parent = ScriptTitle

  local function NPLHKB_fake_script()
    local script = Instance.new('LocalScript', ScriptTitle)

    local button = script.Parent
    local gradient = button.UIGradient
    local ts = game:GetService("TweenService")
    local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local offset = {Offset = Vector2.new(1, 0)}
    local create = ts:Create(gradient, ti, offset)
    local startingPos = Vector2.new(-1, 0)
    local list = {}
    local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
    local counter = 0
    local status = "down"
    gradient.Offset = startingPos
    local function rainbowColors()
      local sat, val = 255, 255
      for i = 1, 10 do
        local hue = i * 17
        table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
      end
    end
    rainbowColors()
    gradient.Color = s({
      kpt(0, list[#list]),
      kpt(0.5, list[#list - 1]),
      kpt(1, list[#list - 2])
    })
    counter = #list
    local function animate()
      create:Play()
      create.Completed:Wait()
      gradient.Offset = startingPos
      gradient.Rotation = 180
      if counter == #list - 1 and status == "down" then
        gradient.Color = s({
          kpt(0, gradient.Color.Keypoints[1].Value),
          kpt(0.5, list[#list]),
          kpt(1, list[1])
        })
        counter = 1
        status = "up"
       elseif counter == #list and status == "down" then
        gradient.Color = s({
          kpt(0, gradient.Color.Keypoints[1].Value),
          kpt(0.5, list[1]),
          kpt(1, list[2])
        })
        counter = 2
        status = "up"
       elseif counter <= #list - 2 and status == "down" then
        gradient.Color = s({
          kpt(0, gradient.Color.Keypoints[1].Value),
          kpt(0.5, list[counter + 1]),
          kpt(1, list[counter + 2])
        })
        counter = counter + 2
        status = "up"
      end
      create:Play()
      create.Completed:Wait()
      gradient.Offset = startingPos
      gradient.Rotation = 0
      if counter == #list - 1 and status == "up" then
        gradient.Color = s({

          kpt(0, list[1]),
          kpt(0.5, list[#list]),
          kpt(1, gradient.Color.Keypoints[3].Value)
        })
        counter = 1
        status = "down"
       elseif counter == #list and status == "up" then
        gradient.Color = s({
          kpt(0, list[2]),
          kpt(0.5, list[1]),
          kpt(1, gradient.Color.Keypoints[3].Value)
        })
        counter = 2
        status = "down"
       elseif counter <= #list - 2 and status == "up" then
        gradient.Color = s({
          kpt(0, list[counter + 2]),
          kpt(0.5, list[counter + 1]),
          kpt(1, gradient.Color.Keypoints[3].Value)
        })
        counter = counter + 2
        status = "down"
      end
      animate()
    end
    animate()

  end
  coroutine.wrap(NPLHKB_fake_script)()

  SBG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
  SBG.Rotation = 90
  SBG.Name = "SBG"
  SBG.Parent = SB

  TabBtnsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TabBtns.CanvasSize = UDim2.new(0, 0, 0, TabBtnsL.AbsoluteContentSize.Y + 18)
  end)
  Open.Name = "Open"
  Open.Parent = dogent
  Open.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  Open.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
  Open.Size = UDim2.new(0, 61, 0, 32)
  Open.Font = Enum.Font.SourceSans
  Open.Text = "关/开"
  Open.TextColor3 = Color3.fromRGB(255, 255, 255)
  Open.TextSize = 14.000
  Open.Active = true
  Open.Draggable = true
  Open.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
  end)
  UIG.Parent = Open
  local window = {}
  function window.Tab(window, name, icon)
    local Tab = Instance.new("ScrollingFrame")
    local TabIco = Instance.new("ImageLabel")
    local TabText = Instance.new("TextLabel")
    local TabBtn = Instance.new("TextButton")
    local TabL = Instance.new("UIListLayout")

    Tab.Name = "Tab"
    Tab.Parent = TabMain
    Tab.Active = true
    Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab.BackgroundTransparency = 1.000
    Tab.Size = UDim2.new(1, 0, 1, 0)
    Tab.ScrollBarThickness = 2
    Tab.Visible = false

    TabIco.Name = "TabIco"
    TabIco.Parent = TabBtns
    TabIco.BackgroundTransparency = 1.000
    TabIco.BorderSizePixel = 0
    TabIco.Size = UDim2.new(0, 24, 0, 24)
    TabIco.Image = ("rbxassetid://%s"):format((icon or 4370341699))
    TabIco.ImageTransparency = 0.2

    TabText.Name = "TabText"
    TabText.Parent = TabIco
    TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabText.BackgroundTransparency = 1.000
    TabText.Position = UDim2.new(1.41666663, 0, 0, 0)
    TabText.Size = UDim2.new(0, 76, 0, 24)
    TabText.Font = Enum.Font.GothamSemibold
    TabText.Text = name
    TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabText.TextSize = 14.000
    TabText.TextXAlignment = Enum.TextXAlignment.Left
    TabText.TextTransparency = 0.2

    TabBtn.Name = "TabBtn"
    TabBtn.Parent = TabIco
    TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabBtn.BackgroundTransparency = 1.000
    TabBtn.BorderSizePixel = 0
    TabBtn.Size = UDim2.new(0, 110, 0, 24)
    TabBtn.AutoButtonColor = false
    TabBtn.Font = Enum.Font.SourceSans
    TabBtn.Text = ""
    TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    TabBtn.TextSize = 14.000

    TabL.Name = "TabL"
    TabL.Parent = Tab
    TabL.SortOrder = Enum.SortOrder.LayoutOrder
    TabL.Padding = UDim.new(0, 4)

    TabBtn.MouseButton1Click:Connect(function()
      spawn(function()
        Ripple(TabBtn)
      end)
      switchTab({TabIco, Tab})
    end)

    if library.currentTab == nil then switchTab({TabIco, Tab}) end

    TabL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      Tab.CanvasSize = UDim2.new(0, 0, 0, TabL.AbsoluteContentSize.Y + 8)
    end)

    local tab = {}
    function tab.section(tab, name, TabVal)
      local Section = Instance.new("Frame")
      local SectionC = Instance.new("UICorner")
      local SectionText = Instance.new("TextLabel")
      local SectionOpen = Instance.new("ImageLabel")
      local SectionOpened = Instance.new("ImageLabel")
      local SectionToggle = Instance.new("ImageButton")
      local Objs = Instance.new("Frame")
      local ObjsL = Instance.new("UIListLayout")

      Section.Name = "Section"
      Section.Parent = Tab
      Section.BackgroundColor3 = Color3.fromRGB(102, 190, 193)
      Section.BackgroundTransparency = 1.000
      Section.BorderSizePixel = 0
      Section.ClipsDescendants = true
      Section.Size = UDim2.new(0.981000006, 0, 0, 36)

      SectionC.CornerRadius = UDim.new(0, 6)
      SectionC.Name = "SectionC"
      SectionC.Parent = Section

      SectionText.Name = "SectionText"
      SectionText.Parent = Section
      SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      SectionText.BackgroundTransparency = 1.000
      SectionText.Position = UDim2.new(0.0887396261, 0, 0, 0)
      SectionText.Size = UDim2.new(0, 401, 0, 36)
      SectionText.Font = Enum.Font.GothamSemibold
      SectionText.Text = name
      SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
      SectionText.TextSize = 16.000
      SectionText.TextXAlignment = Enum.TextXAlignment.Left

      SectionOpen.Name = "SectionOpen"
      SectionOpen.Parent = SectionText
      SectionOpen.BackgroundTransparency = 1
      SectionOpen.BorderSizePixel = 0
      SectionOpen.Position = UDim2.new(0, -33, 0, 5)
      SectionOpen.Size = UDim2.new(0, 26, 0, 26)
      SectionOpen.Image = "http://www.roblox.com/asset/?id=6031302934"

      SectionOpened.Name = "SectionOpened"
      SectionOpened.Parent = SectionOpen
      SectionOpened.BackgroundTransparency = 1.000
      SectionOpened.BorderSizePixel = 0
      SectionOpened.Size = UDim2.new(0, 26, 0, 26)
      SectionOpened.Image = "http://www.roblox.com/asset/?id=6031302932"
      SectionOpened.ImageTransparency = 1.000

      SectionToggle.Name = "SectionToggle"
      SectionToggle.Parent = SectionOpen
      SectionToggle.BackgroundTransparency = 1
      SectionToggle.BorderSizePixel = 0
      SectionToggle.Size = UDim2.new(0, 26, 0, 26)

      Objs.Name = "Objs"
      Objs.Parent = Section
      Objs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Objs.BackgroundTransparency = 1
      Objs.BorderSizePixel = 0
      Objs.Position = UDim2.new(0, 6, 0, 36)
      Objs.Size = UDim2.new(0.986347735, 0, 0, 0)

      ObjsL.Name = "ObjsL"
      ObjsL.Parent = Objs
      ObjsL.SortOrder = Enum.SortOrder.LayoutOrder
      ObjsL.Padding = UDim.new(0, 8)

      local open = TabVal
      if TabVal ~= false then
        Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
        SectionOpened.ImageTransparency = (open and 0 or 1)
        SectionOpen.ImageTransparency = (open and 1 or 0)
      end

      SectionToggle.MouseButton1Click:Connect(function()
        open = not open
        Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
        SectionOpened.ImageTransparency = (open and 0 or 1)
        SectionOpen.ImageTransparency = (open and 1 or 0)
      end)

      ObjsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if not open then return end
        Section.Size = UDim2.new(0.981000006, 0, 0, 36 + ObjsL.AbsoluteContentSize.Y + 8)
      end)

      local section = {}
      function section.Button(section, text, callback)
        local callback = callback or function() end

        local BtnModule = Instance.new("Frame")
        local Btn = Instance.new("TextButton")
        local BtnC = Instance.new("UICorner")

        BtnModule.Name = "BtnModule"
        BtnModule.Parent = Objs
        BtnModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        BtnModule.BackgroundTransparency = 1.000
        BtnModule.BorderSizePixel = 0
        BtnModule.Position = UDim2.new(0, 0, 0, 0)
        BtnModule.Size = UDim2.new(0, 428, 0, 38)

        Btn.Name = "Btn"
        Btn.Parent = BtnModule
        Btn.BackgroundColor3 = zyColor
        Btn.BorderSizePixel = 0
        Btn.Size = UDim2.new(0, 428, 0, 38)
        Btn.AutoButtonColor = false
        Btn.Font = Enum.Font.GothamSemibold
        Btn.Text = "   " .. text
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Btn.TextSize = 16.000
        Btn.TextXAlignment = Enum.TextXAlignment.Left

        BtnC.CornerRadius = UDim.new(0, 6)
        BtnC.Name = "BtnC"
        BtnC.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
          spawn(function()
            Ripple(Btn)
          end)
          spawn(callback)
        end)
      end

      function section:Label(text)
        local LabelModule = Instance.new("Frame")
        local TextLabel = Instance.new("TextLabel")
        local LabelC = Instance.new("UICorner")

        LabelModule.Name = "LabelModule"
        LabelModule.Parent = Objs
        LabelModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelModule.BackgroundTransparency = 1.000
        LabelModule.BorderSizePixel = 0
        LabelModule.Position = UDim2.new(0, 0, NAN, 0)
        LabelModule.Size = UDim2.new(0, 428, 0, 19)

        TextLabel.Parent = LabelModule
        TextLabel.BackgroundColor3 = zyColor
        TextLabel.Size = UDim2.new(0, 428, 0, 22)
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Text = text
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 14.000

        LabelC.CornerRadius = UDim.new(0, 6)
        LabelC.Name = "LabelC"
        LabelC.Parent = TextLabel
        return TextLabel
      end

      function section.Toggle(section, text, flag, enabled, callback)
        local callback = callback or function() end
        local enabled = enabled or false
        assert(text, "No text provided")
        assert(flag, "No flag provided")

        library.flags[flag] = enabled

        local ToggleModule = Instance.new("Frame")
        local ToggleBtn = Instance.new("TextButton")
        local ToggleBtnC = Instance.new("UICorner")
        local ToggleDisable = Instance.new("Frame")
        local ToggleSwitch = Instance.new("Frame")
        local ToggleSwitchC = Instance.new("UICorner")
        local ToggleDisableC = Instance.new("UICorner")

        ToggleModule.Name = "ToggleModule"
        ToggleModule.Parent = Objs
        ToggleModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleModule.BackgroundTransparency = 1.000
        ToggleModule.BorderSizePixel = 0
        ToggleModule.Position = UDim2.new(0, 0, 0, 0)
        ToggleModule.Size = UDim2.new(0, 428, 0, 38)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = ToggleModule
        ToggleBtn.BackgroundColor3 = zyColor
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Size = UDim2.new(0, 428, 0, 38)
        ToggleBtn.AutoButtonColor = false
        ToggleBtn.Font = Enum.Font.GothamSemibold
        ToggleBtn.Text = "   " .. text
        ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.TextSize = 16.000
        ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left

        ToggleBtnC.CornerRadius = UDim.new(0, 6)
        ToggleBtnC.Name = "ToggleBtnC"
        ToggleBtnC.Parent = ToggleBtn

        ToggleDisable.Name = "ToggleDisable"
        ToggleDisable.Parent = ToggleBtn
        ToggleDisable.BackgroundColor3 = Background
        ToggleDisable.BorderSizePixel = 0
        ToggleDisable.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
        ToggleDisable.Size = UDim2.new(0, 36, 0, 22)

        ToggleSwitch.Name = "ToggleSwitch"
        ToggleSwitch.Parent = ToggleDisable
        ToggleSwitch.BackgroundColor3 = beijingColor
        ToggleSwitch.Size = UDim2.new(0, 24, 0, 22)

        ToggleSwitchC.CornerRadius = UDim.new(0, 6)
        ToggleSwitchC.Name = "ToggleSwitchC"
        ToggleSwitchC.Parent = ToggleSwitch

        ToggleDisableC.CornerRadius = UDim.new(0, 6)
        ToggleDisableC.Name = "ToggleDisableC"
        ToggleDisableC.Parent = ToggleDisable

        local funcs = {
          SetState = function(self, state)
            if state == nil then state = not library.flags[flag] end
            if library.flags[flag] == state then return end
            services.TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {Position = UDim2.new(0, (state and ToggleSwitch.Size.X.Offset / 2 or 0), 0, 0), BackgroundColor3 = (state and Color3.fromRGB(255, 255, 255) or beijingColor)}):Play()
            library.flags[flag] = state
            callback(state)
          end,
          Module = ToggleModule
        }

        if enabled ~= false then
          funcs:SetState(flag,true)
        end

        ToggleBtn.MouseButton1Click:Connect(function()
          funcs:SetState()
        end)
        return funcs
      end

      function section.Keybind(section, text, default, callback)
        local callback = callback or function() end
        assert(text, "No text provided")
        assert(default, "No default key provided")

        local default = (typeof(default) == "string" and Enum.KeyCode[default] or default)
        local banned = {
          Return = true;
          Space = true;
          Tab = true;
          Backquote = true;
          CapsLock = true;
          Escape = true;
          Unknown = true;
        }
        local shortNames = {
          RightControl = 'Right Ctrl',
          LeftControl = 'Left Ctrl',
          LeftShift = 'Left Shift',
          RightShift = 'Right Shift',
          Semicolon = ";",
          Quote = '"',
          LeftBracket = '[',
          RightBracket = ']',
          Equals = '=',
          Minus = '-',
          RightAlt = 'Right Alt',
          LeftAlt = 'Left Alt'
        }

        local bindKey = default
        local keyTxt = (default and (shortNames[default.Name] or default.Name) or "None")

        local KeybindModule = Instance.new("Frame")
        local KeybindBtn = Instance.new("TextButton")
        local KeybindBtnC = Instance.new("UICorner")
        local KeybindValue = Instance.new("TextButton")
        local KeybindValueC = Instance.new("UICorner")
        local KeybindL = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")

        KeybindModule.Name = "KeybindModule"
        KeybindModule.Parent = Objs
        KeybindModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        KeybindModule.BackgroundTransparency = 1.000
        KeybindModule.BorderSizePixel = 0
        KeybindModule.Position = UDim2.new(0, 0, 0, 0)
        KeybindModule.Size = UDim2.new(0, 428, 0, 38)

        KeybindBtn.Name = "KeybindBtn"
        KeybindBtn.Parent = KeybindModule
        KeybindBtn.BackgroundColor3 = zyColor
        KeybindBtn.BorderSizePixel = 0
        KeybindBtn.Size = UDim2.new(0, 428, 0, 38)
        KeybindBtn.AutoButtonColor = false
        KeybindBtn.Font = Enum.Font.GothamSemibold
        KeybindBtn.Text = "   " .. text
        KeybindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeybindBtn.TextSize = 16.000
        KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left

        KeybindBtnC.CornerRadius = UDim.new(0, 6)
        KeybindBtnC.Name = "KeybindBtnC"
        KeybindBtnC.Parent = KeybindBtn

        KeybindValue.Name = "KeybindValue"
        KeybindValue.Parent = KeybindBtn
        KeybindValue.BackgroundColor3 = Background
        KeybindValue.BorderSizePixel = 0
        KeybindValue.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
        KeybindValue.Size = UDim2.new(0, 100, 0, 28)
        KeybindValue.AutoButtonColor = false
        KeybindValue.Font = Enum.Font.Gotham
        KeybindValue.Text = keyTxt
        KeybindValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeybindValue.TextSize = 14.000

        KeybindValueC.CornerRadius = UDim.new(0, 6)
        KeybindValueC.Name = "KeybindValueC"
        KeybindValueC.Parent = KeybindValue

        KeybindL.Name = "KeybindL"
        KeybindL.Parent = KeybindBtn
        KeybindL.HorizontalAlignment = Enum.HorizontalAlignment.Right
        KeybindL.SortOrder = Enum.SortOrder.LayoutOrder
        KeybindL.VerticalAlignment = Enum.VerticalAlignment.Center

        UIPadding.Parent = KeybindBtn
        UIPadding.PaddingRight = UDim.new(0, 6)

        services.UserInputService.InputBegan:Connect(function(inp, gpe)
          if gpe then return end
          if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
          if inp.KeyCode ~= bindKey then return end
          callback(bindKey.Name)
        end)

        KeybindValue.MouseButton1Click:Connect(function()
          KeybindValue.Text = "..."
          wait()
          local key, uwu = services.UserInputService.InputEnded:Wait()
          local keyName = tostring(key.KeyCode.Name)
          if key.UserInputType ~= Enum.UserInputType.Keyboard then
            KeybindValue.Text = keyTxt
            return
          end
          if banned[keyName] then
            KeybindValue.Text = keyTxt
            return
          end
          wait()
          bindKey = Enum.KeyCode[keyName]
          KeybindValue.Text = shortNames[keyName] or keyName
        end)

        KeybindValue:GetPropertyChangedSignal("TextBounds"):Connect(function()
          KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
        end)
        KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
      end

      function section.Textbox(section, text, flag, default, callback)
        local callback = callback or function() end
        assert(text, "No text provided")
        assert(flag, "No flag provided")
        assert(default, "No default text provided")

        library.flags[flag] = default

        local TextboxModule = Instance.new("Frame")
        local TextboxBack = Instance.new("TextButton")
        local TextboxBackC = Instance.new("UICorner")
        local BoxBG = Instance.new("TextButton")
        local BoxBGC = Instance.new("UICorner")
        local TextBox = Instance.new("TextBox")
        local TextboxBackL = Instance.new("UIListLayout")
        local TextboxBackP = Instance.new("UIPadding")

        TextboxModule.Name = "TextboxModule"
        TextboxModule.Parent = Objs
        TextboxModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextboxModule.BackgroundTransparency = 1.000
        TextboxModule.BorderSizePixel = 0
        TextboxModule.Position = UDim2.new(0, 0, 0, 0)
        TextboxModule.Size = UDim2.new(0, 428, 0, 38)

        TextboxBack.Name = "TextboxBack"
        TextboxBack.Parent = TextboxModule
        TextboxBack.BackgroundColor3 = zyColor
        TextboxBack.BorderSizePixel = 0
        TextboxBack.Size = UDim2.new(0, 428, 0, 38)
        TextboxBack.AutoButtonColor = false
        TextboxBack.Font = Enum.Font.GothamSemibold
        TextboxBack.Text = "   " .. text
        TextboxBack.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextboxBack.TextSize = 16.000
        TextboxBack.TextXAlignment = Enum.TextXAlignment.Left

        TextboxBackC.CornerRadius = UDim.new(0, 6)
        TextboxBackC.Name = "TextboxBackC"
        TextboxBackC.Parent = TextboxBack

        BoxBG.Name = "BoxBG"
        BoxBG.Parent = TextboxBack
        BoxBG.BackgroundColor3 = Background
        BoxBG.BorderSizePixel = 0
        BoxBG.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
        BoxBG.Size = UDim2.new(0, 100, 0, 28)
        BoxBG.AutoButtonColor = false
        BoxBG.Font = Enum.Font.Gotham
        BoxBG.Text = ""
        BoxBG.TextColor3 = Color3.fromRGB(255, 255, 255)
        BoxBG.TextSize = 14.000

        BoxBGC.CornerRadius = UDim.new(0, 6)
        BoxBGC.Name = "BoxBGC"
        BoxBGC.Parent = BoxBG

        TextBox.Parent = BoxBG
        TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.BackgroundTransparency = 1.000
        TextBox.BorderSizePixel = 0
        TextBox.Size = UDim2.new(1, 0, 1, 0)
        TextBox.Font = Enum.Font.Gotham
        TextBox.Text = default
        TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextBox.TextSize = 14.000

        TextboxBackL.Name = "TextboxBackL"
        TextboxBackL.Parent = TextboxBack
        TextboxBackL.HorizontalAlignment = Enum.HorizontalAlignment.Right
        TextboxBackL.SortOrder = Enum.SortOrder.LayoutOrder
        TextboxBackL.VerticalAlignment = Enum.VerticalAlignment.Center

        TextboxBackP.Name = "TextboxBackP"
        TextboxBackP.Parent = TextboxBack
        TextboxBackP.PaddingRight = UDim.new(0, 6)

        TextBox.FocusLost:Connect(function()
          if TextBox.Text == "" then
            TextBox.Text = default
          end
          library.flags[flag] = TextBox.Text
          callback(TextBox.Text)
        end)

        TextBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
          BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
        end)
        BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
      end

      function section.Slider(section, text, flag, default, min, max, precise, callback)
        local callback = callback or function() end
        local min = min or 1
        local max = max or 10
        local default = default or min
        local precise = precise or false

        library.flags[flag] = default

        assert(text, "No text provided")
        assert(flag, "No flag provided")
        assert(default, "No default value provided")

        local SliderModule = Instance.new("Frame")
        local SliderBack = Instance.new("TextButton")
        local SliderBackC = Instance.new("UICorner")
        local SliderBar = Instance.new("Frame")
        local SliderBarC = Instance.new("UICorner")
        local SliderPart = Instance.new("Frame")
        local SliderPartC = Instance.new("UICorner")
        local SliderValBG = Instance.new("TextButton")
        local SliderValBGC = Instance.new("UICorner")
        local SliderValue = Instance.new("TextBox")
        local MinSlider = Instance.new("TextButton")
        local AddSlider = Instance.new("TextButton")

        SliderModule.Name = "SliderModule"
        SliderModule.Parent = Objs
        SliderModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderModule.BackgroundTransparency = 1.000
        SliderModule.BorderSizePixel = 0
        SliderModule.Position = UDim2.new(0, 0, 0, 0)
        SliderModule.Size = UDim2.new(0, 428, 0, 38)

        SliderBack.Name = "SliderBack"
        SliderBack.Parent = SliderModule
        SliderBack.BackgroundColor3 = zyColor
        SliderBack.BorderSizePixel = 0
        SliderBack.Size = UDim2.new(0, 428, 0, 38)
        SliderBack.AutoButtonColor = false
        SliderBack.Font = Enum.Font.GothamSemibold
        SliderBack.Text = "   " .. text
        SliderBack.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderBack.TextSize = 16.000
        SliderBack.TextXAlignment = Enum.TextXAlignment.Left

        SliderBackC.CornerRadius = UDim.new(0, 6)
        SliderBackC.Name = "SliderBackC"
        SliderBackC.Parent = SliderBack

        SliderBar.Name = "SliderBar"
        SliderBar.Parent = SliderBack
        SliderBar.AnchorPoint = Vector2.new(0, 0.5)
        SliderBar.BackgroundColor3 = Background
        SliderBar.BorderSizePixel = 0
        SliderBar.Position = UDim2.new(0.369000018, 40, 0.5, 0)
        SliderBar.Size = UDim2.new(0, 140, 0, 12)

        SliderBarC.CornerRadius = UDim.new(0, 4)
        SliderBarC.Name = "SliderBarC"
        SliderBarC.Parent = SliderBar

        SliderPart.Name = "SliderPart"
        SliderPart.Parent = SliderBar
        SliderPart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderPart.BorderSizePixel = 0
        SliderPart.Size = UDim2.new(0, 54, 0, 13)

        SliderPartC.CornerRadius = UDim.new(0, 4)
        SliderPartC.Name = "SliderPartC"
        SliderPartC.Parent = SliderPart

        SliderValBG.Name = "SliderValBG"
        SliderValBG.Parent = SliderBack
        SliderValBG.BackgroundColor3 = Background
        SliderValBG.BorderSizePixel = 0
        SliderValBG.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
        SliderValBG.Size = UDim2.new(0, 44, 0, 28)
        SliderValBG.AutoButtonColor = false
        SliderValBG.Font = Enum.Font.Gotham
        SliderValBG.Text = ""
        SliderValBG.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderValBG.TextSize = 14.000

        SliderValBGC.CornerRadius = UDim.new(0, 6)
        SliderValBGC.Name = "SliderValBGC"
        SliderValBGC.Parent = SliderValBG

        SliderValue.Name = "SliderValue"
        SliderValue.Parent = SliderValBG
        SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderValue.BackgroundTransparency = 1.000
        SliderValue.BorderSizePixel = 0
        SliderValue.Size = UDim2.new(1, 0, 1, 0)
        SliderValue.Font = Enum.Font.Gotham
        SliderValue.Text = "1000"
        SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderValue.TextSize = 14.000

        MinSlider.Name = "MinSlider"
        MinSlider.Parent = SliderModule
        MinSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MinSlider.BackgroundTransparency = 1.000
        MinSlider.BorderSizePixel = 0
        MinSlider.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
        MinSlider.Size = UDim2.new(0, 20, 0, 20)
        MinSlider.Font = Enum.Font.Gotham
        MinSlider.Text = "-"
        MinSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        MinSlider.TextSize = 24.000
        MinSlider.TextWrapped = true

        AddSlider.Name = "AddSlider"
        AddSlider.Parent = SliderModule
        AddSlider.AnchorPoint = Vector2.new(0, 0.5)
        AddSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        AddSlider.BackgroundTransparency = 1.000
        AddSlider.BorderSizePixel = 0
        AddSlider.Position = UDim2.new(0.810906529, 0, 0.5, 0)
        AddSlider.Size = UDim2.new(0, 20, 0, 20)
        AddSlider.Font = Enum.Font.Gotham
        AddSlider.Text = "+"
        AddSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        AddSlider.TextSize = 24.000
        AddSlider.TextWrapped = true

        local funcs = {
          SetValue = function(self, value)
            local percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
            if value then
              percent = (value - min) / (max - min)
            end
            percent = math.clamp(percent, 0, 1)
            if precise then
              value = value or tonumber(string.format("%.1f", tostring(min + (max - min) * percent)))
             else
              value = value or math.floor(min + (max - min) * percent)
            end
            library.flags[flag] = tonumber(value)
            SliderValue.Text = tostring(value)
            SliderPart.Size = UDim2.new(percent, 0, 1, 0)
            callback(tonumber(value))
          end
        }

        MinSlider.MouseButton1Click:Connect(function()
          local currentValue = library.flags[flag]
          currentValue = math.clamp(currentValue - 1, min, max)
          funcs:SetValue(currentValue)
        end)

        AddSlider.MouseButton1Click:Connect(function()
          local currentValue = library.flags[flag]
          currentValue = math.clamp(currentValue + 1, min, max)
          funcs:SetValue(currentValue)
        end)

        funcs:SetValue(default)

        local dragging, boxFocused, allowed = false, false, {
          [""] = true,
          ["-"] = true
        }

        SliderBar.InputBegan:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.MouseButton1 then
            funcs:SetValue()
            dragging = true
          end
        end)

        services.UserInputService.InputEnded:Connect(function(input)
          if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
          end
        end)

        services.UserInputService.InputChanged:Connect(function(input)
          if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            funcs:SetValue()
          end
        end)

        SliderBar.InputBegan:Connect(function(input)
          if input.UserInputType == Enum.UserInputType.Touch then
            funcs:SetValue()
            dragging = true
          end
        end)

        services.UserInputService.InputEnded:Connect(function(input)
          if dragging and input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
          end
        end)

        services.UserInputService.InputChanged:Connect(function(input)
          if dragging and input.UserInputType == Enum.UserInputType.Touch then
            funcs:SetValue()
          end
        end)

        SliderValue.Focused:Connect(function()
          boxFocused = true
        end)

        SliderValue.FocusLost:Connect(function()
          boxFocused = false
          if SliderValue.Text == "" then
            funcs:SetValue(default)
          end
        end)

        SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
          if not boxFocused then return end
          SliderValue.Text = SliderValue.Text:gsub("%D+", "")

          local text = SliderValue.Text

          if not tonumber(text) then
            SliderValue.Text = SliderValue.Text:gsub('%D+', '')
           elseif not allowed[text] then
            if tonumber(text) > max then
              text = max
              SliderValue.Text = tostring(max)
            end
            funcs:SetValue(tonumber(text))
          end
        end)

        return funcs
      end
      function section.Dropdown(section, text, flag, options, callback)
        local callback = callback or function() end
        local options = options or {}
        assert(text, "No text provided")
        assert(flag, "No flag provided")

        library.flags[flag] = nil

        local DropdownModule = Instance.new("Frame")
        local DropdownTop = Instance.new("TextButton")
        local DropdownTopC = Instance.new("UICorner")
        local DropdownOpen = Instance.new("TextButton")
        local DropdownText = Instance.new("TextBox")
        local DropdownModuleL = Instance.new("UIListLayout")
        local Option = Instance.new("TextButton")
        local OptionC = Instance.new("UICorner")

        DropdownModule.Name = "DropdownModule"
        DropdownModule.Parent = Objs
        DropdownModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropdownModule.BackgroundTransparency = 1.000
        DropdownModule.BorderSizePixel = 0
        DropdownModule.ClipsDescendants = true
        DropdownModule.Position = UDim2.new(0, 0, 0, 0)
        DropdownModule.Size = UDim2.new(0, 428, 0, 38)

        DropdownTop.Name = "DropdownTop"
        DropdownTop.Parent = DropdownModule
        DropdownTop.BackgroundColor3 = zyColor
        DropdownTop.BorderSizePixel = 0
        DropdownTop.Size = UDim2.new(0, 428, 0, 38)
        DropdownTop.AutoButtonColor = false
        DropdownTop.Font = Enum.Font.GothamSemibold
        DropdownTop.Text = ""
        DropdownTop.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownTop.TextSize = 16.000
        DropdownTop.TextXAlignment = Enum.TextXAlignment.Left

        DropdownTopC.CornerRadius = UDim.new(0, 6)
        DropdownTopC.Name = "DropdownTopC"
        DropdownTopC.Parent = DropdownTop

        DropdownOpen.Name = "DropdownOpen"
        DropdownOpen.Parent = DropdownTop
        DropdownOpen.AnchorPoint = Vector2.new(0, 0.5)
        DropdownOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropdownOpen.BackgroundTransparency = 1.000
        DropdownOpen.BorderSizePixel = 0
        DropdownOpen.Position = UDim2.new(0.918383181, 0, 0.5, 0)
        DropdownOpen.Size = UDim2.new(0, 20, 0, 20)
        DropdownOpen.Font = Enum.Font.Gotham
        DropdownOpen.Text = "+"
        DropdownOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownOpen.TextSize = 24.000
        DropdownOpen.TextWrapped = true

        DropdownText.Name = "DropdownText"
        DropdownText.Parent = DropdownTop
        DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        DropdownText.BackgroundTransparency = 1.000
        DropdownText.BorderSizePixel = 0
        DropdownText.Position = UDim2.new(0.0373831764, 0, 0, 0)
        DropdownText.Size = UDim2.new(0, 184, 0, 38)
        DropdownText.Font = Enum.Font.GothamSemibold
        DropdownText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
        DropdownText.PlaceholderText = text
        DropdownText.Text = ""
        DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownText.TextSize = 16.000
        DropdownText.TextXAlignment = Enum.TextXAlignment.Left

        DropdownModuleL.Name = "DropdownModuleL"
        DropdownModuleL.Parent = DropdownModule
        DropdownModuleL.SortOrder = Enum.SortOrder.LayoutOrder
        DropdownModuleL.Padding = UDim.new(0, 4)

        local setAllVisible = function()
          local options = DropdownModule:GetChildren()
          for i=1, #options do
            local option = options[i]
            if option:IsA("TextButton") and option.Name:match("Option_") then
              option.Visible = true
            end
          end
        end

        local searchDropdown = function(text)
          local options = DropdownModule:GetChildren()
          for i=1, #options do
            local option = options[i]
            if text == "" then
              setAllVisible()
             else
              if option:IsA("TextButton") and option.Name:match("Option_") then
                if option.Text:lower():match(text:lower()) then
                  option.Visible = true
                 else
                  option.Visible = false
                end
              end
            end
          end
        end

        local open = false
        local ToggleDropVis = function()
          open = not open
          if open then setAllVisible() end
          DropdownOpen.Text = (open and "-" or "+")
          DropdownModule.Size = UDim2.new(0, 428, 0, (open and DropdownModuleL.AbsoluteContentSize.Y + 4 or 38))
        end

        DropdownOpen.MouseButton1Click:Connect(ToggleDropVis)
        DropdownText.Focused:Connect(function()
          if open then return end
          ToggleDropVis()
        end)

        DropdownText:GetPropertyChangedSignal("Text"):Connect(function()
          if not open then return end
          searchDropdown(DropdownText.Text)
        end)

        DropdownModuleL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
          if not open then return end
          DropdownModule.Size = UDim2.new(0, 428, 0, (DropdownModuleL.AbsoluteContentSize.Y + 4))
        end)

        local funcs = {}
        funcs.AddOption = function(self, option)
          local Option = Instance.new("TextButton")
          local OptionC = Instance.new("UICorner")

          Option.Name = "Option_" .. option
          Option.Parent = DropdownModule
          Option.BackgroundColor3 = zyColor
          Option.BorderSizePixel = 0
          Option.Position = UDim2.new(0, 0, 0.328125, 0)
          Option.Size = UDim2.new(0, 428, 0, 26)
          Option.AutoButtonColor = false
          Option.Font = Enum.Font.Gotham
          Option.Text = option
          Option.TextColor3 = Color3.fromRGB(255, 255, 255)
          Option.TextSize = 14.000

          OptionC.CornerRadius = UDim.new(0, 6)
          OptionC.Name = "OptionC"
          OptionC.Parent = Option

          Option.MouseButton1Click:Connect(function()
            ToggleDropVis()
            callback(Option.Text)
            DropdownText.Text = Option.Text
            library.flags[flag] = Option.Text
          end)
        end

        funcs.RemoveOption = function(self, option)
          local option = DropdownModule:FindFirstChild("Option_" .. option)
          if option then option:Destroy() end
        end

        funcs.SetOptions = function(self, options)
          for _, v in next, DropdownModule:GetChildren() do
            if v.Name:match("Option_") then
              v:Destroy()
            end
          end
          for _,v in next, options do
            funcs:AddOption(v)
          end
        end

        funcs:SetOptions(options)

        return funcs
      end
      return section
    end
    return tab
  end
  return window
end

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/xcmsnd/QQ515966991/refs/heads/main/Ware_UI%20AL%E9%AB%98%E4%BB%BFV1.0.lua"))();		
local win = ui:new("小中啊~脚本")
--
local UITab1 = win:Tab("作者:小中大号",'7734068321')

local about = UITab1:section("作者信息-作者游戏:小中大号",false)

about:Label(" L脚本")
about:Label(" Q作者：L")
about:Label("作者QQ：2627272316")
about:Button("免费的",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\99\109\115\110\100\47\107\98\100\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\37\69\52\37\66\65\37\56\67\37\69\57\37\56\55\37\56\68\37\69\53\37\56\65\37\65\48\37\69\53\37\65\70\37\56\54\37\69\56\37\66\48\37\56\51\37\69\55\37\57\52\37\65\56\34\41\41\40\41")()
end)

local about = UITab1:section("我的信息",false)

about:Label("你的账号:"..player.AccountAge.."天")
about:Label("你的注入器:"..identifyexecutor())
about:Label("你的用户名:"..game.Players.LocalPlayer.Character.Name)
about:Label("服务器名称:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

local UITab3 = win:Tab("通用",'16060333448')

local about = UITab3:section("功能",true)


about:Button("飞行",function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\70\118\67\80\52\118\72\72\34\41\41\40\41")()
end)

about:Button("空中行走",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

about:Toggle("白天","Toggle",false,function(Value)
        if Value then
        bai.awaysday=true
        while task.wait() do
          if bai.awaysday==true then
            game:GetService("Lighting").TimeOfDay=("12:00:00");
          end
        end
       else bai.awaysday=false
      end

    end)

about:Toggle("无限跳","Toggle",false,function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)
    
    about:Toggle("力量增强","Toggleflag",false,function(state)
  if state then
    workspace.ChildAdded:connect(function(Dragger)
      if tostring(Dragger)=="Dragger"then
        local BodyGyro=Dragger:WaitForChild"BodyGyro";
        local BodyPosition=Dragger:WaitForChild"BodyPosition";
        repeat game:GetService"RunService".Stepped:wait()until workspace:FindFirstChild"Dragger";

        BodyPosition.P=120000;
        BodyPosition.D=1000;
        BodyPosition.maxForce=Vector3.new(1,1,1)*1000000;
        BodyGyro.maxTorque=Vector3.new(1,1,1)*200;
        BodyGyro.P=1200;
        BodyGyro.D=140;

      end
    end)
   else


    workspace.ChildAdded:connect(function(Dragger)
      if tostring(Dragger)=="Dragger"then
        local BodyGyro=Dragger:WaitForChild"BodyGyro";
        local BodyPosition=Dragger:WaitForChild"BodyPosition";
        repeat game:GetService"RunService".Stepped:wait()until workspace:FindFirstChild"Dragger";


        BodyPosition.P=10000;
        BodyPosition.D=800;
        BodyPosition.maxForce=Vector3.new(17000,17000,17000);
        BodyGyro.maxTorque=Vector3.new(200,200,200);
        BodyGyro.P=1200;
        BodyGyro.D=140;
      end;
    end)

  end
end)
    

about:Button("力量增强(拿起力量增加9999)",function()
-- 定义一个配置表，用于存储不同的参数配置
local config = {
    config1 = {
        BodyPosition = {
            P = 120000,
            D = 1000,
            maxForce = Vector3.new(1, 1, 1) * 1000000
        },
        BodyGyro = {
            maxTorque = Vector3.new(1, 1, 1) * 200,
            P = 1200,
            D = 140
        }
    },
    config2 = {
        BodyPosition = {
            P = 10000,
            D = 800,
            maxForce = Vector3.new(17000, 17000, 17000)
        },
        BodyGyro = {
            maxTorque = Vector3.new(200, 200, 200),
            P = 1200,
            D = 140
        }
    }
}

-- 定义一个函数，用于应用配置到 Dragger
local function applyConfig(Dragger, configName)
    local BodyGyro = Dragger:WaitForChild("BodyGyro")
    local BodyPosition = Dragger:WaitForChild("BodyPosition")

    -- 等待 Dragger 出现在 workspace 中
    repeat
        game:GetService("RunService").Stepped:Wait()
    until workspace:FindFirstChild("Dragger")

    -- 应用配置
    for key, value in pairs(config[configName].BodyPosition) do
        BodyPosition[key] = value
    end

    for key, value in pairs(config[configName].BodyGyro) do
        BodyGyro[key] = value
    end
end

-- 监听 workspace 中添加的 Dragger 对象
workspace.ChildAdded:Connect(function(Dragger)
    if tostring(Dragger) == "Dragger" then
        -- 根据需要选择不同的配置，这里可以根据某种条件选择
        -- 这里使用一个简单的条件，如果存在某个变量或条件，则使用 config2，否则使用 config1
        local useConfig2 = false  -- 根据你的逻辑设置这个变量
        if useConfig2 then
            applyConfig(Dragger, "config2")
        else
            applyConfig(Dragger, "config1")
        end
    end
end)
end)

local UITab3 = win:Tab("传送地点",'16060333448')

local about = UITab3:section("传送功能",true)

about:Button("回家",function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)

if not humanoidRootPart then
    warn("角色根部位加载超时")
    return
end

local foundProperty = false

-- 遍历所有地块
for _, property in ipairs(workspace.Properties:GetChildren()) do
    -- 检查地块所有者
    if property:FindFirstChild("Owner") and property.Owner.Value == player then
        -- 检查OriginSquare是否存在
        local originSquare = property:FindFirstChild("OriginSquare")
        if originSquare then
            -- 传送玩家（抬高10单位防止卡地）
            humanoidRootPart.CFrame = originSquare.CFrame + Vector3.new(0, 10, 0)
           
            foundProperty = true
            break  -- 找到后跳出循环
        end
    end
end
end)

about:Button("出生点",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171, 3, 61)
end)

about:Button("辐射商店",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(181, 12, -2648)
end)

about:Button("连锁店地点",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(496, 3, -1584)
end)

about:Button("复仇剑召唤",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6459, -95, -4548)
end)

about:Button("星星岛",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7062, 390, 4878)
end)

about:Button("永恒剑召唤",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-376, 13, -1344)
end)

about:Button("恶魔鸭",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-221, 60, 920)
end)

about:Button("天堂鸭",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184, 12, -2654)
end)

about:Button("雪山",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1657, 400, 3259)
end)

about:Button("地狱",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-859, -247, -444)
end)

about:Button("邪恶徽章召唤处",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1291, 22, -98)
end)

about:Button("地狱火",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1776, 342, 1476)
end)

local UITab3 = win:Tab("传送玩家",'16060333448')

local Sectionmogui = UITab3:section("功能",true)

local dropdown = Sectionmogui:Dropdown("选择玩家", 'Dropdown', bai.dropdown, function(v)
    bai.playernamedied = v
end)

Sectionmogui:Button("刷新", function()
    shuaxinlb(true)
    dropdown:SetOptions(bai.dropdown)
end)

Sectionmogui:Button("传送", function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game:GetService("Players")[bai.playernamedied]
    if tp_player then
        for i = 1, 5 do
            wait()
            HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
end)
Sectionmogui:Button("传送玩家土地", function()
    local ME = game.Players.LocalPlayer.Character.HumanoidRootPart
    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
        if v.Owner.Value == game.Players[bai.playernamedied] then
            ME.CFrame = v.OriginSquare.CFrame + Vector3.new(0, 10, 0)
        end
    end
end)
Sectionmogui:Button("汽车传送玩家", function()
    local tp_player = game:GetService("Players")[bai.playernamedied]

    if tp_player then

        carTeleport(tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))

    end
end)
Sectionmogui:Button("汽车传到玩家土", function()

    for i, v in pairs(game.Workspace.Properties:GetChildren()) do
        if v.Owner.Value == game.Players[bai.playernamedied] then

            carTeleport(v.OriginSquare.CFrame + Vector3.new(0, 10, 0))
        end
    end
end)

local UITab3 = win:Tab("汽车传送",'16060333448')

local Sectionqccs = UITab3:section("传送功能",true)

Sectionqccs:Dropdown("汽车传送","Dropdown",{"出生点","回家","月神剑","连接逻辑店","土地商店","VIP商店","画店","桥对岸","沙滩","火木","雪山","洞穴","码头","黑市","糖果地","雪地入口","小码头","玻璃木入口","云","山边商品","没有","幽灵商店","石头商店","沼泽","冰胡","沙漠","辐射商店","辐射木","种子商人","鲍勃的店","家具店","卖车店","摩斯密码商店","盲盒商店","秋天商店"}, function(v)
  list = v
  if list == "出生点"then

    cartp(CFrame.new(187,5,55))

   elseif list == "月神剑"then

    cartp(CFrame.new(-7612.0859375, 319.6391296386719, 4276.14990234375))

   elseif list == "洞穴" then

    cartp(CFrame.new(3581, -177, 430))

   elseif list == "连接逻辑店" then

    cartp(CFrame.new(4607, 9, -740))

   elseif list == "雪山" then

    cartp(CFrame.new(1451.66248, 412.208405, 3183.47607))

   elseif list == "土地商店" then

    cartp(CFrame.new(230, 5, -99))

   elseif list == "画店" then

    cartp(CFrame.new(5207, -156, 719))

   elseif list == "火木" then

    cartp(CFrame.new(-1585, 625, 1140))

   elseif list == "沙滩" then

    cartp(CFrame.new(2549, 5, -42))

   elseif list == "桥对岸"then

    cartp(CFrame.new(109,5,-1166))

   elseif list == "VIP商店" then

    cartp(CFrame.new(907,4,-115))

   elseif list == "码头" then

    cartp(CFrame.new(1122,1,-203))

   elseif list == "黑市" then

    cartp(CFrame.new(-15,61,1365))

   elseif list == "糖果地" then

    cartp(CFrame.new(-561,272,2312))

   elseif list == "雪地入口"then

    cartp(CFrame.new(888,61,1188))

   elseif list == "小码头"then

    cartp(CFrame.new(1894,-2,1581))

   elseif list == "玻璃木入口" then

    cartp(CFrame.new(1929,256,2918))

   elseif list == "云" then

    cartp(CFrame.new(2060,495,2967))

   elseif list == "山边商品"then

    cartp(CFrame.new(-640,160,374))

   elseif list == "没有" then

    cartp(CFrame.new(-1622,196,941))

   elseif list == "幽灵商店" then

    cartp(CFrame.new(-1274,133,-1443))

   elseif list == "沼泽" then

    cartp(CFrame.new(-999,133,-1191))

   elseif list == "石头商店" then

    cartp(CFrame.new(-2395,302,-1899))

   elseif list == "冰胡" then

    cartp(CFrame.new(-2149,321,743))

   elseif list == "沙漠" then

    cartp(CFrame.new(-612,46,-3169))

   elseif list == "辐射商店" then

    cartp(CFrame.new(172,12,-2627))

   elseif list == "辐射木" then

    cartp(CFrame.new(207,15,-2752))

   elseif list == "种子商人" then

    cartp(CFrame.new(-15,18,-2680))

   elseif list == "鲍勃的店" then

    cartp(CFrame.new(-712.809, 26.8001, -248.328))

   elseif list == "家具店" then

    cartp(CFrame.new(490,4,-1690))

   elseif list == "卖车店" then

    cartp(CFrame.new(512,4,-1490))

   elseif list == "摩斯密码商店" then

    cartp(CFrame.new(652,4,-1565))

   elseif list == "盲盒商店" then

    cartp(CFrame.new(100,4,-455))

   elseif list == "秋天商店" then

    cartp(CFrame.new(6004,4,33))
   elseif list == "回家" then
    for i,v in pairs(game.Workspace.Properties:GetChildren()) do
      if v.Owner.Value == lp then
        cartp(v.OriginSquare.CFrame + Vector3.new(0,10,0))
      end
    end
  end





end)

local UITab3 = win:Tab("NPC一秒购买",'16060333448')

local about = UITab3:section("一秒购买",true)

-- 辐射商店开关
-- 首先获取所有商店的NPC ID
local cashierIds = {}
local connection = game.ReplicatedStorage.NPCDialog.PromptChat.OnClientEvent:Connect(function(bu, data)
    if cashierIds[data.Name] == nil then
        cashierIds[data.Name] = data.ID
    end
end)

game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(1)

-- 等待获取必要的NPC ID
spawn(function()
    repeat wait(0.5) until cashierIds["Thom"] ~= nil
    wait(3)
    if connection then
        connection:Disconnect()
    end
    game.ReplicatedStorage.NPCDialog.SetChattingValue:InvokeServer(0)
end)

-- 等待一小会儿确保ID被获取
wait(3)

-- 辐射商店
local isRunningRadiation = false
about:Toggle("辐射商店", "Toggle", false, function(Value)
    isRunningRadiation = Value
    if Value then
        coroutine.wrap(function()
            while isRunningRadiation do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.PlantomicsChoice.Plantomic,
                        ["Name"] = "Plantomic",
                        ["ID"] = cashierIds["Plantomic"] or 18,  -- 使用获取的ID，如果没获取到用18
                        ["Dialog"] = workspace.Stores.PlantomicsChoice.Plantomic.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningRadiation then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 家具商店
local isRunningFurniture = false
about:Toggle("家具商店", "Toggle", false, function(Value)
    isRunningFurniture = Value
    if Value then
        coroutine.wrap(function()
            while isRunningFurniture do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.FurnitureStore.Corey,
                        ["Name"] = "Corey",
                        ["ID"] = cashierIds["Corey"] or 21,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.FurnitureStore.Corey.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningFurniture then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 阿拉丁神灯商店
local isRunningAladdin = false
about:Toggle("阿拉丁神灯商店", "Toggle", false, function(Value)
    isRunningAladdin = Value
    if Value then
        coroutine.wrap(function()
            while isRunningAladdin do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.SamsStuff.Bloxyway,
                        ["Name"] = "Bloxyway",
                        ["ID"] = cashierIds["Bloxyway"] or 16,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.SamsStuff.Bloxyway.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningAladdin then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 盲盒商店
local isRunningMysteryBox = false
about:Toggle("盲盒商店", "Toggle", false, function(Value)
    isRunningMysteryBox = Value
    if Value then
        coroutine.wrap(function()
            while isRunningMysteryBox do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.FineFinds.Manachron,
                        ["Name"] = "Manachron",
                        ["ID"] = cashierIds["Manachron"] or 19,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.FineFinds.Manachron.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningMysteryBox then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 土地/黑市商店
local isRunningBlackMarket = false
about:Toggle("土地/黑市商店", "Toggle", false, function(Value)
    isRunningBlackMarket = Value
    if Value then
        coroutine.wrap(function()
            while isRunningBlackMarket do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.BlackMarket.sneakypotato7,
                        ["Name"] = "sneakypotato7",
                        ["ID"] = cashierIds["sneakypotato7"] or 13,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.BlackMarket.sneakypotato7.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningBlackMarket then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 牛奶商店
local isRunningMilk = false
about:Toggle("牛奶商店", "Toggle", false, function(Value)
    isRunningMilk = Value
    if Value then
        coroutine.wrap(function()
            while isRunningMilk do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.SeaSide.Guy,
                        ["Name"] = "Guy",
                        ["ID"] = cashierIds["Guy"] or 12,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.SeaSide.Guy.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningMilk then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 反斗城商店
local isRunningWoodRUs = false
about:Toggle("反斗城商店", "Toggle", false, function(Value)
    isRunningWoodRUs = Value
    if Value then
        coroutine.wrap(function()
            while isRunningWoodRUs do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.WoodRUs.Thom,
                        ["Name"] = "Thom",
                        ["ID"] = cashierIds["Thom"] or 25,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.WoodRUs.Thom.Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningWoodRUs then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 岩浆车商店
local isRunningGhost = false
about:Toggle("岩浆车商店", "Toggle", false, function(Value)
    isRunningGhost = Value
    if Value then
        coroutine.wrap(function()
            while isRunningGhost do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.HLStand["So Scary Ghost"],
                        ["Name"] = "So Scary Ghost",
                        ["ID"] = cashierIds["So Scary Ghost"] or 31,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.HLStand["So Scary Ghost"].Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningGhost then break end
                    task.wait()
                end
            end
        end)()
    end
end)

-- 雪山商店
local isRunningIgloo = false
about:Toggle("雪山商店", "Toggle", false, function(Value)
    isRunningIgloo = Value
    if Value then
        coroutine.wrap(function()
            while isRunningIgloo do
                local args = {
                    [1] = {
                        ["Character"] = workspace.Stores.Igloo["Cold Guy"],
                        ["Name"] = "Cold Guy",
                        ["ID"] = cashierIds["Cold Guy"] or 29,  -- 使用获取的ID
                        ["Dialog"] = workspace.Stores.Igloo["Cold Guy"].Dialog
                    },
                    [2] = "ConfirmPurchase"
                }
                
                pcall(function()
                    game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
                end)
                
                for i = 1, 10 do
                    if not isRunningIgloo then break end
                    task.wait()
                end
            end
        end)()
    end
end)



local UITab3 = win:Tab("究极工具",'16060333448')

local about = UITab3:section("究极通用工具",true)

-- 选择玩家
local Players = about:Dropdown("选择玩家","Dropdown",bai.dropdown,function(v)
    bai.cswjia = v
end)

about:Button("重置玩家名称", function()
    shuaxinlb(true)
    Players:SetOptions(bai.dropdown)
end)

-- 设置传送点
about:Button("设置传送点", function()
    pcall(function()
        workspace.baiBasedropCord:Destroy()
    end)
    
    local baiBasedropCord = Instance.new("Part")
    baiBasedropCord.Name = "baiBasedropCord"
    baiBasedropCord.Anchored = true
    baiBasedropCord.Parent = workspace
    baiBasedropCord.Shape = Enum.PartType.Ball
    baiBasedropCord.Size = Vector3.new(2,2,2)
    baiBasedropCord.Color = Color3.fromRGB(0,217,255)
    baiBasedropCord.Material = Enum.Material.ForceField
    baiBasedropCord.CFrame = lp.Character.HumanoidRootPart.CFrame
    bai.itemset = lp.Character.HumanoidRootPart.CFrame
end)

-- 删除传送点
about:Button("删除传送点", function()
    pcall(function()
        workspace.baiBasedropCord:Destroy()
    end)
    bai.itemset = nil
end)

-- 框选系统
bai.selectedItems = {}
bai.selectionBoxes = {}

-- 获取选择工具
about:Button("获取选择工具", function()
    local SelectionTool = Instance.new("Tool")
    SelectionTool.RequiresHandle = false
    SelectionTool.Name = "选择物品"
    
    SelectionTool.Activated:Connect(function()
        local target = mouse.Target
        if target and target.Parent and target.Parent:FindFirstChild("Main") then
            local item = target.Parent
            
            if bai.selectedItems[item] then
                if bai.selectionBoxes[item] then
                    bai.selectionBoxes[item]:Destroy()
                    bai.selectionBoxes[item] = nil
                end
                bai.selectedItems[item] = nil
            else
                local selectionBox = Instance.new("SelectionBox")
                selectionBox.Adornee = item.Main
                selectionBox.Color3 = Color3.fromRGB(0,255,0)
                selectionBox.LineThickness = 0.05
                selectionBox.Parent = item.Main
                
                bai.selectionBoxes[item] = selectionBox
                bai.selectedItems[item] = true
            end
        end
    end)
    
    SelectionTool.Parent = lp.Backpack
end)

-- 分段传送框选物品
about:Button("开始传送", function()
    if not bai.itemset then return end
    
    local INTERACTION = game:GetService("ReplicatedStorage"):FindFirstChild("Interaction")
    local ClientIsDragging = INTERACTION and INTERACTION:FindFirstChild("ClientIsDragging")
    local MAGIC_STRING = "Ifyouarereadingthisstophackingbrolegitalsokrnlisbadbtw432rewdWdwFe432432rwDWDAVWdawgdGWAYDFGYTUW"
    
    -- 分段传送配置
    local stages = {
        {height = 20, steps = 3},
   
    }
    
    for item, _ in pairs(bai.selectedItems) do
        if item and item.Parent and item:FindFirstChild("Main") then
            for _, stage in ipairs(stages) do
                local targetPos = bai.itemset.Position + Vector3.new(0, stage.height, 0)
                
                for step = 1, stage.steps do
                    if ClientIsDragging then
                        ClientIsDragging:FireServer(item, MAGIC_STRING)
                    end
                    
                    item.Main.CFrame = CFrame.new(targetPos)
                    task.wait(0.05)
                end
                task.wait(0.05)
            end
            
            item.Main.CFrame = bai.itemset
            
            if bai.selectionBoxes[item] then
                bai.selectionBoxes[item]:Destroy()
                bai.selectionBoxes[item] = nil
            end
            bai.selectedItems[item] = nil
        end
    end
end)

about:Label("-------------------------------------------------------------------------------------------------------------------------------------")

about:Button("小中节点管理器",function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- 创建主UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportUI"
screenGui.Parent = player.PlayerGui

-- 主窗口
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- 添加圆角效果
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- 标题栏
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local title = Instance.new("TextLabel")
title.Text = "小中节点管理器"
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0.15, 0, 0, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.BackgroundTransparency = 1
title.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "×"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

-- 路径点列表容器
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0.9, 0, 0, 150)
scrollFrame.Position = UDim2.new(0.05, 0, 0, 40)
scrollFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = mainFrame

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 8)
scrollCorner.Parent = scrollFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.Parent = scrollFrame

-- 添加路径点按钮
local addButton = Instance.new("TextButton")
addButton.Size = UDim2.new(0.9, 0, 0, 30)
addButton.Position = UDim2.new(0.05, 0, 0, 200)
addButton.BackgroundColor3 = Color3.fromRGB(70, 150, 70)
addButton.TextColor3 = Color3.new(1, 1, 1)
addButton.Text = "添加节点"
addButton.Font = Enum.Font.GothamBold
addButton.TextSize = 16
addButton.Parent = mainFrame

local addBtnCorner = Instance.new("UICorner")
addBtnCorner.CornerRadius = UDim.new(0, 8)
addBtnCorner.Parent = addButton

-- 存储路径点数据
local pointsData = {}

-- 关闭按钮事件
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- 添加路径点的函数
local function addPoint(position, note)
    -- 创建路径点项目
    local pointFrame = Instance.new("Frame")
    pointFrame.Size = UDim2.new(1, 0, 0, 30)
    pointFrame.BackgroundTransparency = 1
    pointFrame.Parent = scrollFrame
    
    local pointCorner = Instance.new("UICorner")
    pointCorner.CornerRadius = UDim.new(0, 6)
    pointCorner.Parent = pointFrame

    -- 创建备注文本框
    local noteBox = Instance.new("TextBox")
    noteBox.Size = UDim2.new(0.5, 0, 1, 0)
    noteBox.Position = UDim2.new(0, 0, 0, 0)
    noteBox.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    noteBox.TextColor3 = Color3.new(1, 1, 1)
    noteBox.PlaceholderText = "自定义名称"
    noteBox.Text = note or ""
    noteBox.Font = Enum.Font.Gotham
    noteBox.TextSize = 14
    noteBox.Parent = pointFrame
    
    local noteCorner = Instance.new("UICorner")
    noteCorner.CornerRadius = UDim.new(0, 6)
    noteCorner.Parent = noteBox

    -- 创建传送按钮
    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(0.35, 0, 1, 0)
    teleportButton.Position = UDim2.new(0.5, 0, 0, 0)
    teleportButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
    teleportButton.TextColor3 = Color3.new(1, 1, 1)
    teleportButton.Text = "传送"
    teleportButton.Font = Enum.Font.GothamBold
    teleportButton.TextSize = 14
    teleportButton.Parent = pointFrame
    
    local teleportCorner = Instance.new("UICorner")
    teleportCorner.CornerRadius = UDim.new(0, 6)
    teleportCorner.Parent = teleportButton

    -- 创建删除按钮
    local deleteButton = Instance.new("TextButton")
    deleteButton.Size = UDim2.new(0.15, 0, 1, 0)
    deleteButton.Position = UDim2.new(0.85, 0, 0, 0)
    deleteButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    deleteButton.TextColor3 = Color3.new(1, 1, 1)
    deleteButton.Text = "×"
    deleteButton.Font = Enum.Font.GothamBold
    deleteButton.TextSize = 14
    deleteButton.Parent = pointFrame
    
    local deleteCorner = Instance.new("UICorner")
    deleteCorner.CornerRadius = UDim.new(0, 6)
    deleteCorner.Parent = deleteButton

    -- 点击传送按钮的逻辑
    teleportButton.MouseButton1Click:Connect(function()
        teleportButton.Text = "传送中..."
        teleportButton.BackgroundColor3 = Color3.fromRGB(120, 160, 240)
        
        wait(0.1)
        humanoidRootPart.CFrame = CFrame.new(position)
        
        teleportButton.Text = "传送成功!"
        wait(0.2)
        teleportButton.Text = "传送"
        teleportButton.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
    end)

    -- 点击删除按钮的逻辑
    deleteButton.MouseButton1Click:Connect(function()
        -- 从 pointsData 中移除当前路径点
        for i, point in ipairs(pointsData) do
            if point.position == position then
                table.remove(pointsData, i)
                break
            end
        end
        
        -- 销毁路径点项目
        pointFrame:Destroy()
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 5)
    end)

    -- 监听备注文本框的内容变化
    noteBox.FocusLost:Connect(function()
        -- 更新备注内容
        for _, point in ipairs(pointsData) do
            if point.position == position then
                point.note = noteBox.Text
                break
            end
        end
    end)
    
    return pointFrame
end

-- 点击添加按钮的逻辑
addButton.MouseButton1Click:Connect(function()
    -- 获取玩家当前位置
    local position = humanoidRootPart.Position
    
    -- 添加到数据存储
    local pointData = {
        position = position,
        note = ""
    }
    table.insert(pointsData, pointData)
    
    -- 添加路径点UI
    addPoint(position, "")
    
    -- 更新滚动区域
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 5)
end)

-- 动态调整列表大小
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 5)
end)
end)

about:Button("物品传送工具",function()
    local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- 状态管理
local bai = {
    itemset = nil, -- 存储传送点CFrame
    cswjia = Player.Name, -- 玩家ID
    selectedItems = {}, -- 选中的物品
    selectionBoxes = {}, -- 选择框字典
}

-- 创建UI界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ItemTeleporterUI"
ScreenGui.Parent = Player.PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Title.Text = "物品传送"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Parent = MainFrame

local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(1, 0, 0.7, 0)
ButtonsFrame.Position = UDim2.new(0, 0, 0.15, 0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Parent = MainFrame

-- 创建按钮函数
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0.2, 0)
    button.Position = position
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    button.Parent = ButtonsFrame
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- 创建开关函数
local function createToggle(text, position, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(0.9, 0, 0.2, 0)
    toggleFrame.Position = position
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = ButtonsFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = text
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BackgroundTransparency = 1
    label.Parent = toggleFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0.25, 0, 0.7, 0)
    toggleButton.Position = UDim2.new(0.75, 0, 0.15, 0)
    toggleButton.Text = "OFF"
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextSize = 16
    toggleButton.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleFrame
    
    local state = false
    
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleButton.Text = "ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(30, 100, 30)
        else
            toggleButton.Text = "OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
        end
        callback(state)
    end)
    
    return toggleButton
end

-- 设置传送点
createButton("设置传送点", UDim2.new(0.05, 0, 0.05, 0), function()
    -- 删除之前的传送点
    if Workspace:FindFirstChild("baiBasedropCord") then
        Workspace.baiBasedropCord:Destroy()
    end
    
    -- 创建新的传送点标记
    local baiBasedropCord = Instance.new("Part")
    baiBasedropCord.CanCollide = false
    baiBasedropCord.Anchored = true
    baiBasedropCord.Shape = Enum.PartType.Ball
    baiBasedropCord.Color = Color3.fromRGB(0, 217, 255)
    baiBasedropCord.Transparency = 0.3
    baiBasedropCord.Size = Vector3.new(2, 2, 2)
    baiBasedropCord.CFrame = Player.Character.HumanoidRootPart.CFrame
    baiBasedropCord.Material = Enum.Material.Neon
    baiBasedropCord.Name = "baiBasedropCord"
    baiBasedropCord.Parent = Workspace
    
    -- 添加发光效果
    local pointLight = Instance.new("PointLight")
    pointLight.Brightness = 2
    pointLight.Range = 10
    pointLight.Color = Color3.fromRGB(0, 200, 255)
    pointLight.Parent = baiBasedropCord
    
    -- 存储传送点位置
    bai.itemset = Player.Character.HumanoidRootPart.CFrame
end)

-- 删除传送点
createButton("删除传送点", UDim2.new(0.05, 0, 0.3, 0), function()
    if Workspace:FindFirstChild("baiBasedropCord") then
        Workspace.baiBasedropCord:Destroy()
    end
    bai.itemset = nil
end)

-- 获得工具
createButton("获得传送工具", UDim2.new(0.05, 0, 0.55, 0), function()
    if bai.itemset == nil then
        -- 提示设置传送点
        local notify = Instance.new("TextLabel")
        notify.Text = "请先设置传送点!"
        notify.Size = UDim2.new(0.3, 0, 0.1, 0)
        notify.Position = UDim2.new(0.35, 0, 0.1, 0)
        notify.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        notify.TextColor3 = Color3.new(1, 1, 1)
        notify.Font = Enum.Font.SourceSansBold
        notify.TextSize = 20
        notify.Parent = ScreenGui
        
        wait(2)
        notify:Destroy()
        return
    end
    
    -- 创建传送工具
    local Tool = Instance.new("Tool")
    Tool.Name = "物品传送器"
    Tool.RequiresHandle = false
    Tool.Parent = Player.Backpack
    
    Tool.Activated:Connect(function()
        if Mouse.Target and Mouse.Target.Parent then
            local targetParent = Mouse.Target.Parent
            
            -- 检查是否是玩家的物品
            if targetParent:FindFirstChild("Owner") and tostring(targetParent.Owner.Value) == bai.cswjia then
                -- 添加选择效果
                if not bai.selectedItems[targetParent] then
                    local selectionBox = Instance.new("SelectionBox")
                    selectionBox.Adornee = targetParent
                    selectionBox.Color3 = Color3.fromRGB(0, 150, 255)
                    selectionBox.LineThickness = 0.05
                    selectionBox.Parent = targetParent
                    
                    bai.selectedItems[targetParent] = true
                    bai.selectionBoxes[targetParent] = selectionBox
                end
            end
        end
    end)
end)

-- 点击选择物品开关
local clickSelectToggle
clickSelectToggle = createToggle("开关选择物品", UDim2.new(0.05, 0, 0.8, 0), function(state)
    if state then
        bai.clickSelectConnection = Mouse.Button1Up:Connect(function()
            if Mouse.Target and Mouse.Target.Parent then
                local targetParent = Mouse.Target.Parent
                
                -- 检查是否是玩家的物品
                if targetParent:FindFirstChild("Owner") and tostring(targetParent.Owner.Value) == bai.cswjia then
                    -- 切换选择状态
                    if bai.selectedItems[targetParent] then
                        if bai.selectionBoxes[targetParent] then
                            bai.selectionBoxes[targetParent]:Destroy()
                            bai.selectionBoxes[targetParent] = nil
                        end
                        bai.selectedItems[targetParent] = nil
                    else
                        local selectionBox = Instance.new("SelectionBox")
                        selectionBox.Adornee = targetParent
                        selectionBox.Color3 = Color3.fromRGB(0, 200, 100)
                        selectionBox.LineThickness = 0.05
                        selectionBox.Parent = targetParent
                        
                        bai.selectedItems[targetParent] = true
                        bai.selectionBoxes[targetParent] = selectionBox
                    end
                end
            end
        end)
    else
        if bai.clickSelectConnection then
            bai.clickSelectConnection:Disconnect()
            bai.clickSelectConnection = nil
        end
    end
end)

-- 取消选择
createButton("取消所有选择", UDim2.new(0.05, 0, 1.05, 0), function()
    for item, box in pairs(bai.selectionBoxes) do
        if box then
            box:Destroy()
        end
    end
    
    bai.selectedItems = {}
    bai.selectionBoxes = {}
end)

-- 传送选中的物品
createButton("开始传送物品", UDim2.new(0.05, 0, 1.3, 0), function()
    if not bai.itemset then
        -- 提示设置传送点
        local notify = Instance.new("TextLabel")
        notify.Text = "请先设置传送点!"
        notify.Size = UDim2.new(0.3, 0, 0.1, 0)
        notify.Position = UDim2.new(0.35, 0, 0.1, 0)
        notify.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        notify.TextColor3 = Color3.new(1, 1, 1)
        notify.Font = Enum.Font.SourceSansBold
        notify.TextSize = 20
        notify.Parent = ScreenGui
        
        wait(2)
        notify:Destroy()
        return
    end
    
    for item, _ in pairs(bai.selectedItems) do
        if item and item.Parent and item:FindFirstChild("Main") then
            -- 使用缓动动画让传送更平滑
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(item.Main, tweenInfo, {CFrame = bai.itemset})
            tween:Play()
            
            -- 传送完成后移除选择框
            tween.Completed:Connect(function()
                if bai.selectionBoxes[item] then
                    bai.selectionBoxes[item]:Destroy()
                    bai.selectionBoxes[item] = nil
                end
                bai.selectedItems[item] = nil
            end)
        end
    end
end)

-- 框选功能
local selectionFrame = Instance.new("Frame")
selectionFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
selectionFrame.BackgroundTransparency = 0.8
selectionFrame.BorderSizePixel = 2
selectionFrame.BorderColor3 = Color3.fromRGB(0, 150, 255)
selectionFrame.Visible = false
selectionFrame.ZIndex = 10
selectionFrame.Parent = ScreenGui

local function is_in_frame(screenpos, frame)
    local xPos = frame.AbsolutePosition.X
    local yPos = frame.AbsolutePosition.Y
    local xSize = frame.AbsoluteSize.X
    local ySize = frame.AbsoluteSize.Y

    return screenpos.X >= xPos and screenpos.X <= xPos + xSize and
           screenpos.Y >= yPos and screenpos.Y <= yPos + ySize
end

local boxSelectActive = false
local boxSelectConnection


-- 状态提示标签
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0.1, 0)
statusLabel.Position = UDim2.new(-0.8, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "物品: 0"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 16
statusLabel.Parent = MainFrame

-- 更新状态
RunService.Heartbeat:Connect(function()
    local teleportStatus = bai.itemset and "已设置" or "未设置"
    local selectedCount = 0
    for _ in pairs(bai.selectedItems) do
        selectedCount += 1
    end
    
    statusLabel.Text = string.format("传送点: %s | 选中物品: %d", teleportStatus, selectedCount)
end)

-- 关闭按钮
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BorderSizePixel = 0
closeButton.Parent = MainFrame

closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
end)

about:Button("木头传送工具",function()
    local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- 状态管理
local bai = {
    itemset = nil, -- 存储传送点CFrame
    cswjia = Player.Name, -- 玩家ID
    selectedItems = {}, -- 选中的物品
    selectionBoxes = {}, -- 选择框字典
}

-- 创建UI界面
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ItemTeleporterUI"
ScreenGui.Parent = Player.PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Title.Text = "木头传送"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Parent = MainFrame

local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(1, 0, 0.7, 0)
ButtonsFrame.Position = UDim2.new(0, 0, 0.15, 0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Parent = MainFrame

-- 创建按钮函数
local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0.2, 0)
    button.Position = position
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    button.Parent = ButtonsFrame
    
    button.MouseButton1Click:Connect(callback)
    
    return button
end

-- 创建开关函数
local function createToggle(text, position, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(0.9, 0, 0.2, 0)
    toggleFrame.Position = position
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = ButtonsFrame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = text
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BackgroundTransparency = 1
    label.Parent = toggleFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0.25, 0, 0.7, 0)
    toggleButton.Position = UDim2.new(0.75, 0, 0.15, 0)
    toggleButton.Text = "OFF"
    toggleButton.Font = Enum.Font.SourceSansBold
    toggleButton.TextSize = 16
    toggleButton.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = toggleFrame
    
    local state = false
    
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleButton.Text = "ON"
            toggleButton.BackgroundColor3 = Color3.fromRGB(30, 100, 30)
        else
            toggleButton.Text = "OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(100, 30, 30)
        end
        callback(state)
    end)
    
    return toggleButton
end

-- 设置传送点
createButton("设置传送点", UDim2.new(0.05, 0, 0.05, 0), function()
    -- 删除之前的传送点
    if Workspace:FindFirstChild("baiBasedropCord") then
        Workspace.baiBasedropCord:Destroy()
    end
    
    -- 创建新的传送点标记
    local baiBasedropCord = Instance.new("Part")
    baiBasedropCord.CanCollide = false
    baiBasedropCord.Anchored = true
    baiBasedropCord.Shape = Enum.PartType.Ball
    baiBasedropCord.Color = Color3.fromRGB(0, 217, 255)
    baiBasedropCord.Transparency = 0.3
    baiBasedropCord.Size = Vector3.new(2, 2, 2)
    baiBasedropCord.CFrame = Player.Character.HumanoidRootPart.CFrame
    baiBasedropCord.Material = Enum.Material.Neon
    baiBasedropCord.Name = "baiBasedropCord"
    baiBasedropCord.Parent = Workspace
    
    -- 添加发光效果
    local pointLight = Instance.new("PointLight")
    pointLight.Brightness = 2
    pointLight.Range = 10
    pointLight.Color = Color3.fromRGB(0, 200, 255)
    pointLight.Parent = baiBasedropCord
    
    -- 存储传送点位置
    bai.itemset = Player.Character.HumanoidRootPart.CFrame
end)

-- 删除传送点
createButton("删除传送点", UDim2.new(0.05, 0, 0.3, 0), function()
    if Workspace:FindFirstChild("baiBasedropCord") then
        Workspace.baiBasedropCord:Destroy()
    end
    bai.itemset = nil
end)

-- 获得工具
createButton("获得传送工具", UDim2.new(0.05, 0, 0.55, 0), function()
    if bai.itemset == nil then
        -- 提示设置传送点
        local notify = Instance.new("TextLabel")
        notify.Text = "请先设置传送点!"
        notify.Size = UDim2.new(0.3, 0, 0.1, 0)
        notify.Position = UDim2.new(0.35, 0, 0.1, 0)
        notify.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        notify.TextColor3 = Color3.new(1, 1, 1)
        notify.Font = Enum.Font.SourceSansBold
        notify.TextSize = 20
        notify.Parent = ScreenGui
        
        wait(2)
        notify:Destroy()
        return
    end
    
    -- 创建传送工具
    local Tool = Instance.new("Tool")
    Tool.Name = "木头传送器"
    Tool.RequiresHandle = false
    Tool.Parent = Player.Backpack
    
    Tool.Activated:Connect(function()
        if Mouse.Target and Mouse.Target.Parent then
            local targetPart = Mouse.Target
            
            -- 检查是否是玩家的物品
            local parentModel = targetPart:FindFirstAncestorWhichIsA("Model")
            if parentModel and parentModel:FindFirstChild("Owner") and tostring(parentModel.Owner.Value) == bai.cswjia then
                -- 添加选择效果
                if not bai.selectedItems[targetPart] then
                    local selectionBox = Instance.new("SelectionBox")
                    selectionBox.Adornee = targetPart
                    selectionBox.Color3 = Color3.fromRGB(0, 150, 255)
                    selectionBox.LineThickness = 0.05
                    selectionBox.Parent = targetPart
                    
                    bai.selectedItems[targetPart] = true
                    bai.selectionBoxes[targetPart] = selectionBox
                end
            end
        end
    end)
end)

-- 点击选择物品开关
local clickSelectToggle
clickSelectToggle = createToggle("开关选择木头", UDim2.new(0.05, 0, 0.8, 0), function(state)
    if state then
        bai.clickSelectConnection = Mouse.Button1Up:Connect(function()
            if Mouse.Target and Mouse.Target.Parent then
                local targetPart = Mouse.Target
                
                -- 检查是否是玩家的物品
                local parentModel = targetPart:FindFirstAncestorWhichIsA("Model")
                if parentModel and parentModel:FindFirstChild("Owner") and tostring(parentModel.Owner.Value) == bai.cswjia then
                    -- 切换选择状态
                    if bai.selectedItems[targetPart] then
                        if bai.selectionBoxes[targetPart] then
                            bai.selectionBoxes[targetPart]:Destroy()
                            bai.selectionBoxes[targetPart] = nil
                        end
                        bai.selectedItems[targetPart] = nil
                    else
                        local selectionBox = Instance.new("SelectionBox")
                        selectionBox.Adornee = targetPart
                        selectionBox.Color3 = Color3.fromRGB(0, 200, 100)
                        selectionBox.LineThickness = 0.05
                        selectionBox.Parent = targetPart
                        
                        bai.selectedItems[targetPart] = true
                        bai.selectionBoxes[targetPart] = selectionBox
                    end
                end
            end
        end)
    else
        if bai.clickSelectConnection then
            bai.clickSelectConnection:Disconnect()
            bai.clickSelectConnection = nil
        end
    end
end)

-- 取消选择
createButton("取消所有选择", UDim2.new(0.05, 0, 1.05, 0), function()
    for item, box in pairs(bai.selectionBoxes) do
        if box then
            box:Destroy()
        end
    end
    
    bai.selectedItems = {}
    bai.selectionBoxes = {}
end)

-- 传送选中的物品
createButton("开始传送木头", UDim2.new(0.05, 0, 1.3, 0), function()
    if not bai.itemset then
        -- 提示设置传送点
        local notify = Instance.new("TextLabel")
        notify.Text = "请先设置传送点!"
        notify.Size = UDim2.new(0.3, 0, 0.1, 0)
        notify.Position = UDim2.new(0.35, 0, 0.1, 0)
        notify.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        notify.TextColor3 = Color3.new(1, 1, 1)
        notify.Font = Enum.Font.SourceSansBold
        notify.TextSize = 20
        notify.Parent = ScreenGui
        
        wait(2)
        notify:Destroy()
        return
    end
    
    for item, _ in pairs(bai.selectedItems) do
        if item and item:IsA("BasePart") and item.Parent then
            -- 使用缓动动画让传送更平滑
            local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(item, tweenInfo, {CFrame = bai.itemset})
            tween:Play()
            
            -- 传送完成后移除选择框
            tween.Completed:Connect(function()
                if bai.selectionBoxes[item] then
                    bai.selectionBoxes[item]:Destroy()
                    bai.selectionBoxes[item] = nil
                end
                bai.selectedItems[item] = nil
            end)
        end
    end
end)

-- 状态提示标签
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0.1, 0)
statusLabel.Position = UDim2.new(-0.8, 0, 0, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "传送点: 未设置 | 选中木头: 0"
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 16
statusLabel.Parent = MainFrame

-- 更新状态
RunService.Heartbeat:Connect(function()
    local teleportStatus = bai.itemset and "已设置" or "未设置"
    local selectedCount = 0
    for _ in pairs(bai.selectedItems) do
        selectedCount += 1
    end
    
    statusLabel.Text = string.format("传送点: %s | 选中木头: %d", teleportStatus, selectedCount)
end)

-- 关闭按钮
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BorderSizePixel = 0
closeButton.Parent = MainFrame

closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
end)

local UITab3 = win:Tab("顶级淘宝(魔鸭材料)",'16060333448')

local about = UITab3:section("自动购买",true)

about:Button("普通鸭子盲盒",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(53.93827819824219, 3.859433889389038, -453.6084899902344)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("FineFinds")
    and Workspace.Stores.FineFinds:FindFirstChild("ShopItems")
    and Workspace.Stores.FineFinds.ShopItems:FindFirstChild("Crate")
    and Workspace.Stores.FineFinds.ShopItems.Crate:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(50.93827819824219, 3.859433889389038, -453.6084899902344)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("神灯",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(705, 6, -1599)                                                                                                        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("SamsStuff")
    and Workspace.Stores.SamsStuff:FindFirstChild("ShopItems")
    and Workspace.Stores.SamsStuff.ShopItems:FindFirstChild("MagicLamp")
    and Workspace.Stores.SamsStuff.ShopItems.MagicLamp:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(701, 6, -1599)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("鸡蛋",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(195, 15, -2662)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("PlantomicsChoice")
    and Workspace.Stores.PlantomicsChoice:FindFirstChild("ShopItems")
    and Workspace.Stores.PlantomicsChoice.ShopItems:FindFirstChild("Egg")
    and Workspace.Stores.PlantomicsChoice.ShopItems.Egg:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(189, 15, -2662)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("快乐球",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(190.77743530273438, 12.964849472045898, -2657.505126953125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("PlantomicsChoice")
    and Workspace.Stores.PlantomicsChoice:FindFirstChild("ShopItems")
    and Workspace.Stores.PlantomicsChoice.ShopItems:FindFirstChild("HappyBall")
    and Workspace.Stores.PlantomicsChoice.ShopItems.HappyBall:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(189.77743530273438, 15.964849472045898, -2662.505126953125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("电池",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(190.77743530273438, 12.964849472045898, -2657.505126953125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("PlantomicsChoice")
    and Workspace.Stores.PlantomicsChoice:FindFirstChild("ShopItems")
    and Workspace.Stores.PlantomicsChoice.ShopItems:FindFirstChild("Battery")
    and Workspace.Stores.PlantomicsChoice.ShopItems.Battery:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(189.77743530273438, 15.964849472045898, -2662.505126953125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("游戏机",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(190.77743530273438, 12.964849472045898, -2657.505126953125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("PlantomicsChoice")
    and Workspace.Stores.PlantomicsChoice:FindFirstChild("ShopItems")
    and Workspace.Stores.PlantomicsChoice.ShopItems:FindFirstChild("NESController")
    and Workspace.Stores.PlantomicsChoice.ShopItems.NESController:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(189.77743530273438, 15.964849472045898, -2662.505126953125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("手电筒",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(190.77743530273438, 12.964849472045898, -2657.505126953125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("PlantomicsChoice")
    and Workspace.Stores.PlantomicsChoice:FindFirstChild("ShopItems")
    and Workspace.Stores.PlantomicsChoice.ShopItems:FindFirstChild("Flashlight")
    and Workspace.Stores.PlantomicsChoice.ShopItems.Flashlight:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(189.77743530273438, 15.964849472045898, -2662.505126953125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("树种子盲盒",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-22.511730194091797, 17.80469512939453, -2691.819580078125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("SaplingCart")
    and Workspace.Stores.SaplingCart:FindFirstChild("ShopItems")
    and Workspace.Stores.SaplingCart.ShopItems:FindFirstChild("SaplingCrate")
    and Workspace.Stores.SaplingCart.ShopItems.SaplingCrate:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(-25.511730194091797, 17.80469512939453, -2691.819580078125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("草坪",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-22.511730194091797, 17.80469512939453, -2691.819580078125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("SaplingCart")
    and Workspace.Stores.SaplingCart:FindFirstChild("ShopItems")
    and Workspace.Stores.SaplingCart.ShopItems:FindFirstChild("Planter2")
    and Workspace.Stores.SaplingCart.ShopItems.Planter2:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(-25.511730194091797, 17.80469512939453, -2691.819580078125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("牛奶",function()
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6695.05810546875, 0.7968753576278687, -3563.868896484375)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("SeaSide")
    and Workspace.Stores.SeaSide:FindFirstChild("ShopItems")
    and Workspace.Stores.SeaSide.ShopItems:FindFirstChild("Milk")
    and Workspace.Stores.SeaSide.ShopItems.Milk:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(6698.05810546875, 0.7968753576278687, -3563.868896484375)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("灯泡",function()
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.0109558105469, 3.1796889305114746, -1723.9559326171875)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("FurnitureStore")
    and Workspace.Stores.FurnitureStore:FindFirstChild("ShopItems")
    and Workspace.Stores.FurnitureStore.ShopItems:FindFirstChild("LightBulb")
    and Workspace.Stores.FurnitureStore.ShopItems.LightBulb:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(477.0109558105469, 3.1796889305114746, -1723.9559326171875)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("乐可可",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2313.958984375, 255.68313598632812, 2982.48828125)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("Igloo")
    and Workspace.Stores.Igloo:FindFirstChild("ShopItems")
    and Workspace.Stores.Igloo.ShopItems:FindFirstChild("Cocoa")
    and Workspace.Stores.Igloo.ShopItems.Cocoa:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(2310.958984375, 255.68313598632812, 2982.48828125)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("黑市(老虎眼睛)",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-81.89359283447266, 59.59280014038086, 1410.051513671875)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("BlackMarket")
    and Workspace.Stores.BlackMarket:FindFirstChild("ShopItems")
    and Workspace.Stores.BlackMarket.ShopItems:FindFirstChild("Eye3")
    and Workspace.Stores.BlackMarket.ShopItems.Eye3:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(-84.89359283447266, 59.59280014038086, 1410.051513671875)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

about:Button("岩浆车",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-915.85498046875, -246.0081024169922, 77.76982879638672)                                                                                                                                            local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local targetPath = Workspace:FindFirstChild("Stores")
    and Workspace.Stores:FindFirstChild("HLStand")
    and Workspace.Stores.HLStand:FindFirstChild("ShopItems")
    and Workspace.Stores.HLStand.ShopItems:FindFirstChild("LavaCar")
    and Workspace.Stores.HLStand.ShopItems.LavaCar:FindFirstChild("Main")

if not targetPath then
    warn("")
    return
end

local lamp = targetPath

lamp.Position = Vector3.new(-920.85498046875, -246.0081024169922, 77.76982879638672)

-- 等待1.5秒
wait(1.5)
local function moveToPlayerHead()
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            -- 在头部上方2单位高度
            lamp.Position = head.Position + Vector3.new(0, -1, 0)
        else
            warn("")
        end
    else
        warn("")
    end
end

pcall(moveToPlayerHead)
end)

local UITab3 = win:Tab("砍树",'16060333448')

local Section5 = UITab3:section("砍树",true)



    Section5:Dropdown("选择木头","Dropdown",{"普通树","屎木","卡通木","幻影莫","砖头木","Oak木","玻璃木","红颜木", "石头木","沼泽黄金", "樱花", "蓝木", "冰木", "火山木", "橡树", "巧克力木", "白桦木", "金木", "雪地松", "僵尸木", "大巧克力木", "椰子木","南瓜木","幽灵木","大理石木","天堂木","虚拟木","玻璃木","糖果木","积木","发光红色糖果木","彩虹木","闪电木","不知道","紫木","下水道木","辐射木","地狱木","沙滩木","白木","彩虹发光木","布木","裂纹木","幽灵木","金木","锈木","蓝岩浆木","星空木","岩浆木","星星木","懒得(雪山)","敬请期待"},function(b)
      if b=="普通木"then
        bai.cuttreeselect="Generic"
       elseif b=="沼泽黄金"then
        bai.cuttreeselect="GoldSwampy"
       elseif b=="樱花"then
        bai.cuttreeselect="Cherry"
       elseif b=="蓝木"then
        bai.cuttreeselect="CaveCrawler"
       elseif b=="冰木"then
        bai.cuttreeselect="Frost"
       elseif b=="火山木"then
        bai.cuttreeselect="Volcano"
       elseif b=="橡树"then
        bai.cuttreeselect="Oak"
       elseif b=="巧克力木"then
        bai.cuttreeselect="Walnut"
       elseif b=="白桦木"then
        bai.cuttreeselect="Birch"
       elseif b=="金木"then
        bai.cuttreeselect="SnowGlow"
       elseif b=="雪地松"then
        bai.cuttreeselect="Pine"
       elseif b=="僵尸木"then
        bai.cuttreeselect="GreenSwampy"
       elseif b=="大巧克力木"then
        bai.cuttreeselect="Koa"
       elseif b=="椰子木"then
        bai.cuttreeselect="Palm"
       elseif b=="幽灵木"then
        bai.cuttreeselect="Spooky"
       elseif b=="南瓜木"then
        bai.cuttreeselect="SpookyNeon"
       elseif b=="大理石木"then
        bai.cuttreeselect="Marble"
       elseif b=="天堂木"then
        bai.cuttreeselect="Sky"
       elseif b=="虚拟木"then
        bai.cuttreeselect="Virtual"
       elseif b=="玻璃木"then
        bai.cuttreeselect="Taco"
       elseif b=="糖果树"then
        bai.cuttreeselect="CandycaneGreen"
       elseif b=="积木"then
        bai.cuttreeselect="CandycaneRed"
       elseif b=="发光红色糖果木"then
        bai.cuttreeselect="CandyNeon"
       elseif b=="彩虹木"then
        bai.cuttreeselect="Rainbow"
       elseif b=="闪电木"then
        bai.cuttreeselect="Electric"
       elseif b=="不知道"then
        bai.cuttreeselect="Skittles"
       elseif b=="紫木"then
        bai.cuttreeselect="Cavern"
       elseif b=="下水道木"then
        bai.cuttreeselect="MuckySewer"
       elseif b=="辐射木"then
        bai.cuttreeselect="Radioactive"
       elseif b=="地狱木"then
        bai.cuttreeselect="Hell"
       elseif b=="沙滩木"then
        bai.cuttreeselect="Sand"
       elseif b=="白木"then
        bai.cuttreeselect="Aspen"
       elseif b=="彩虹发光木"then
        bai.cuttreeselect="NeonRainbow"
       elseif b=="布木"then
        bai.cuttreeselect="Dog"
       elseif b=="幻影木"then
        bai.cuttreeselect="LoneCave"
       elseif b=="红颜木"then
        bai.cuttreeselect="Shine"
       elseif b=="石头木"then
        bai.cuttreeselect="Magma"
       elseif b=="玻璃木"then
        bai.cuttreeselect="Ice"
       elseif b=="砖头木"then
        bai.cuttreeselect="Blah"
       elseif b=="卡通木"then
        bai.cuttreeselect="CobbleStone"
       elseif b=="屎木"then
        bai.cuttreeselect="Cookie"
       elseif b=="Oak木"then
        bai.cuttreeselect="GreatOak"
       elseif b=="裂纹木"then
        bai.cuttreeselect="Celestial"
       elseif b=="幽灵木"then
        bai.cuttreeselect="SpookyGhoul"
       elseif b=="锈木"then
        bai.cuttreeselect="SewageTree"
       elseif b=="金木"then
        bai.cuttreeselect="Gold"
       elseif b=="蓝岩浆木"then
        bai.cuttreeselect="BlueFlame"
       elseif b=="星空木"then
        bai.cuttreeselect="Spirit"
       elseif b=="岩浆木"then
        bai.cuttreeselect="Flame"
       elseif b=="星星木"then
        bai.cuttreeselect="Star"
       elseif b=="懒得(雪山)"then
        bai.cuttreeselect="Snow"

      end
    end)
    Section5:Textbox("砍树数量","TextBoxfalg","输入",function(txt)
      bai.bringamount=txt
    end)
    Section5:Button("砍树", function()
    bai.bringtree = true
    
    for i = 1, bai.bringamount do
        if not bai.bringtree then break end
        
        -- 1. 保存玩家当前位置
        local playerOriginalCFrame = lp.Character.HumanoidRootPart.CFrame
        
        -- 2. 砍树（这个函数会把玩家传送到树的位置）
        bringTree(bai.cuttreeselect)
        
        -- 3. 等待树砍完
        wait()
        
        -- 4. 查找刚刚砍倒的那一棵树
        local latestTree = nil
        for _, Log in pairs(workspace.LogModels:GetChildren()) do
            if not bai.bringtree then break end
            
            if Log.Name:sub(1, 6) == "Loose_" and 
               Log:FindFirstChild("Owner") and 
               Log.Owner.Value == lp and
               Log:FindFirstChild("WoodSection") then
                
                -- 只取最新的一棵树（可能是最后砍的）
                latestTree = Log
            end
        end
        
        -- 5. 如果找到了树，传送回玩家原来的位置
        if latestTree and bai.bringtree then
            local INTERACTION = game:GetService("ReplicatedStorage").Interaction
            local ClientIsDragging = INTERACTION.ClientIsDragging
            
            local MAGIC_STRING = "Ifyouarereadingthisstophackingbrolegitalsokrnlisbadbtw432rewdWdwFe432432rwDWDAVWdawgdGWAYDFGYTUW"
            
            -- 分段传送回到原始位置
            local stages = {
                {height = 4},  -- 第一阶段：高处
        
            }
            
            for stageIndex, stage in ipairs(stages) do
                if not bai.bringtree then break end
                
                -- 计算目标位置（玩家原始位置上方）
                local targetPos = playerOriginalCFrame.Position + Vector3.new(0, stage.height, 0)
                
                -- 持续发送拖动信息并移动
                for moveStep = 1, 13 do
                    if not bai.bringtree then break end
                    
                    -- 发送拖动信号
                    ClientIsDragging:FireServer(latestTree, MAGIC_STRING)
                    
                    -- 移动树木到目标位置
                    latestTree:MoveTo(targetPos)
                    
                   wait(0.05)
                end
                
                -- 阶段间等待
                if stageIndex < #stages and bai.bringtree then
                    wait()
                end
            end
            
            -- 6. 玩家传送回原始位置
            if bai.bringtree then
                lp.Character.HumanoidRootPart.CFrame = playerOriginalCFrame
                wait()
            end
        end
        
        -- 7. 准备下一轮（如果有的话）
        if i < bai.bringamount and bai.bringtree then
            wait()
        end
    end
    
    -- 8. 所有操作完成后自动停止
    bai.bringtree = false
end)

Section5:Button("砍树停止", function()
    -- 立即停止所有
    bai.bringtree = false
    workspace.Camera.CameraSubject = lp.Character
end)

Section5:Button("传送所有木头", function()

  local oldPosition = lp.Character.HumanoidRootPart.Position

  for _, Log in pairs(game.Workspace.LogModels:GetChildren()) do
    if Log.Name:sub(1, 6) == "Loose_" and Log:findFirstChild("Owner") then
      if Log.Owner.Value == game.Players.LocalPlayer then
        for _ = 1, 60 do
          tp(Log.WoodSection.CFrame)
          Log:MoveTo(oldPosition)
          tp(oldPosition)
        end
      end
    end
  end

end)

local UITab3 = win:Tab("蓝图",'16060333448')

local SectionKJ = UITab3:section("填充功能",true)
about:Label("")

local w={"白杨树","桦树","无趣","灌木丛","糖果","糖果替代品","糖果霓虹","糖果棒绿","糖果棒红","卡通风格","卡通彩虹","洞穴爬行者","洞穴","洞穴爬行者","樱桃","鹅卵石","饼干","沙","钻石","干燥","干燥霓虹","电力","余烬","冷杉","霜","通用","特殊通用","玻璃","发光蘑菇","金","金沼泽","草1","绿色沼泽","洞窟爬行者","地狱","koa树","孤洞","枫树","大理石","泥泞下水道","橡树","棕榈树","松树","罐灌木","土豆","REEE","灵魂","彩虹","随机","红宝石","鳞片","污水树","闪耀","标志","银","彩虹糖","天空","雪","雪光","诡异","恐怖僵尸","恐怖霓虹","石头","玉米饼","测试","线","隧道爬行者","霓虹彩虹","虚拟","虚空","火山","华夫饼","胡桃","灰烬","铜","狗","通用主","通用秋","通用死","大橡树","岩浆","冰","放射性","通用金","天体","星星","砖替代品","深色砖","砖","裂缝岩浆","蓝色火焰","火焰","骨头","彩虹火焰"}

SectionKJ:Dropdown("选择树","Dropdown",w,function(b)
  if b == "白杨树" then
    bai.cuttreeselect = "Aspen"
   elseif b == "桦树" then
    bai.cuttreeselect = "Birch"
   elseif b == "无趣" then
    bai.cuttreeselect = "Blah"
   elseif b == "灌木丛" then
    bai.cuttreeselect = "Bush"
   elseif b == "糖果" then
    bai.cuttreeselect = "Candy"
   elseif b == "糖果替代品" then
    bai.cuttreeselect = "CandyAlternitive"
   elseif b == "糖果霓虹" then
    bai.cuttreeselect = "CandyNeon"
   elseif b == "糖果棒绿" then
    bai.cuttreeselect = "CandycaneGreen"
   elseif b == "糖果棒红" then
    bai.cuttreeselect = "CandycaneRed"
   elseif b == "卡通风格" then
    bai.cuttreeselect = "Cartoony"
   elseif b == "卡通彩虹" then
    bai.cuttreeselect = "CartoonyRainbow"
   elseif b == "洞穴爬行者" then
    bai.cuttreeselect = "CaveCrawler"
   elseif b == "洞穴" then
    bai.cuttreeselect = "Cavern"
   elseif b == "洞窟爬行者" then
    bai.cuttreeselect = "CavernCrawler"
   elseif b == "樱桃" then
    bai.cuttreeselect = "Cherry"
   elseif b == "鹅卵石" then
    bai.cuttreeselect = "CobbleStone"
   elseif b == "饼干" then
    bai.cuttreeselect = "Cookie"
   elseif b == "沙" then
    bai.cuttreeselect = "Sand"
   elseif b == "钻石" then
    bai.cuttreeselect = "Diamond"
   elseif b == "干燥" then
    bai.cuttreeselect = "Dry"
   elseif b == "干燥霓虹" then
    bai.cuttreeselect = "DryNeon"
   elseif b == "电力" then
    bai.cuttreeselect = "Electric"
   elseif b == "余烬" then
    bai.cuttreeselect = "Ember"
   elseif b == "冷杉" then
    bai.cuttreeselect = "Fir"
   elseif b == "霜" then
    bai.cuttreeselect = "Frost"
   elseif b == "通用" then
    bai.cuttreeselect = "Generic"
   elseif b == "特殊通用" then
    bai.cuttreeselect = "GenericSpecial"
   elseif b == "玻璃" then
    bai.cuttreeselect = "Glass"
   elseif b == "发光蘑菇" then
    bai.cuttreeselect = "GlowShroom"
   elseif b == "金" then
    bai.cuttreeselect = "Gold"
   elseif b == "金沼泽" then
    bai.cuttreeselect = "GoldSwampy"
   elseif b == "草1" then
    bai.cuttreeselect = "Grass1"
   elseif b == "绿色沼泽" then
    bai.cuttreeselect = "GreenSwampy"
   elseif b == "洞窟爬行者" then
    bai.cuttreeselect = "GrottoCrawler"
   elseif b == "地狱" then
    bai.cuttreeselect = "Hell"
   elseif b == "koa树" then
    bai.cuttreeselect = "Koa"
   elseif b == "孤洞" then
    bai.cuttreeselect = "LoneCave"
   elseif b == "枫树" then
    bai.cuttreeselect = "Maple"
   elseif b == "大理石" then
    bai.cuttreeselect = "Marble"
   elseif b == "泥泞下水道" then
    bai.cuttreeselect = "MuckySewer"
   elseif b == "橡树" then
    bai.cuttreeselect = "Oak"
   elseif b == "棕榈树" then
    bai.cuttreeselect = "Palm"
   elseif b == "松树" then
    bai.cuttreeselect = "Pine"
   elseif b == "罐灌木" then
    bai.cuttreeselect = "PotBush"
   elseif b == "土豆" then
    bai.cuttreeselect = "Potato"
   elseif b == "REEE" then
    bai.cuttreeselect = "REEE"
   elseif b == "灵魂" then
    bai.cuttreeselect = "Spirit"
   elseif b == "彩虹" then
    bai.cuttreeselect = "Rainbow"
   elseif b == "随机" then
    bai.cuttreeselect = "Random"
   elseif b == "红宝石" then
    bai.cuttreeselect = "Ruby"
   elseif b == "鳞片" then
    bai.cuttreeselect = "Scale"
   elseif b == "污水树" then
    bai.cuttreeselect = "SewageTree"
   elseif b == "闪耀" then
    bai.cuttreeselect = "Shine"
   elseif b == "标志" then
    bai.cuttreeselect = "Sign"
   elseif b == "银" then
    bai.cuttreeselect = "Silver"
   elseif b == "彩虹糖" then
    bai.cuttreeselect = "Skittles"
   elseif b == "天空" then
    bai.cuttreeselect = "Sky"
   elseif b == "雪" then
    bai.cuttreeselect = "Snow"
   elseif b == "雪光" then
    bai.cuttreeselect = "SnowGlow"
   elseif b == "诡异" then
    bai.cuttreeselect = "Spooky"
   elseif b == "恐怖僵尸" then
    bai.cuttreeselect = "SpookyGhoul"
   elseif b == "恐怖霓虹" then
    bai.cuttreeselect = "SpookyNeon"
   elseif b == "石头" then
    bai.cuttreeselect = "Stone"
   elseif b == "玉米饼" then
    bai.cuttreeselect = "Taco"
   elseif b == "测试" then
    bai.cuttreeselect = "Test"
   elseif b == "线" then
    bai.cuttreeselect = "Thread"
   elseif b == "隧道爬行者" then
    bai.cuttreeselect = "TunnelCrawler"
   elseif b == "霓虹彩虹" then
    bai.cuttreeselect = "NeonRainbow"
   elseif b == "虚拟" then
    bai.cuttreeselect = "Virtual"
   elseif b == "虚空" then
    bai.cuttreeselect = "Void"
   elseif b == "火山" then
    bai.cuttreeselect = "Volcano"
   elseif b == "华夫饼" then
    bai.cuttreeselect = "Waffer"
   elseif b == "胡桃" then
    bai.cuttreeselect = "Walnut"
   elseif b == "灰烬" then
    bai.cuttreeselect = "Ash"
   elseif b == "铜" then
    bai.cuttreeselect = "Copper"
   elseif b == "狗" then
    bai.cuttreeselect = "Dog"
   elseif b == "通用主" then
    bai.cuttreeselect = "GenericPrime"
   elseif b == "通用秋" then
    bai.cuttreeselect = "GenericFall"
   elseif b == "通用死" then
    bai.cuttreeselect = "GenericDead"
   elseif b == "大橡树" then
    bai.cuttreeselect = "GreatOak"
   elseif b == "岩浆" then
    bai.cuttreeselect = "Magma"
   elseif b == "冰" then
    bai.cuttreeselect = "Ice"
   elseif b == "放射性" then
    bai.cuttreeselect = "Radioactive"
   elseif b == "通用金" then
    bai.cuttreeselect = "GenericGold"
   elseif b == "天体" then
    bai.cuttreeselect = "Celestial"
   elseif b == "星星" then
    bai.cuttreeselect = "Star"
   elseif b == "砖替代品" then
    bai.cuttreeselect = "BrickAlternative"
   elseif b == "深色砖" then
    bai.cuttreeselect = "BrickDark"
   elseif b == "砖" then
    bai.cuttreeselect = "Brick"
   elseif b == "裂缝岩浆" then
    bai.cuttreeselect = "CrackedLava"
   elseif b == "蓝色火焰" then
    bai.cuttreeselect = "BlueFlame"
   elseif b == "火焰" then
    bai.cuttreeselect = "Flame"
   elseif b == "骨头" then
    bai.cuttreeselect = "Bone"
   elseif b == "彩虹火焰" then
    bai.cuttreeselect = "RainbowFlame"
  end
end)
SectionKJ:Button("获取工具", function()
  local tool = Instance.new("Tool", lp.Backpack)
  tool.RequiresHandle = false
  tool.Name = "点击蓝图"
  tool.Activated:Connect(function()
    local str = mouse.Target.Parent
    game.ReplicatedStorage.PlaceStructure.ClientPlacedStructure:FireServer(str.ItemName.Value, str.PrimaryPart.CFrame, game.Players.LocalPlayer, bai.cuttreeselect, str ,false)
  end)
end)

local UITab3 = win:Tab("删除门🚪",'16060333448')

local about = UITab3:section("删除门🚪",true)

about:Button("删除地狱门",function()
    local modelParent = workspace.HLArea.Model

-- 获取所有子模型并遍历
for _, child in ipairs(modelParent:GetChildren()) do
    if child:IsA("Model") then
        -- 删除中部门
        local midDoor = child:FindFirstChild("Mid part door")
        if midDoor then
            midDoor:Destroy()
        end
        
        -- 删除左门
        local leftDoor = child:FindFirstChild("Left door")
        if leftDoor then
            leftDoor:Destroy()
        end
        
        -- 删除右门
        local rightDoor = child:FindFirstChild("Right door")
        if rightDoor then
            rightDoor:Destroy()
        end
    end
end

print("指定门部件已成功删除")
end)

about:Button("删除科技门(石头木)",function()
    -- 安全删除路径对象
local target = workspace:FindFirstChild("PlainsMaze")
if target then
    target = target:FindFirstChild("Door")
    if target then
        target = target:FindFirstChild("Doors")
        if target then
            target:Destroy()
            print("成功删除 Doors 对象")
        else
            warn("未找到 Doors 对象")
        end
    else
        warn("未找到 Door 对象")
    end
else
    warn("未找到 PlainsMaze 对象")
end
end)

about:Button("删除恶魔鸭召唤的门",function()
    -- 安全删除对象（无提示）
local target = workspace:FindFirstChild("Region_Main")
if target then
    local explodeMe = target:FindFirstChild("ExplodeMe")
    if explodeMe then
        explodeMe:Destroy()  -- 静默销毁对象
    end
end
end)

about:Button("删除永恒剑门",function()
    workspace.Region_Plains.ExplodeMe:Destroy()
end)

about:Button("删除复仇召唤门",function()
    workspace.Region_Far.ExplodeMe:Destroy()
end)

about:Button("黑市/土地商店门",function()
    workspace.Stores.BlackMarket.Parts.BDoor:Destroy()
    workspace.Region_LittleMeadow.ExplodeMe:Destroy()
end)

about:Button("长隧道的门",function()
    workspace.Region_Tunnel.Gate:Destroy()
end)

local UITab3 = win:Tab("防止掉虚空",'16060333448')

local about = UITab3:section("防止",true)

about:Button("禁止虚空伤害",function()
--!optimize 2

if not game:IsLoaded() then game.Loaded:Wait() end

local Workspace
    = workspace

local getcallingscript, checkcaller
    = getcallingscript, checkcaller

local ExecutorName = identifyexecutor()
local Initializing = true

local Nan = (0 / 0)

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(self, Key, Value)
    if self == Workspace and Key == "FallenPartsDestroyHeight" and not Initializing then
        local Calling = checkcaller() and `{ExecutorName} LocalScript` or getcallingscript():GetFullName()
        warn(`[Anti Void] "{Calling}" attempted to set FallenPartsDestroyHeight to {Value}!`)

        return OldNewIndex(self, Key, Nan)
    end

    return OldNewIndex(self, Key, Value)
end)

Workspace.FallenPartsDestroyHeight = Nan
Initializing = false
end)

local UITab2 = win:Tab("刷斧头",'')

local about = UITab2:section("刷斧头",true)

about:Button("开始刷", function()
-- 白名单验证系统
local HttpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
local whitelistURL = "https://raw.githubusercontent.com/xcmsnd/keys.json/refs/heads/main/bai"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WhitelistUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 320, 0, 150)
Frame.Position = UDim2.new(0.5, -160, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)
local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Thickness = 1.5
UIStroke.Color = Color3.fromRGB(100, 100, 255)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "白名单验证"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local Status = Instance.new("TextLabel", Frame)
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Position = UDim2.new(0, 0, 1, -25)
Status.BackgroundTransparency = 1
Status.TextColor3 = Color3.new(1, 1, 1)
Status.TextSize = 18
Status.Text = "正在验证白名单..."

-- 验证函数
local function verifyWhitelist()
    Status.Text = "正在验证白名单..."
    
    local ok, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(whitelistURL))
    end)

    if not ok then
        Status.Text = "服务器连接失败"
        return false
    end

    local whitelistData = result[player.Name]
    if not whitelistData then
        Status.Text = "您不在白名单中"
        pcall(function() setclipboard("你没有白名单请你联系作者，作者qq2627272316") end)
        return false
    end

    local today = os.date("%Y-%m-%d")
    if whitelistData.expire and today > whitelistData.expire then
        Status.Text = "白名单已过期"
        pcall(function() setclipboard("你没有白名单请你联系作者，作者qq2627272316") end)
        return false
    end

    Status.Text = "验证成功！欢迎 " .. player.Name
    task.wait(1)
    ScreenGui:Destroy()
    return true
end

-- 执行验证
if verifyWhitelist() then
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Character:WaitForChild("HumanoidRootPart")

-- 获取房产位置
local pos
for _, v in pairs(game.Workspace.Properties:GetChildren()) do
    if v:FindFirstChild("Owner") and v.Owner.Value == LocalPlayer and v:FindFirstChild("OriginSquare") then
        pos = v.OriginSquare.CFrame + Vector3.new(0, 10, 0)
        break
    end
end

-- 1. 高空传送
Character:PivotTo(Character.HumanoidRootPart.CFrame + Vector3.new(0, 100000, 0))
wait(0.5)

-- 2. 在房产位置丢弃工具
if pos then
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool.Name == "Tool" then  -- 名称完全匹配"Tool"
                local args = {
                    [1] = tool,
                    [2] = "Drop tool",
                    [3] = 742,
                    [4] = pos
                }
                
                game:GetService("ReplicatedStorage").Interaction.ClientInteracted:FireServer(unpack(args))
            end
        end
    end
end

-- 3. 杀死角色
Character.Humanoid.Health = 0
wait(1)

-- 4. 重新进入服务器
LocalPlayer.CharacterAdded:Wait()
wait(1)
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
else
    task.wait(1)
    ScreenGui:Destroy()
end
    end)
    
    local UITab62 = win:Tab("桥梁购买",'')

local about = UITab62:section("桥梁",true)

about:Button("持续购买桥梁", function()
    --关闭用false
getgenv().o = true
while wait() do
    if getgenv().o == true then
    local args = {
    [1] = {
        ["Character"] = workspace.Bridge.TollBooth0.Seranok,
        ["Name"] = "Seranok",
        ["ID"] = 10,
        ["Dialog"] = workspace.Bridge.TollBooth0.Seranok.Dialog
    },
    [2] = "ConfirmPurchase"
}

game:GetService("ReplicatedStorage").NPCDialog.PlayerChatted:InvokeServer(unpack(args))
     end
end
    end)
    
    about:Button("桥梁关闭购买", function()
    getgenv().o = false
    end)

local UITab1 = win:Tab("音乐",'')

local about = UITab1:section("音乐",true)

about:Button("停止音乐", function()
-- 停止所有 SoundId 为 1845918434 的音乐
for _, obj in ipairs(game.Workspace:GetChildren()) do
    if obj:IsA("Sound") and obj.SoundId == "rbxassetid://1837879082" then
        obj:Stop()
    end
end

-- 停止所有 SoundId 为 1845918434 的音乐
for _, obj in ipairs(game.Workspace:GetChildren()) do
    if obj:IsA("Sound") and obj.SoundId == "rbxassetid://1845918434" then
        obj:Stop()
    end
end
    end)

about:Button("义勇军进行曲", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play()
    end)

about:Button("噔噔噔", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
    end)

about:Button("还没做完-内衣菜狗", function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://"
    sound.Parent = game.Workspace
    sound:Play()
    end)
