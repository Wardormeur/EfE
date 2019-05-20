Scene = {}
Scene.__index = Scene 

function Scene:create(height, width, type)
   local scene = {}             -- our new object
   local x = math.random(0, width)
   local y = math.random(0, height)
   setmetatable(scene, Scene)  -- make Account handle lookup
   scene.points = {}
   scene.points.x = x
   scene.points.y = y
   return scene 
end
function Scene:draw()
  love.graphics.circle("fill", self.points.x, self.points.y, 5)
end
