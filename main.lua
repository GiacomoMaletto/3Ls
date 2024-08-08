package.cpath = string.format("%s;%s", package.cpath, "/Users/gmaletto/Library/Application Support/LOVE/cimgui.dylib")
local ffi = require "ffi"
local imgui = require "cimgui"

local function readAll(file)
    local f = assert(io.open(file, "r"))
    local content = f:read("*all")
    f:close()
    return content
end

local quadric_shader = love.graphics.newShader(readAll("quadric.glsl"))
local display_shader = love.graphics.newShader(readAll("display.glsl"))

local V, M = unpack(require "vector")

love.graphics.setDefaultFilter("nearest", "nearest")
love.graphics.setBlendMode("replace", "premultiplied")
love.mouse.setRelativeMode(true)

local sw, sh = love.graphics.getDimensions()

local camera = {}
camera.xyz = { 2, 2, 2 }
camera.phi = math.rad(180 + 45)
camera.theta = math.rad(120)
camera.speed = 1
camera.fov = math.rad(120)
camera.look = false

function camera.dir()
    return V.spherical(1, camera.theta, camera.phi)
end

function camera.right()
    return V.scale(math.tan(camera.fov / 2), V.unit(V.cross(camera.dir(), { 0, 0, 1 })))
end

function camera.up()
    return V.scale(sh / sw, V.cross(camera.right(), camera.dir()))
end

local white_canvas = love.graphics.newCanvas(sw, sh, { format = "rgba32f" })
love.graphics.setCanvas(white)
love.graphics.clear(1, 1, 1)
love.graphics.setCanvas()

local quadric_canvas = {}
quadric_canvas[1] = love.graphics.newCanvas(sw, sh, { format = "rgba32f" })
quadric_canvas[2] = love.graphics.newCanvas(sw, sh, { format = "rgba32f" })
quadric_canvas[3] = love.graphics.newCanvas(sw, sh, { format = "rgba32f" })

local A = {}
A[1] = { { 2, 0, 0, 0 }, { 0, 0.5, 0, 0 }, { 0, 0, 0.5, 0 }, { 0, 0, 0, -1 } }
A[2] = { { 0.5, 0, 0, 0 }, { 0, 2, 0, 0 }, { 0, 0, 0.5, 0 }, { 0, 0, 0, -1 } }
A[3] = { { 0.5, 0, 0, 0 }, { 0, 0.5, 0, 0 }, { 0, 0, 2, 0 }, { 0, 0, 0, -1 } }

local look_mode = true
love.mouse.setRelativeMode(true)

love.load = function()
    imgui.love.Init()
end

-- 1: 001
-- 2: 010
-- 3: 011
-- 4: 100
-- 5: 101
-- 6: 110
-- 7: 111
local flag_vars = {}
for i = 1, 7 do
    flag_vars[i] = ffi.new("bool[1]")
    flag_vars[i][0] = true
end

local dt = 1 / 60
local t = 0

local Sph = {
    { 1, 0, 0, 0 },
    { 0, 1, 0, 0 },
    { 0, 0, 1, 0 },
    { 0, 0, 0, -1 }
}

love.update = function(Dt)
    dt = Dt
    t = t + dt

    imgui.love.Update(dt)
    imgui.NewFrame()

    local pos = imgui.GetCursorScreenPos()
    local pos1 = imgui.ImVec2_Float(pos.x + 100, pos.y + 0)
    local pos2 = imgui.ImVec2_Float(pos.x + 14, pos.y + 150)
    local pos3 = imgui.ImVec2_Float(pos.x + 186, pos.y + 150)
    local pos12 = imgui.ImVec2_Float(pos.x + 57, pos.y + 75)
    local pos13 = imgui.ImVec2_Float(pos.x + 143, pos.y + 75)
    local pos23 = imgui.ImVec2_Float(pos.x + 100, pos.y + 150)
    local pos123 = imgui.ImVec2_Float(pos.x + 100, pos.y + 100)

    imgui.SetCursorScreenPos(pos1)
    imgui.Checkbox("1", flag_vars[1])
    imgui.SetCursorScreenPos(pos2)
    imgui.Checkbox("2", flag_vars[2])
    imgui.SetCursorScreenPos(pos3)
    imgui.Checkbox("3", flag_vars[4])
    imgui.SetCursorScreenPos(pos12)
    imgui.Checkbox("12", flag_vars[3])
    imgui.SetCursorScreenPos(pos13)
    imgui.Checkbox("13", flag_vars[5])
    imgui.SetCursorScreenPos(pos23)
    imgui.Checkbox("23", flag_vars[6])
    imgui.SetCursorScreenPos(pos123)
    imgui.Checkbox("123", flag_vars[7])

    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    if love.keyboard.isDown("w") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * camera.speed, camera.dir()))
    end
    if love.keyboard.isDown("s") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * camera.speed, camera.dir()))
    end
    if love.keyboard.isDown("d") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * camera.speed, camera.right()))
    end
    if love.keyboard.isDown("a") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * camera.speed, camera.right()))
    end
    if love.keyboard.isDown("q") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * camera.speed, camera.up()))
    end
    if love.keyboard.isDown("z") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * camera.speed, camera.up()))
    end

    quadric_shader:send("pos", camera.xyz)
    quadric_shader:send("dir", camera.dir())
    quadric_shader:send("x_dir", camera.right())
    quadric_shader:send("y_dir", camera.up())
end

love.mousemoved = function(x, y, dx, dy, ...)
    if look_mode then
        camera.phi = camera.phi - dx / 200
        local new_theta = camera.theta + dy / 200
        if 0 <= new_theta and new_theta <= math.rad(180) then camera.theta = new_theta end
    else
        imgui.love.MouseMoved(x, y)
        if not imgui.love.GetWantCaptureMouse() then
            -- your code here
        end
    end
end

love.mousepressed = function(x, y, button, ...)
    imgui.love.MousePressed(button)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here
    end
end

love.mousereleased = function(x, y, button, ...)
    imgui.love.MouseReleased(button)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here
    end
end

love.wheelmoved = function(x, y)
    imgui.love.WheelMoved(x, y)
    if not imgui.love.GetWantCaptureMouse() then
        -- your code here
    end
end

love.keypressed = function(key, ...)
    if key == "space" then
        look_mode = not look_mode
        love.mouse.setRelativeMode(look_mode)
    end

    imgui.love.KeyPressed(key)
    if not imgui.love.GetWantCaptureKeyboard() then
        -- your code here
    end
end

love.keyreleased = function(key, ...)
    imgui.love.KeyReleased(key)
    if not imgui.love.GetWantCaptureKeyboard() then
        -- your code here
    end
end

love.textinput = function(t)
    imgui.love.TextInput(t)
    if imgui.love.GetWantCaptureKeyboard() then
        -- your code here
    end
end

love.quit = function()
    return imgui.love.Shutdown()
end

love.draw = function()
    -- love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.setShader(quadric_shader)
    for i = 1, 3 do
        love.graphics.setCanvas(quadric_canvas[i])
        quadric_shader:send("A", A[i])
        love.graphics.draw(white_canvas)
    end

    -- love.graphics.setShader(test_shader)
    -- love.graphics.setCanvas()
    -- love.graphics.draw(quadric_canvas[1])

    -- love.graphics.setBlendMode("alpha", "premultiplied")
    -- love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.setShader(display_shader)
    love.graphics.setCanvas()
    display_shader:send("t_image1", quadric_canvas[1])
    display_shader:send("t_image2", quadric_canvas[2])
    display_shader:send("t_image3", quadric_canvas[3])
    local b = {}
    for i = 1, 7 do
        b[i] = flag_vars[i][0]
    end
    display_shader:send("flag", false, unpack(b))
    love.graphics.draw(white_canvas)

    love.graphics.setShader()

    -- imgui.ShowDemoWindow()
    imgui.Render()
    imgui.love.RenderDrawLists()
end
