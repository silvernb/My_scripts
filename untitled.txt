-- Full Fly Script with UI Button

-- Create ScreenGui and add it to PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Fly Button and set its properties
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 50)  -- Size of the button (200px width, 50px height)
flyButton.Position = UDim2.new(0, 0, 0, 96)  -- Position at top-left with 96px (1 inch) offset down
flyButton.Text = "Fly"
flyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green color for the button
flyButton.Parent = screenGui

-- Variables to manage flying
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local flying = false
local bodyVelocity

-- Function to start flying
local function startFlying()
    if not flying then
        flying = true
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Adjust this value for vertical speed
        bodyVelocity.Parent = humanoidRootPart
        flyButton.Text = "Stop Flying"  -- Change button text when flying
    end
end

-- Function to stop flying
local function stopFlying()
    if flying then
        flying = false
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
        flyButton.Text = "Fly"  -- Change button text when not flying
    end
end

-- Button click event to toggle flight on and off
flyButton.MouseButton1Click:Connect(function()
    if flying then
        stopFlying()  -- Stop flying when the button is clicked
    else
        startFlying()  -- Start flying when the button is clicked
    end
end)

-- Ensure the character exists and load again if it respawns
player.CharacterAdded:Connect(function(char)
    character = char
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)
