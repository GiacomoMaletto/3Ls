-- local extension = jit.os == "Windows" and "dll" or jit.os == "Linux" and "so" or jit.os == "OSX" and "dylib"
-- package.cpath = string.format("%s;%s", package.cpath, love.filesystem.getWorkingDirectory() .. "/cimgui." .. extension)
-- package.cpath = string.format("%s;%s", package.cpath, "/Users/gmaletto/Library/Application Support/LOVE/cimgui.dylib")

local lib_path = love.filesystem.getSaveDirectory() .. "/libraries"
local extension = jit.os == "Windows" and "dll" or jit.os == "Linux" and "so" or jit.os == "OSX" and "dylib"
package.cpath = string.format("%s;%s/?.%s", package.cpath, lib_path, extension)

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
local graph_shader = love.graphics.newShader(readAll("graph.glsl"))

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
camera.run_speed = 10
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

local A_var = {}
for i = 1, 3 do
    A_var[i] = {}
    for j = 1, 4 do
        A_var[i][j] = {}
        for k = 1, 4 do
            A_var[i][j][k] = ffi.new("float[1]")
            A_var[i][j][k][0] = A[i][j][k]
        end
    end
end

local graph_width = 600
local graph_height = 400
local graph_canvas = love.graphics.newCanvas(graph_width, graph_height, { format = "rgba32f" })
graph_canvas:setFilter("linear", "linear")
local graph_center = { 0, 0 }
local graph_zoom = 1
local graph_speed = 1
graph_zoom_speed = 2

local file_names = love.filesystem.getDirectoryItems("configurations")
local file_vars = {}
local selected_file = 1

local function load_files()
    file_vars = {}
    file_names = love.filesystem.getDirectoryItems("configurations")
    for k, file in ipairs(file_names) do
        file_vars[k] = ffi.new("char[32]")
        ffi.copy(file_vars[k], file)
    end
end

load_files()

local save_name_var = ffi.new("char[32]")
ffi.copy(save_name_var, "new configuration")

-- for k, file in ipairs(files) do
--     -- files_vars[k][0] = file
--     ffi.copy(files_vars[k], file)
-- end
-- local index_var = ffi.new("int")
-- index_var[0] = 1

love.update = function(Dt)
    dt = Dt
    t = t + dt


    imgui.love.Update(dt)

    imgui.NewFrame()
    imgui.Begin("Selected")

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

    imgui.End()

    imgui.Begin("Matrices")

    imgui.SeparatorText("A1")

    imgui.PushItemWidth(50)
    imgui.DragFloat("##A111", A_var[1][1][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A112", A_var[1][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A113", A_var[1][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A114", A_var[1][4][1], 0.01)

    imgui.DragFloat("##A121", A_var[1][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A122", A_var[1][2][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A123", A_var[1][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A124", A_var[1][4][2], 0.01)

    imgui.DragFloat("##A131", A_var[1][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A132", A_var[1][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A133", A_var[1][3][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A134", A_var[1][4][3], 0.01)

    imgui.DragFloat("##A141", A_var[1][4][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A142", A_var[1][4][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A143", A_var[1][4][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A144", A_var[1][4][4], 0.01)

    imgui.SeparatorText("A2")

    imgui.PushItemWidth(50)
    imgui.DragFloat("##A211", A_var[2][1][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A212", A_var[2][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A213", A_var[2][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A214", A_var[2][4][1], 0.01)

    imgui.DragFloat("##A221", A_var[2][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A222", A_var[2][2][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A223", A_var[2][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A224", A_var[2][4][2], 0.01)

    imgui.DragFloat("##A231", A_var[2][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A232", A_var[2][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A233", A_var[2][3][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A234", A_var[2][4][3], 0.01)

    imgui.DragFloat("##A241", A_var[2][4][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A242", A_var[2][4][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A243", A_var[2][4][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A244", A_var[2][4][4], 0.01)

    imgui.SeparatorText("A3")

    imgui.PushItemWidth(50)
    imgui.DragFloat("##A311", A_var[3][1][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A312", A_var[3][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A313", A_var[3][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A314", A_var[3][4][1], 0.01)

    imgui.DragFloat("##A321", A_var[3][2][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A322", A_var[3][2][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A323", A_var[3][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A324", A_var[3][4][2], 0.01)

    imgui.DragFloat("##A331", A_var[3][3][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A332", A_var[3][3][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A333", A_var[3][3][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A334", A_var[3][4][3], 0.01)

    imgui.DragFloat("##A341", A_var[3][4][1], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A342", A_var[3][4][2], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A343", A_var[3][4][3], 0.01)
    imgui.SameLine()
    imgui.DragFloat("##A344", A_var[3][4][4], 0.01)

    -- imgui.InputFloat4("", B_var[1][1])
    -- imgui.InputFloat4("", B_var[1][2])
    -- imgui.InputFloat4("", B_var[1][3])
    -- imgui.InputFloat4("", B_var[1][4])
    -- imgui.InputFloat("miao", A_var[1][1][1], 0.01, 1.0, "%.3f")

    -- imgui.SeparatorText("A2")

    -- imgui.InputFloat4("", B_var[2][1])
    -- imgui.InputFloat4("", B_var[2][2])
    -- imgui.InputFloat4("", B_var[2][3])
    -- imgui.InputFloat4("", B_var[2][4])

    -- imgui.SeparatorText("A3")

    -- imgui.DragFloat4("", B_var[3][1], 0.005)
    -- imgui.InputFloat4("", B_var[3][1])
    -- imgui.InputFloat4("", B_var[3][2])
    -- imgui.InputFloat4("", B_var[3][3])
    -- imgui.InputFloat4("", B_var[3][4])

    imgui.End()

    imgui.Begin("configs")

    imgui.SeparatorText("Save")

    if imgui.Button("save") then
        local file = io.open("configurations/" .. ffi.string(save_name_var) .. ".txt", "w")
        for i = 1, 3 do
            for j = 1, 4 do
                for k = 1, 4 do
                    file:write(string.format("%.6f", A_var[i][j][k][0]) .. "\n")
                end
            end
        end
        file:close()
        load_files()
    end

    imgui.InputText(".txt", save_name_var, 32)

    imgui.SeparatorText("Load")

    if imgui.Button("load") then
        local file = io.open("configurations/" .. file_names[selected_file], "r")
        for i = 1, 3 do
            for j = 1, 4 do
                for k = 1, 4 do
                    A_var[i][j][k][0] = tonumber(file:read("*l"))
                end
            end
        end
        file:close()
    end

    imgui.SameLine()

    if imgui.Button("refresh") then
        load_files()
    end

    imgui.SameLine()

    if imgui.Button("delete") then
        os.remove("configurations/" .. file_names[selected_file])
        load_files()
    end

    -- -- imgui.TreeNode("miao")
    imgui.BeginListBox("##asdads")

    for k, fv in ipairs(file_vars) do
        if imgui.Selectable_Bool(fv, k == selected_file) then
            selected_file = k
        end
    end

    imgui.EndListBox()

    imgui.End()

    -- imgui.Begin("configs")

    -- imgui.BeginListBox("asd")

    -- for n = 1, #files do
    --     local is_selected = (n == index_var[0])
    --     if imgui.Selectable(items_var[n], is_selected) then index_var[0] = n end
    --     if is_selected then imgui.SetItemDefaultFocus() end
    -- end

    -- imgui.EndListBox()

    -- imgui.End()

    for i = 1, 3 do
        for j = 1, 4 do
            for k = 1, j do
                A[i][j][k] = A_var[i][j][k][0]
            end
            for k = j + 1, 4 do
                A[i][j][k] = A_var[i][k][j][0]
            end
        end
    end

    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    local s = camera.speed
    if love.keyboard.isDown("lshift") then
        s = camera.run_speed
    end

    if love.keyboard.isDown("w") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * s, camera.dir()))
    end
    if love.keyboard.isDown("s") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * s, camera.dir()))
    end
    if love.keyboard.isDown("d") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * s, camera.right()))
    end
    if love.keyboard.isDown("a") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * s, camera.right()))
    end
    if love.keyboard.isDown("q") then
        camera.xyz = V.add(camera.xyz, V.mul(dt * s, camera.up()))
    end
    if love.keyboard.isDown("z") then
        camera.xyz = V.add(camera.xyz, V.mul(-dt * s, camera.up()))
    end

    local h, v = 0, 0

    if love.keyboard.isDown("left") then h = -1 end
    if love.keyboard.isDown("right") then h = 1 end
    if love.keyboard.isDown("up") then v = 1 end
    if love.keyboard.isDown("down") then v = -1 end

    graph_center[1] = graph_center[1] + h * graph_speed / graph_zoom * dt
    if love.keyboard.isDown("lshift") then
        graph_zoom = graph_zoom * math.pow(graph_zoom_speed, v * dt)
    else
        graph_center[2] = graph_center[2] + v * graph_speed / graph_zoom * dt
    end

    quadric_shader:send("pos", camera.xyz)
    quadric_shader:send("dir", camera.dir())
    quadric_shader:send("x_dir", camera.right())
    quadric_shader:send("y_dir", camera.up())

    display_shader:send("pos", camera.xyz)
    display_shader:send("dir", camera.dir())
    display_shader:send("x_dir", camera.right())
    display_shader:send("y_dir", camera.up())
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
    if not look_mode then
        imgui.love.MousePressed(button)
        if not imgui.love.GetWantCaptureMouse() then
            -- your code here
        end
    end
end

love.mousereleased = function(x, y, button, ...)
    if not look_mode then
        imgui.love.MouseReleased(button)
        if not imgui.love.GetWantCaptureMouse() then
            -- your code here
        end
    end
end

love.wheelmoved = function(x, y)
    if not look_mode then
        imgui.love.WheelMoved(x, y)
        if not imgui.love.GetWantCaptureMouse() then
            -- your code here
        end
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
    if not look_mode then
        imgui.love.TextInput(t)
        if imgui.love.GetWantCaptureKeyboard() then
            -- your code here
        end
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
    display_shader:send("t_image", unpack(quadric_canvas))
    local b = {}
    for i = 1, 7 do
        b[i] = flag_vars[i][0]
    end
    display_shader:send("selected_flags", false, unpack(b))
    display_shader:send("A", unpack(A))
    love.graphics.draw(white_canvas)

    love.graphics.setShader(graph_shader)
    love.graphics.setCanvas(graph_canvas)
    graph_shader:send("center", graph_center)
    graph_shader:send("zoom", graph_zoom)
    graph_shader:send("A", unpack(A))
    graph_shader:send("wh", { graph_width, graph_height })
    graph_shader:send("selected_flags", false, unpack(b))

    love.graphics.draw(white_canvas, 0, 0, 0, graph_width / sw, graph_height / sh)

    love.graphics.setShader()
    love.graphics.setCanvas()
    love.graphics.draw(graph_canvas, 0, 0, 0, 1, 1)

    -- imgui.ShowDemoWindow()
    imgui.Render()
    imgui.love.RenderDrawLists()
end
