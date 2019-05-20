Path = {}
Path.__index = Path 

function Path:create(beginning, destination)
   local path = {}
   setmetatable(path, Path)
   path.beginning = beginning
   path.destination = destination 
   return path 
end
function Path:draw()
  love.graphics.line(self.beginning.points.x, self.beginning.points.y, self.destination.points.x, self.destination.points.y)
end
