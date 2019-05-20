require "path"
require "scene"
local array = require "array"

Map = {}
Map.__index = Map

function Map:create(scenes)
   local map = {}
   setmetatable(map, Map)
   map.scenes = scenes
   map.paths = {}
   for i = 1, #scenes do
     local minDist = 999999999999999999;  --TODO : window diagonal
     local closest;
     next_scenes = array.slice(scenes, i +1)
     print('next scenes?', #next_scenes)
     for j = 1, #next_scenes do
       local dist = math.sqrt(
         math.pow(scenes[i].points.x - next_scenes[j].points.x, 2) +
         math.pow(scenes[i].points.y - next_scenes[j].points.y, 2)
       )
       print(i, j)
       print(dist, minDist)
       if dist < minDist then
         minDist = dist;
         closest = next_scenes[j]
         print("temp closest?", i, closest)
       end
       print('closest is stil here?', closest)
     end
     print('closest is stil here2', closest)
     if i ~= #scenes then
       print('clostest', i, closest)
       map.paths[i] = Path:create(scenes[i], closest)
     end
   end
   return map
end
function Map:draw()
  for i = 1, #self.scenes do
    self.scenes[i]:draw()
  end
  for i = 1, #self.paths do
    self.paths[i]:draw()
  end
end
