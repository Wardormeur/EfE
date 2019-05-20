require "map"
require "scene"

app = {}
function love.load()
  local width, height, flags = love.window.getMode();
  app.scenes = {}
  math.randomseed(os.time())
  for i=1, 21 do
    app.scenes[i] = Scene:create(height, width, 'osef' )
  end
  app.map = Map:create(app.scenes)
end

function love.update(dt)
end

function love.draw()
  app.map:draw()
end
