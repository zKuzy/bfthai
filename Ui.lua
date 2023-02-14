_G.Settings = {
	UI = {
		Color = Color3.fromRGB(25, 255, 255),
		Logo = "10729012702",
	},
	Toggle = {
		ToggleTrue = "🥱",
		ToggleFalse = "🥵",
	}
}

do
	local ui = game.CoreGui:FindFirstChild("HeeNo") local ImageButtonD = game.CoreGui:FindFirstChild("ImageButton")
	if ui then
		ui:Destroy() ImageButtonD:Destroy()
	end
end

_G.Color = _G.Settings.UI.Color or Color3.fromRGB(25, 255, 255)
local LogoUI = _G.Settings.Logo or "10729012702"

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local library = {}

function library.Window(options)
	local text = options.Name
	local logo = options.Logo or LogoButton
	local keybind = options.Keybind or Enum.KeyCode.RightControl

    local currenttab = ""
    local uihide = false
    local abc = false
    yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")

    local HeeNo = Instance.new("ScreenGui")
    HeeNo.Name = "HeeNo"
    HeeNo.Parent = game.CoreGui
    HeeNo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = HeeNo
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.ClipsDescendants = true
    Main.BackgroundColor3 = Color3.fromRGB(23, 24, 25)
    Main.Position = UDim2.new(0.5, 0, 0.499, 0)
    Main.Size = UDim2.new(0, 0, 0, 0)

    Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)

    local MainCorner = Instance.new("UICorner")
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main
    
    local UIStroke96 = Instance.new("UIStroke")
	UIStroke96.Thickness = 3.2
	UIStroke96.Parent = Main
	UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
	UIStroke96.Color = _G.Color
	UIStroke96.Transparency = 0.10

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.Size = UDim2.new(0, 656, 0, 29)

    local TopCorner = Instance.new("UICorner")
    TopCorner.Name = "TopCorner"
    TopCorner.Parent = Top

    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 35, 0, 0)
    NameHub.Size = UDim2.new(0, 61, 0, 27)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 17.000

    local NameHub2 = Instance.new("TextLabel")
    NameHub2.Name = "NameHub2"
    NameHub2.Parent = Top
    NameHub2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub2.BackgroundTransparency = 1.000
    NameHub2.Position = UDim2.new(0, 95, 0, 0)
    NameHub2.Size = UDim2.new(0, 61, 0, 27)
    NameHub2.Font = Enum.Font.GothamSemibold
    NameHub2.Text = string.upper("Hub")
    NameHub2.TextColor3 = _G.Color
    NameHub2.TextSize = 17.000
    NameHub2.TextXAlignment = Enum.TextXAlignment.Left
    
    local Logo = Instance.new("ImageLabel")
	Logo.Name = "Logo"
	Logo.Parent = Top
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 10, 0, 1)
	Logo.Size = UDim2.new(0, 25, 0, 25)
	Logo.Image = "rbxassetid://"..tostring(logo)
	
	local osday = Instance.new("TextLabel")
    osday.Name = "osday"
    osday.Parent = Top
    osday.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    osday.BackgroundTransparency = 1.000
    osday.Position = UDim2.new(0, 250, 0, 0)
    osday.Size = UDim2.new(0, 61, 0, 27)
    osday.Font = Enum.Font.GothamSemibold
    osday.TextColor3 = Color3.fromRGB(0, 255, 0)
    osday.TextSize = 12.000
    osday.TextXAlignment = Enum.TextXAlignment.Left
	
	task.spawn(function()
		while task.wait() do
			pcall(function()
				osday.Text = os.date("%I:%M:%S".." | ".."%B %d, %Y")
			end)
		end
	end)
	
	local mainDiscord = Instance.new("ImageButton")
	mainDiscord.Name = "mainDiscord"
	mainDiscord.Parent = Top
	mainDiscord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainDiscord.BackgroundTransparency = 1.000
	mainDiscord.Position = UDim2.new(0, 550, 0, 0)
	mainDiscord.Size = UDim2.new(0, 30, 0, 30)
	mainDiscord.Image = "http://www.roblox.com/asset/?id=12058969086"
	mainDiscord.ImageColor3 = Color3.fromRGB(200, 200, 200)

	mainDiscord.MouseLeave:Connect(function()
	    Utility:TweenObject(mainDiscord, {BackgroundTransparency = 1}, 0.1)
	end)

	mainDiscord.MouseEnter:Connect(function()
 	   Utility:TweenObject(mainDiscord, {BackgroundTransparency = 0.5}, 0.1)
	end)

	mainDiscord.MouseButton1Click:Connect(function()
	    setclipboard("https://discord.gg/Mp7qppfwER")
	    wait(.1)
  	  game:GetService("StarterGui"):SetCore("SendNotification",{
     	   Title = "Discord",
     	   Text = "Discord copied on your clipboard",
     	   Button1 = "Okay",
   	     Duration = 20
	    })
	end)
	
	local TextButton01 = Instance.new("TextButton")
    TextButton01.Name = "TextButton01"
    TextButton01.Parent = Top
    TextButton01.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton01.BackgroundTransparency = 1.000
    TextButton01.Position = UDim2.new(0, 595, 0, 0)
    TextButton01.Size = UDim2.new(0, 30, 0, 30)
    TextButton01.Font = Enum.Font.GothamSemibold
    TextButton01.Text = "X"
    TextButton01.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton01.TextSize = 35.000
    TextButton01.TextXAlignment = Enum.TextXAlignment.Left
    
    TextButton01.MouseButton1Click:Connect(function()
	    game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
  	  game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
	end)

    local BindButton = Instance.new("TextButton")
    BindButton.Name = "BindButton"
    BindButton.Parent = Top
    BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BindButton.BackgroundTransparency = 1.000
    BindButton.Position = UDim2.new(0, 119, 0, 0)
    BindButton.Size = UDim2.new(0, 100, 0, 27)
    BindButton.Font = Enum.Font.GothamSemibold
    BindButton.Text = "[ "..string.gsub(tostring(keybind),"Enum.KeyCode.","").." ]"
    BindButton.TextColor3 = Color3.fromRGB(103, 103, 103)
    BindButton.TextSize = 11.000

    BindButton.MouseButton1Click:Connect(function ()
        BindButton.Text = "[ ... ]"
        local inputwait = game:GetService("UserInputService").InputBegan:wait()
        local shiba = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

        if
        shiba.Name ~= "Focus" and shiba.Name ~= "MouseMovement" and shiba.Name ~= "Focus"
        then
            BindButton.Text = "[ "..shiba.Name.." ]"
            yoo = shiba.Name
        end
    end)

    
    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Tab.Position = UDim2.new(0, 12, 0, 35)
	Tab.Size = UDim2.new(0, 632, 0, 41)

    local TabCorner = Instance.new("UICorner")
    TabCorner.Name = "TabCorner"
    TabCorner.Parent = Tab
    
    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 632, 0, 41)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = ScrollTab
    UIPadding.PaddingLeft = UDim.new(0, 10)

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "TabList"
    TabList.Parent = ScrollTab
    TabList.FillDirection = Enum.FillDirection.Horizontal
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    MakeDraggable(Top,Main)

	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode[yoo] then
			if uihide == false then
				uihide = true
				Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
				UIStroke96.Transparency = 1
			else
				uihide = false
				UIStroke96.Transparency = 0.10
				Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
				--UDim2.new(0, 300, 0, 285)
			end
		end
	end)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(15, 16, 17)
    Page.Position = UDim2.new(0, 11, 0, 85)
    Page.Size = UDim2.new(0, 633, 0, 305)

    local PageCorner = Instance.new("UICorner")
    PageCorner.Name = "PageCorner"
    PageCorner.Parent = Page

    local PageFolder = Instance.new("Folder")
    PageFolder.Name = "PageFolder"
    PageFolder.Parent = Page

    local UIPageLayout = Instance.new("UIPageLayout")

    UIPageLayout.Parent = PageFolder
    UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    UIPageLayout.Padding = UDim.new(0, 10)
    UIPageLayout.TweenTime = 0.400
    UIPageLayout.GamepadInputEnabled = false
    UIPageLayout.ScrollWheelInputEnabled = false
    UIPageLayout.TouchInputEnabled = false


    local Ui = {}
    function Ui.AddTab(options)
    	local logo1 = options.LogoTab
    	local tabbtn = nil
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 50, 0, 41)
        TabButton.Position = UDim2.new(0, 120, 0, 0)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 15.000
        TabButton.Text = ""
        TabButton.TextTransparency = 0.500
        
        local IDK = Instance.new("ImageLabel")
		IDK.Name = "LogoIDK"..logo1
		IDK.Parent = TabButton
		IDK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		IDK.Position = UDim2.new(0, 2, 0, 2)
		IDK.BackgroundTransparency = 1.000
		IDK.Size = UDim2.new(0, 45, 0, 35)
		IDK.Image = "rbxassetid://"..tostring(logo1)
        
        local MainPage = Instance.new("Frame")

        MainPage.Name = "MainPage"
        MainPage.Parent = PageFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Position = UDim2.new(0.00157977885, 0, 0, 0)
        MainPage.Size = UDim2.new(0, 632, 0, 305)
		
        TabButton.MouseButton1Click:Connect(function()
		UIPageLayout:JumpTo(MainPage)
           for i,v in next, PageFolder:GetChildren() do 
               if v.Name == "MainPage" then
            	  currenttab = v.Name
           	end
            end
		end)

		

        local uitab = {}
        function uitab.AddPage()
            local MainFramePage = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local ScrollPage = Instance.new("ScrollingFrame")
            local PageList = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
            local UIPadding_2 = Instance.new("UIPadding")
            local UIListLayout_2 = Instance.new("UIListLayout")
        
            MainFramePage.Name = "MainFramePage"
            MainFramePage.Parent = MainPage
            MainFramePage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            MainFramePage.Size = UDim2.new(0, 612, 0, 285)
        
            UICorner.Parent = MainFramePage
        
            ScrollPage.Name = "ScrollPage".."_Page"
            ScrollPage.Parent = MainFramePage
            ScrollPage.Active = true
            ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollPage.BackgroundTransparency = 1.000
            ScrollPage.BorderSizePixel = 0
            ScrollPage.Size = UDim2.new(0, 612, 0, 285)
            ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
            ScrollPage.ScrollBarThickness = 0
        
            PageList.Name = "PageList"
            PageList.Parent = ScrollPage
            PageList.SortOrder = Enum.SortOrder.LayoutOrder
            PageList.Padding = UDim.new(0, 15)
        
            UIPadding.Parent = ScrollPage
            UIPadding.PaddingLeft = UDim.new(0, 10)
            UIPadding.PaddingTop = UDim.new(0, 10)
        
            UIPadding_2.Parent = MainPage
            UIPadding_2.PaddingLeft = UDim.new(0, 10)
            UIPadding_2.PaddingTop = UDim.new(0, 10)
        
            UIListLayout_2.Parent = MainPage
            UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 15)
            
            game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 26)
                    ScrollPage2.CanvasSize = UDim2.new(0,0,0,PageList2.AbsoluteContentSize.Y + 26)
                    ScrollTab.CanvasSize = UDim2.new(0,TabList.AbsoluteContentSize.X + 20,0,0)
                end)
            end)

            local main = {}
            function main.AddSeperator(options)
				local text = options.Title or "Seperator"
				
                local Seperator = Instance.new("Frame")
                local Sep1 = Instance.new("Frame")
                local Sep2 = Instance.new("TextLabel")
                local Sep3 = Instance.new("Frame")
                local labelll = {}
                
                Seperator.Name = "Seperator"
                Seperator.Parent = ScrollPage
                Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Seperator.BackgroundTransparency = 1.000
                Seperator.Size = UDim2.new(0, 260, 0, 20)
                
                Sep1.Name = "Sep1"
                Sep1.Parent = Seperator
                Sep1.BackgroundColor3 = _G.Color
                Sep1.BorderSizePixel = 0
                Sep1.Position = UDim2.new(0, 0, 0, 10)
                Sep1.Size = UDim2.new(0, 40, 0, 1)
                
                Sep2.Name = "Sep2"
                Sep2.Parent = Seperator
                Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.BackgroundTransparency = 1.000
                Sep2.Position = UDim2.new(0, 250, 0, 0)
                Sep2.Size = UDim2.new(0, 100, 0, 20)
                Sep2.Font = Enum.Font.GothamSemibold
                Sep2.Text = text
                Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Sep2.TextSize = 17.000
                
                Sep3.Name = "Sep3"
                Sep3.Parent = Seperator
                Sep3.BackgroundColor3 = _G.Color
                Sep3.BorderSizePixel = 0
                Sep3.Position = UDim2.new(0, 551, 0, 10)
                Sep3.Size = UDim2.new(0, 40, 0, 1)
                function labelll:AddText(newtext)
                    Sep2.Text = newtext
                end
                return labelll
            end
			
        function main.PlayerInfo()
        
        	local UserID = game.Players.LocalPlayer.UserId
        
        	local ThumbType = Enum.ThumbnailType.HeadShot
        	local ThumbSize = Enum.ThumbnailSize.Size420x420
        	local Content = game.Players:GetUserThumbnailAsync(UserID,ThumbType,ThumbSize)
        
        	local PlayerInfoFrame = Instance.new("Frame")
        	local PlayerInfoFrameUICorner = Instance.new("UICorner")
        	local ImageLabel = Instance.new("ImageLabel")
        	local UICorner = Instance.new("UICorner")
        	local Name = Instance.new("TextLabel")
        	local Lvl = Instance.new("TextLabel")
        	local Fruit = Instance.new("TextLabel")
        
        	local Line = Instance.new("Frame")
        	local UIGradient = Instance.new("UIGradient")
        
        	Line.Name = "Line"
        	Line.Parent = PlayerInfoFrame
        	Line.AnchorPoint = Vector2.new(0.5, 0.5)
        	Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Line.BorderSizePixel = 0
        	Line.Position = UDim2.new(0.5, 0, 0.311723471, 0)
        	Line.Size = UDim2.new(0, 591, 0, 1)
        
        	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
        	UIGradient.Parent = Line
        
        	PlayerInfoFrame.Name = "PlayerInfoFrame"
        	PlayerInfoFrame.Parent = ScrollPage
        	PlayerInfoFrame.Active = true
        	PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
        	PlayerInfoFrame.BorderSizePixel = 0
        	PlayerInfoFrame.Size = UDim2.new(0, 591, 0, 285)
        
        	PlayerInfoFrameUICorner.Name = "PlayerInfoFrameUICorner"
        	PlayerInfoFrameUICorner.Parent = PlayerInfoFrame
        
        	ImageLabel.Parent = PlayerInfoFrame
        	ImageLabel.Active = true
        	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	ImageLabel.BackgroundTransparency = 1
        	ImageLabel.BorderSizePixel = 0
        	ImageLabel.Position = UDim2.new(0, 45, 0, 45)
        	ImageLabel.Size = UDim2.new(0, 70, 0, 70)
        	ImageLabel.Image = Content
        
        	UICorner.Parent = ImageLabel
        
        	Name.Name = "Name"
        	Name.Parent = PlayerInfoFrame
        	Name.Active = true
        	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Name.BackgroundTransparency = 1.000
        	Name.Position = UDim2.new(0, 225, 0, 0)
        	Name.Size = UDim2.new(0, 200, 0, 27)
        	Name.Font = Enum.Font.GothamBold
        	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
        	Name.TextSize = 12.000
        	Name.Text = game.Players.LocalPlayer.Name.. " ("..game.Players.LocalPlayer.DisplayName..")"
        	Name.TextXAlignment = Enum.TextXAlignment.Left
        
        	Lvl.Name = "Lvl"
        	Lvl.Parent = PlayerInfoFrame
        	Lvl.Active = true
        	Lvl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Lvl.BackgroundTransparency = 1.000
        	Lvl.Position = UDim2.new(0, 85, 0.113057934, 0)
        	Lvl.Size = UDim2.new(0, 200, 0, 27)
        	Lvl.TextTransparency = 0.8
        	Lvl.Font = Enum.Font.GothamBold
        	Lvl.TextColor3 = Color3.fromRGB(255, 255, 255)
        	Lvl.TextSize = 12.000
        	Lvl.TextXAlignment = Enum.TextXAlignment.Left
        
        	Fruit.Name = "Fruit"
        	Fruit.Parent = PlayerInfoFrame
        	Fruit.Active = true
        	Fruit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Fruit.BackgroundTransparency = 1.000
        	Fruit.Position = UDim2.new(0, 85, 0.199820146, 0)
        	Fruit.Size = UDim2.new(0, 200, 0, 27)
        	Fruit.Font = Enum.Font.GothamBold
        	Fruit.TextTransparency = 0.8
        	Fruit.TextColor3 = Color3.fromRGB(255, 255, 255)
        	Fruit.TextSize = 12.000
        	Fruit.TextXAlignment = Enum.TextXAlignment.Left
        
        	local id = game.PlaceId
        
        	if id == 2753915549 or id == 4442272183 or id == 7449423635 then
        		Fruit.Text = "Devil Fruit : "..game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.. " / ".. "Race : " ..game:GetService("Players").LocalPlayer.Data.Race.Value
        	else
        		Fruit.Text = "Don't Find Your Database"
        		Lvl.Text = "Don't Find Your Database"
        	end
        
        	local HealthBar = Instance.new("Frame")
        	local HealthBarUICorner = Instance.new("UICorner")
        	local HealthText = Instance.new("TextLabel")
        	local Line = Instance.new("Frame")
        	local LineHealth = Instance.new("Frame")
        
        	HealthBar.Name = "HealthBar"
        	HealthBar.Parent = PlayerInfoFrame
        	HealthBar.BackgroundColor3 = Color3.fromRGB(0,0,0)
        	HealthBar.BorderSizePixel = 0
        	HealthBar.Position = UDim2.new(0.0187500007, 0, 0.340836018, 0)
        	HealthBar.Size = UDim2.new(0, 561, 0, 45)
        
        	HealthBarUICorner.CornerRadius = UDim.new(0, 4)
        	HealthBarUICorner.Name = "HealthBarUICorner"
        	HealthBarUICorner.Parent = HealthBar
        
        	HealthText.Name = "HealthText"
        	HealthText.Parent = HealthBar
        	HealthText.Active = true
        	HealthText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	HealthText.BackgroundTransparency = 1.000
        	HealthText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
        	HealthText.Size = UDim2.new(0, 561, 0, 22)
        	HealthText.Font = Enum.Font.GothamBold
        	HealthText.Text = "Health"
        	HealthText.TextColor3 = Color3.fromRGB(85, 255, 127)
        	HealthText.TextSize = 12.000
        	HealthText.TextWrapped = true
        	HealthText.TextXAlignment = Enum.TextXAlignment.Left
        
        	Line.Name = "Line"
        	Line.Parent = HealthBar
        	Line.AnchorPoint = Vector2.new(0.5, 0.5)
        	Line.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        	Line.BorderSizePixel = 0
        	Line.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
        	Line.Size = UDim2.new(0, 561, 0, 5)
        
        	LineHealth.Name = "LineHealth"
        	LineHealth.Parent = Line
        	LineHealth.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
        	LineHealth.BorderSizePixel = 0
        	LineHealth.Size = UDim2.new(0, 561, 0, 5)
        
        	local StaminaBar = Instance.new("Frame")
        	local StaminaBarUICorner = Instance.new("UICorner")
        	local StaminaText = Instance.new("TextLabel")
        	local StaminaLine = Instance.new("Frame")
        	local LineStamina = Instance.new("Frame")
        
        	StaminaBar.Name = "StaminaBar"
        	StaminaBar.Parent = PlayerInfoFrame
        	StaminaBar.BackgroundColor3 = Color3.fromRGB(0,0,0)
        	StaminaBar.BorderSizePixel = 0
        	StaminaBar.Position = UDim2.new(0.0166666675, 0, 0.50803858, 0)
        	StaminaBar.Size = UDim2.new(0, 561, 0, 45)
        
        	StaminaBarUICorner.CornerRadius = UDim.new(0, 4)
        	StaminaBarUICorner.Name = "StaminaBarUICorner"
        	StaminaBarUICorner.Parent = StaminaBar
        
        	StaminaText.Name = "StaminaText"
        	StaminaText.Parent = StaminaBar
        	StaminaText.Active = true
        	StaminaText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	StaminaText.BackgroundTransparency = 1.000
        	StaminaText.Position = UDim2.new(0.0260000005, 0, 0.100000001, 0)
        	StaminaText.Size = UDim2.new(0, 561, 0, 22)
        	StaminaText.Font = Enum.Font.GothamBold
        	StaminaText.Text = "Stamina"
        	StaminaText.TextColor3 = Color3.fromRGB(85, 170, 255)
        	StaminaText.TextSize = 12.000
        	StaminaText.TextWrapped = true
        	StaminaText.TextXAlignment = Enum.TextXAlignment.Left
        
        	StaminaLine.Name = "StaminaLine"
        	StaminaLine.Parent = StaminaBar
        	StaminaLine.AnchorPoint = Vector2.new(0.5, 0.5)
        	StaminaLine.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        	StaminaLine.BorderSizePixel = 0
        	StaminaLine.Position = UDim2.new(0.498908311, 0, 0.766666651, 0)
        	StaminaLine.Size = UDim2.new(0, 561, 0, 5)
        
        	LineStamina.Name = "LineStamina"
        	LineStamina.Parent = StaminaLine
        	LineStamina.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
        	LineStamina.BorderSizePixel = 0
        	LineStamina.Size = UDim2.new(0, 561, 0, 5)
        
        	local Beli = Instance.new("TextLabel")
        	local Fragment = Instance.new("TextLabel")
        
        	Beli.Name = "Beli"
        	Beli.Parent = PlayerInfoFrame
        	Beli.Active = true
        	Beli.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Beli.BackgroundTransparency = 1.000
        	Beli.Position = UDim2.new(0.018749997, 0, 0.67897433, 0)
        	Beli.Size = UDim2.new(0, 200, 0, 27)
        	Beli.Font = Enum.Font.GothamBold
        	Beli.TextColor3 = Color3.fromRGB(85, 255, 127)
        	Beli.TextSize = 14.000
        	Beli.TextXAlignment = Enum.TextXAlignment.Left
        
        	Fragment.Name = "Fragment"
        	Fragment.Parent = PlayerInfoFrame
        	Fragment.Active = true
        	Fragment.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Fragment.BackgroundTransparency = 1.000
        	Fragment.Position = UDim2.new(0.018749997, 0, 0.765791059, 0)
        	Fragment.Size = UDim2.new(0, 200, 0, 27)
        	Fragment.Font = Enum.Font.GothamBold
        	Fragment.TextColor3 = Color3.fromRGB(170, 85, 255)
        	Fragment.TextSize = 14.000
        	Fragment.TextXAlignment = Enum.TextXAlignment.Left
        
        	local Bounty = Instance.new("TextLabel")
        
        	Bounty.Name = "Bounty"
        	Bounty.Parent = PlayerInfoFrame
        	Bounty.Active = true
        	Bounty.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        	Bounty.BackgroundTransparency = 1.000
        	Bounty.Position = UDim2.new(0.018749997, 0, 0.852607787, 0)
        	Bounty.Size = UDim2.new(0, 200, 0, 27)
        	Bounty.Font = Enum.Font.GothamBold
        	Bounty.TextColor3 = Color3.fromRGB(255, 170, 0)
        	Bounty.TextSize = 14.000
        	Bounty.TextXAlignment = Enum.TextXAlignment.Left
        
        	spawn(function()
        		while wait(0.001) do 
        			pcall(function()
        				Lvl.Text = "Level : "..game:GetService("Players").LocalPlayer.Data.Level.Value
        				Beli.Text = "Beli : "..game:GetService("Players").LocalPlayer.Data.Beli.Value
        				Fragment.Text = "Fragments : "..game:GetService("Players").LocalPlayer.Data.Fragments.Value
        				Bounty.Text = "Bounty : "..game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value
        				StaminaText.Text = "Stamina : "..game.Players.LocalPlayer.Character.Energy.Value.."/"..game.Players.LocalPlayer.Character.Energy.MaxValue
        				TweenService:Create(
        					LineStamina,
        					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        					{Size = UDim2.new(game.Players.LocalPlayer.Character.Energy.Value/game.Players.LocalPlayer.Character.Energy.MaxValue, 0, 1, 0)} -- UDim2.new(0, 128, 0, 25)
        				):Play()
        
        				HealthText.Text = "Health : "..game.Players.LocalPlayer.Character.Humanoid.Health.."/"..game.Players.LocalPlayer.Character.Humanoid.MaxHealth
        				TweenService:Create(
        					LineHealth,
        					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        					{Size = UDim2.new(game.Players.LocalPlayer.Character.Humanoid.Health/game.Players.LocalPlayer.Character.Humanoid.MaxHealth, 0, 0, 5)} -- UDim2.new(0, 128, 0, 25)
        				):Play()
        			end)
        		end
        	end)
        end
			
            function main:AddLine()
                local Linee = Instance.new("Frame")
                local Line = Instance.new("Frame")
                
                Linee.Name = "Linee"
                Linee.Parent = ScrollPage
                Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Linee.BackgroundTransparency = 1.000
                Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
                Linee.Size = UDim2.new(0, 592, 0, 20)
                
                Line.Name = "Line"
                Line.Parent = Linee
                Line.BackgroundColor3 = _G.Color
                Line.BorderSizePixel = 0
                Line.Position = UDim2.new(0, 0, 0, 10)
                Line.Size = UDim2.new(0, 592, 0, 1)
            end

            function main.AddButton(options)
				local text = options.Title or "Button"
				local callback = options.callback or function() end
			
                local Button = Instance.new("Frame")
                local ButtonCorner = Instance.new("UICorner")
                local Btn = Instance.new("TextButton")
                local BtnCorner = Instance.new("UICorner")
                
                Button.Name = "Button"
                Button.Parent = ScrollPage
                Button.BackgroundColor3 = _G.Color
                Button.Size = UDim2.new(0, 592, 0, 38)
                Button.BackgroundTransparency = 0.5
                
                ButtonCorner.CornerRadius = UDim.new(0, 5)
                ButtonCorner.Name = "ButtonCorner"
                ButtonCorner.Parent = Button
                
                local UIGradient2 = Instance.new("UIGradient")
                UIGradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30,30,30)), ColorSequenceKeypoint.new(0.29, Color3.fromRGB(170, 9, 89)), ColorSequenceKeypoint.new(0.50, _G.Color), ColorSequenceKeypoint.new(0.68, Color3.fromRGB(170, 9, 89)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30,30,30))}
        		UIGradient2.Parent = Button
                
                Btn.Name = "Btn"
                Btn.Parent = Button
                Btn.AutoButtonColor = false
                Btn.BackgroundColor3 = _G.Color
                Btn.BackgroundTransparency = 1
                Btn.Position = UDim2.new(0, 1, 0, 1)
                Btn.Size = UDim2.new(0, 612, 0, 38)
                Btn.Font = Enum.Font.GothamSemibold
                Btn.TextColor3 = Color3.fromRGB(225, 225, 225)
                Btn.TextSize = 16.000
                Btn.Text = text
                
                
                BtnCorner.CornerRadius = UDim.new(0, 5)
                BtnCorner.Name = "BtnCorner"
                BtnCorner.Parent = Btn

                Btn.MouseEnter:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                end)

                Btn.MouseLeave:Connect(function()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                end)

                Btn.MouseButton1Click:Connect(function()
                    callback()
                    Btn.TextSize = 9
                    TweenService:Create(
                        Btn,
                        TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                        {TextSize = 16}
                    ):Play()
                end)
            end 
            
         function main.AddDropdown(options)
			local text = options.Title or "Dropdown" 
			local itemname = options.Default or {}
			local option = options.Item or {}
			local callback = options.callback or function() end
			
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")
			local DropImagee = Instance.new("ImageLabel")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = ScrollPage
			Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 592, 0, 31)
			Dropdown.BackgroundTransparency = 0.5
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown
			
			local UIStroke6 = Instance.new("UIStroke")
			
			UIStroke6.Thickness = 1.5
			UIStroke6.Parent = Dropdown
			UIStroke6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke6.LineJoinMode = Enum.LineJoinMode.Round
			UIStroke6.Color = _G.Color
			UIStroke6.Transparency = 0.10
			
			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 592, 0, 31)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000
			
			if type(itemname) == "string" then
				DropTitle.Name = "DropTitle"
				DropTitle.Parent = Dropdown
				DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropTitle.BackgroundTransparency = 1.000
				DropTitle.Size = UDim2.new(0, 592, 0, 31)
				DropTitle.Font = Enum.Font.GothamSemibold
				DropTitle.Text = text.. " : "..itemname
				DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
				DropTitle.TextSize = 15.000
			else
				DropTitle.Name = "DropTitle"
				DropTitle.Parent = Dropdown
				DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropTitle.BackgroundTransparency = 1.000
				DropTitle.Size = UDim2.new(0, 592, 0, 31)
				DropTitle.Font = Enum.Font.GothamSemibold
				DropTitle.Text = text.. " : "
				DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
				DropTitle.TextSize = 15.000
			end
			
			DropScroll.Name = "DropScroll"
			DropScroll.Parent = DropTitle
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 592, 0, 100)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 2)
			DropScroll.ScrollBarThickness = 3
			
			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)
			
			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 567, 0, 6)
			DropImage.Rotation = -90
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://6031090990"
			
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 592, 0, 31)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000
			
			Dropdown.MouseEnter:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        UIStroke6,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0}
                    ):Play()
                    
                end)

                Dropdown.MouseLeave:Connect(function()
                    TweenService:Create(
                        Dropdown,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        DropLabel,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        DropImage,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {ImageTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        UIStroke6,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Transparency = 0.10}
                    ):Play()
                end)

			for i,v in next,option do
				local Item = Instance.new("TextButton")
				local Itemlogo = Instance.new("ImageLabel")
				
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(50, 51, 52)
				--Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 587, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				Item.ClipsDescendants = true
				
				Itemlogo.Name = "Itemlogo"
				Itemlogo.Parent = Item
				Itemlogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Itemlogo.BackgroundTransparency = 1.000
				Itemlogo.Position = UDim2.new(0, 587, 0, 26)
				Itemlogo.Size = UDim2.new(0, 20, 0, 20)
				Itemlogo.Image = "rbxassetid://6031090990"

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0, 592, 0, 131),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0, 592, 0, 131),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0, 592, 0, 31),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(50, 51, 52)
				--Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 587, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0, 592, 0, 131),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end
			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,592,0,31),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end

            function main.AddSlider(options)
				local text = options.Title or "Slider"
				local min = options.Min or 1
				local max = options.Max or 100
				local set = options.Set or 35
				local callback = options.callback or function() end
            	
                local Slider = Instance.new("Frame")
				local slidercorner = Instance.new("UICorner")
				local sliderr = Instance.new("Frame")
				local sliderrcorner = Instance.new("UICorner")
				local SliderLabel = Instance.new("TextLabel")
				local HAHA = Instance.new("Frame")
				local AHEHE = Instance.new("TextButton")
				local bar = Instance.new("Frame")
				local bar1 = Instance.new("Frame")
				local bar1corner = Instance.new("UICorner")
				local barcorner = Instance.new("UICorner")
				local circlebar = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local slidervalue = Instance.new("Frame")
				local valuecorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")
				local UICorner_2 = Instance.new("UICorner")
	
				Slider.Name = "Slider"
				Slider.Parent = ScrollPage
				Slider.BackgroundColor3 = _G.Color
				Slider.BackgroundTransparency = 0
				Slider.Size = UDim2.new(0, 592, 0, 48)
	
				slidercorner.CornerRadius = UDim.new(0, 5)
				slidercorner.Name = "slidercorner"
				slidercorner.Parent = Slider
	
				sliderr.Name = "sliderr"
				sliderr.Parent = Slider
				sliderr.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				sliderr.Position = UDim2.new(0, 1, 0, 1)
				sliderr.Size = UDim2.new(0, 590, 0, 46)
	
				sliderrcorner.CornerRadius = UDim.new(0, 5)
				sliderrcorner.Name = "sliderrcorner"
				sliderrcorner.Parent = sliderr
	
				SliderLabel.Name = "SliderLabel"
				SliderLabel.Parent = sliderr
				SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderLabel.BackgroundTransparency = 1.000
				SliderLabel.Position = UDim2.new(0, 15, 0, 0)
				SliderLabel.Size = UDim2.new(0, 180, 0, 26)
				SliderLabel.Font = Enum.Font.GothamSemibold
				SliderLabel.Text = text
				SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
				SliderLabel.TextSize = 16.000
				SliderLabel.TextTransparency = 0
				SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
	
				HAHA.Name = "HAHA"
				HAHA.Parent = sliderr
				HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HAHA.BackgroundTransparency = 1.000
				HAHA.Size = UDim2.new(0, 590, 0, 46)
	
				AHEHE.Name = "AHEHE"
				AHEHE.Parent = sliderr
				AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AHEHE.BackgroundTransparency = 1.000
				AHEHE.Position = UDim2.new(0, 10, 0, 35)
				AHEHE.Size = UDim2.new(0, 570, 0, 5)
				AHEHE.Font = Enum.Font.SourceSans
				AHEHE.Text = ""
				AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
				AHEHE.TextSize = 14.000
	
				bar.Name = "bar"
				bar.Parent = AHEHE
				bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				bar.Size = UDim2.new(0, 570, 0, 5)
	
				bar1.Name = "bar1"
				bar1.Parent = bar
				bar1.BackgroundColor3 = _G.Color
				bar1.BackgroundTransparency = 0.5
				bar1.Size = UDim2.new(set/max, 0, 0, 5)
	
				bar1corner.CornerRadius = UDim.new(0, 5)
				bar1corner.Name = "bar1corner"
				bar1corner.Parent = bar1
	
				barcorner.CornerRadius = UDim.new(0, 5)
				barcorner.Name = "barcorner"
				barcorner.Parent = bar
	
				circlebar.Name = "circlebar"
				circlebar.Parent = bar1
				circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				circlebar.Size = UDim2.new(0, 10, 0, 10)
	
				UICorner.CornerRadius = UDim.new(0, 100)
				UICorner.Parent = circlebar
	
				slidervalue.Name = "slidervalue"
				slidervalue.Parent = sliderr
				slidervalue.BackgroundColor3 = _G.Color
				slidervalue.BackgroundTransparency = 0.5
				slidervalue.Position = UDim2.new(0, 487, 0, 5)
				slidervalue.Size = UDim2.new(0, 65, 0, 18)
	
				valuecorner.CornerRadius = UDim.new(0, 5)
				valuecorner.Name = "valuecorner"
				valuecorner.Parent = slidervalue
	
				TextBox.Parent = slidervalue
				TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				TextBox.Position = UDim2.new(0, 1, 0, 1)
				TextBox.Size = UDim2.new(0, 63, 0, 16)
				TextBox.Font = Enum.Font.GothamSemibold
				TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
				TextBox.TextSize = 9.000
				TextBox.Text = set
				TextBox.TextTransparency = 0
	
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = TextBox
	
				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
	
				if Value == nil then
					Value = set
					pcall(function()
						callback(Value)
					end)
				end
				
				HAHA.MouseEnter:Connect(function()
					TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
				end)
				
				HAHA.MouseLeave:Connect(function()
					TweenService:Create(
                        Slider,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0}
                    ):Play()
                    TweenService:Create(
                        bar1,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
                    TweenService:Create(
                        slidervalue,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundTransparency = 0.5}
                    ):Play()
				end)
				
				AHEHE.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(max) - tonumber(min)) / 570) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 570), 0, 5)
                    circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 570), 0, -3)
                    moveconnection = mouse.Move:Connect(function()
                        TextBox.Text = Value
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 570) * bar1.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(Value)
                        end)
                        bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 570), 0, 5)
                        circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 570), 0, -3)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 570) * bar1.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 570), 0, 5)
                            circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 228), 0, -3)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 570) * bar1.AbsoluteSize.X) + tonumber(min))
                        TextBox.Text = Value
                    end
                end)

                TextBox.FocusLost:Connect(function()
                    if tonumber(TextBox.Text) > max then
                        TextBox.Text  = max
                    end
                    bar1.Size = UDim2.new((tonumber(TextBox.Text) or 0) / max, 0, 0, 5)
                    circlebar.Position = UDim2.new(1, -2, 0, -3)
                    TextBox.Text = tostring(tonumber(TextBox.Text) and math.floor( (tonumber(TextBox.Text) / max) * (max - min) + min) )
                    pcall(callback, TextBox.Text)
                end)
            end

         function main.AddTextbox(options)
    		local text = options.Title or "Textbox"
    		local disappear = options.Holder or "Holder"
    		local callback = options.callback or function() end
    		
    		local Textbox = Instance.new("Frame")
    		local TextboxCorner = Instance.new("UICorner")
    		local Textboxx = Instance.new("Frame")
    		local TextboxxCorner = Instance.new("UICorner")
    		local TextboxLabel = Instance.new("TextLabel")
    		local txtbtn = Instance.new("TextButton")
    		local RealTextbox = Instance.new("TextBox")
    		local UICorner = Instance.new("UICorner")
    
    		Textbox.Name = "Textbox"
    		Textbox.Parent = ScrollPage
    		Textbox.BackgroundColor3 = _G.Color
    		Textbox.BackgroundTransparency = 1.000
    		Textbox.Size = UDim2.new(0, 592, 0, 41)
    
    		TextboxCorner.CornerRadius = UDim.new(0, 5)
    		TextboxCorner.Name = "TextboxCorner"
    		TextboxCorner.Parent = Textbox
    
    		Textboxx.Name = "Textboxx"
    		Textboxx.Parent = Textbox
    		Textboxx.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    		Textboxx.Position = UDim2.new(0, 1, 0, 1)
    		Textboxx.Size = UDim2.new(0, 592, 0, 38)
    		
    		local UIStroke896 = Instance.new("UIStroke")
    		UIStroke896.Thickness = 1.5
    		UIStroke896.Parent = Textboxx
    		UIStroke896.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    		UIStroke896.LineJoinMode = Enum.LineJoinMode.Round
    		UIStroke896.Color = _G.Color
    		UIStroke896.Transparency = 0.10
    
    		TextboxxCorner.CornerRadius = UDim.new(0, 5)
    		TextboxxCorner.Name = "TextboxxCorner"
    		TextboxxCorner.Parent = Textboxx
    
    		TextboxLabel.Name = "TextboxLabel"
    		TextboxLabel.Parent = Textbox
    		TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		TextboxLabel.BackgroundTransparency = 1.000
    		TextboxLabel.Position = UDim2.new(0, 15, 0, 4)
    		TextboxLabel.Text = text
    		TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
    		TextboxLabel.Font = Enum.Font.GothamSemibold
    		TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
    		TextboxLabel.TextSize = 16.000
    		TextboxLabel.TextTransparency = 0
    		TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    		txtbtn.Name = "txtbtn"
    		txtbtn.Parent = Textbox
    		txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    		txtbtn.BackgroundTransparency = 1.000
    		txtbtn.Position = UDim2.new(0, 1, 0, 1)
    		txtbtn.Size = UDim2.new(0, 457, 0, 29)
    		txtbtn.Font = Enum.Font.SourceSans
    		txtbtn.Text = ""
    		txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    		txtbtn.TextSize = 14.000
    
    		RealTextbox.Name = "RealTextbox"
    		RealTextbox.Parent = Textbox
    		RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    		RealTextbox.BackgroundTransparency = 0
    		RealTextbox.Position = UDim2.new(0, 457, 0, 6)
    		RealTextbox.Size = UDim2.new(0, 100, 0, 24)
    		RealTextbox.Font = Enum.Font.GothamSemibold
    		RealTextbox.Text = ""
    		RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
    		RealTextbox.TextSize = 11.000
    		RealTextbox.TextTransparency = 0
    
    		RealTextbox.FocusLost:Connect(function()
    			callback(RealTextbox.Text)
    			if disappear then
    				RealTextbox.Text = ""
    			end
    		end)
    
    		UICorner.CornerRadius = UDim.new(0, 5)
    		UICorner.Parent = RealTextbox
    	end

            function main.AddToggle(options)
            	local text = options.Title or "Toggle"
				local Imgidicon = options.Picture or LogoUI
				local config = options.Default or false
				local callback = options.callback or function() end
            	
                config = config or false
        		local toggled = config
        		local Toggle = Instance.new("Frame")
        		local UICorner = Instance.new("UICorner")
        		local Button = Instance.new("TextButton")
        		local UICorner_2 = Instance.new("UICorner")
        		local Label = Instance.new("TextLabel")
        		local Toggl = Instance.new("Frame")
        		local ToggleIcon = Instance.new("TextLabel")
        		local UICorner_3 = Instance.new("UICorner")
        		local UICorner_4 = Instance.new("UICorner")
        		local UIStroke = Instance.new("UIStroke")
        		local imgLabelIcon = Instance.new("ImageLabel")
        
        
        		Toggle.Name = "Toggle"
        		Toggle.Parent = ScrollPage
        		Toggle.BackgroundColor3 = _G.Color
        		Toggle.BackgroundTransparency = 1.000
        		Toggle.Size = UDim2.new(0, 592, 0, 31)
        
        		Button.Name = "Button"
        		Button.Parent = Toggle
        		Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        		Button.Position = UDim2.new(0, 1, 0, 1)
        		Button.Size = UDim2.new(0, 592, 0, 29)
        		Button.AutoButtonColor = false
        		Button.Font = Enum.Font.SourceSans
        		Button.Text = ""
        		Button.TextColor3 = Color3.fromRGB(0, 0, 0)
        		Button.TextSize = 11.000
        
        		UICorner_2.CornerRadius = UDim.new(0, 5)
        		UICorner_2.Parent = Button
        		
        		local UIStroke96 = Instance.new("UIStroke")
        		UIStroke96.Thickness = 1.5
        		UIStroke96.Parent = Button
        		UIStroke96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        		UIStroke96.LineJoinMode = Enum.LineJoinMode.Round
        		UIStroke96.Color = _G.Color
        		UIStroke96.Transparency = 0.10
        
        		Label.Name = "Label"
        		Label.Parent = Toggle
        		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        		Label.BackgroundTransparency = 1.000
        		Label.Position = UDim2.new(0, 1, 0, 1)
        		Label.Size = UDim2.new(0, 592, 0, 29)
        		Label.Font = Enum.Font.GothamSemibold
        		Label.Text = text
        		Label.TextColor3 = Color3.fromRGB(225, 225, 225)
        		Label.TextSize = 15.000
        		
        		Toggl.Name = "Toggl"
        		Toggl.Parent = Toggle
        		Toggl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        		Toggl.Position = UDim2.new(0, 557, 0, 5)
        		--Toggl.BackgroundTransparency = 1.000
        		Toggl.Size = UDim2.new(0, 21, 0, 20)
        		
        		UIStroke.Thickness = 3.2
        		UIStroke.Parent = Toggl
        		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        		UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        		UIStroke.Color = Color3.fromRGB(255, 0, 0)
        		UIStroke.Transparency = 0.10
        		
        		ToggleIcon.Name = "ToggleIcon"
        		ToggleIcon.Parent = Toggle
        		ToggleIcon.BackgroundColor3 = UIStroke.Color
        		ToggleIcon.Position = UDim2.new(0, 557, 0, 8)
        		ToggleIcon.Size = UDim2.new(0, 20, 0, 20)
        		ToggleIcon.Font = Enum.Font.SourceSans
        		ToggleIcon.Text = _G.Settings.Toggle.ToggleFalse
        		ToggleIcon.TextColor3 = Color3.fromRGB(0, 0, 0)
        		ToggleIcon.BackgroundTransparency = 1.000
        		ToggleIcon.TextSize = 25.000
        		
                  imgLabelIcon.Name = "Icon"
                  imgLabelIcon.Parent = Toggle
                  imgLabelIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  imgLabelIcon.BackgroundTransparency = 1.000
                  imgLabelIcon.Position = UDim2.new(0, 10, 0, 5)
                  imgLabelIcon.Size = UDim2.new(0, 20, 0, 20)
                  imgLabelIcon.Image = "http://www.roblox.com/asset/?id="..Imgidicon
        
        		Button.MouseButton1Click:Connect(function()
        			if toggled == false then
        				toggled = true
        				ToggleIcon.Text = _G.Settings.Toggle.ToggleTrue
        				UIStroke.Color = _G.Color
        			else
        				toggled = false
        				ToggleIcon.Text = _G.Settings.Toggle.ToggleFalse
        				UIStroke.Color = Color3.fromRGB(255, 0, 0)
        			end
        			pcall(callback,toggled)
        		end)
        
        		if config == true then
        			toggled = true
        			ToggleIcon.Text = _G.Settings.Toggle.ToggleTrue
        			UIStroke.Color = _G.Color
        			pcall(callback,toggled)
        		end
        	end

            function main.AddLabel(options)
				local text = options.Title or "Label"
				local newcolor = options.ColorText or Color3.fromRGB(225, 225, 225)
				
                local Label = Instance.new("TextLabel")
                local PaddingLabel = Instance.new("UIPadding")
                local labell = {}
        
                Label.Name = "Label"
                Label.Parent = ScrollPage
                Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0, 260, 0, 20)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextColor3 = newcolor
                Label.TextSize = 16.000
                Label.Text = text
                Label.TextXAlignment = Enum.TextXAlignment.Left
    
                PaddingLabel.PaddingLeft = UDim.new(0,15)
                PaddingLabel.Parent = Label
                PaddingLabel.Name = "PaddingLabel"
        
                function labell.Refresh(newtext)
                    Label.Text = newtext
                end
				function labell.Color(newcolor)
                    Label.TextColor3 = newcolor or Color3.fromRGB(225, 225, 225)
                end

                return labell
            end
            return main
        end
		return uitab
		end
	return Ui
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
		
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id="..(LogoUI)
ImageButton.MouseButton1Down:connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton

local PP = library.Window({
	Name = "King",
	Logo = LogoUI,
	Keybind = Enum.KeyCode.RightControl,
})

local Tap = PP.AddTab({
	LogoTab = "7040391851"
})

local Page1 = Tap.AddPage()

Page1.PlayerInfo()

Page1.AddSeperator({
	Title = "credit ui edited",
})

Page1.AddLabel({
	Title = "LabelColorText By Playback X Hub",
	ColorText = _G.Color,
})

local LabelColor = Page1.AddLabel({
	Title = "Label Set Color By Playback X Hub",
})

LabelColor.Color(_G.Color)

local LabelRefresh = Page1.AddLabel({
	Title = "Label",
})

LabelRefresh.Refresh("Playback X Hub")

Page1.AddToggle({
	Title = "TogglePicture By Playback X Hub",
	Picture = "7040391851",
	Default = false,
	callback = function(value)
		print("Toggle")
	end,
})

Page1.AddToggle({
	Title = "Toggle Normal",
	Default = true,
	callback = function(value)
		print("Toggle")
	end,
})

Page1.AddTextbox({
	Title = "Textbox",
	Holder = "",
	callback = function(value)
		print(value)
	end,
})

Page1.AddSlider({
	Title = "Slider",
	Min = 1,
	Max = 100,
	Set = 35,
	callback = function(value)
		print(value)
	end,
})

Page1.AddLine()

Page1.AddButton({
	Title = "Button",
	callback = function(value)
		print("Button")
	end,
})

local Love = {"1"," 2"}

Page1.AddDropdown{Title = "Dropdown", Item = Love, Default = "2", callback = function(value)
	print("Dropdown")
end,}

Page1.AddButton({
	Title = "Button",
	callback = function(value)
		print("Button")
	end,
})

--- Tap 2


local Tap2 = PP.AddTab({
	LogoTab = "7040410130"
})

local Page2 = Tap2.AddPage()

Page2.AddSeperator({
	Title = "credit ui edited",
})

Page2.AddLabel({
	Title = "LabelColorText By Playback X Hub",
	ColorText = _G.Color,
})

local LabelColor = Page2.AddLabel({
	Title = "Label Set Color By Playback X Hub",
})

LabelColor.Color(_G.Color)

local LabelRefresh = Page2.AddLabel({
	Title = "Label",
})

LabelRefresh.Refresh("Playback X Hub")

Page2.AddToggle({
	Title = "TogglePicture By Playback X Hub",
	Picture = "7040391851",
	Default = false,
	callback = function(value)
		print("Toggle")
	end,
})

Page2.AddToggle({
	Title = "Toggle Normal",
	Default = true,
	callback = function(value)
		print("Toggle")
	end,
})

Page2.AddTextbox({
	Title = "Textbox",
	Holder = "",
	callback = function(value)
		print(value)
	end,
})

Page2.AddSlider({
	Title = "Slider",
	Min = 1,
	Max = 100,
	Set = 35,
	callback = function(value)
		print(value)
	end,
})

Page2.AddLine()

Page2.AddButton({
	Title = "Button",
	callback = function(value)
		print("Button")
	end,
})

local Love = {"1"," 2"}

Page2.AddDropdown{Title = "Dropdown", Item = Love, Default = "2", callback = function(value)
	print("Dropdown")
end,}

Page2.AddButton({
	Title = "Button",
	callback = function(value)
		print("Button")
	end,
})

