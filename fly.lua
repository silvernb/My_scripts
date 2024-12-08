-- Fly Script (Simple Example)

-- Entity to fly (replace with actual entity ID)
local entityID = 12345

-- Target position (replace with desired coordinates)
local targetX = 100
local targetY = 50
local targetZ = 20

-- Movement speed (adjust as needed)
local speed = 10

-- Function to move the entity towards the target
function moveEntity()
  -- Get the entity's current position
  local currentX, currentY, currentZ = EntityGetTransform(entityID)

  -- Calculate distance to target
  local distanceX = targetX - currentX
  local distanceY = targetY - currentY
  local distanceZ = targetZ - currentZ

  -- Normalize the direction vector
  local length = math.sqrt(distanceX * distanceX + distanceY * distanceY + distanceZ * distanceZ)
  if length > 0 then
    distanceX = distanceX / length
    distanceY = distanceY / length
    distanceZ = distanceZ / length
  end

  -- Calculate movement vector
  local moveX = distanceX * speed
  local moveY = distanceY * speed
  local moveZ = distanceZ * speed

  -- Move the entity
  EntitySetTransform(entityID, currentX + moveX, currentY + moveY, currentZ + moveZ)
end

-- Schedule the movement function to run repeatedly
TimerStart("flyTimer", 0.1, true, moveEntity) 
