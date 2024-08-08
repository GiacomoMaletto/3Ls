local V = {}

function V.length2(v)
    local result = 0
    for i = 1, #v do
        result = result + v[i] * v[i]
    end
    return result
end

function V.length(v)
    return math.sqrt(V.length2(v))
end

function V.normalize(v)
    local l = V.length(v)
    local result = {}
    for i = 1, #v do
        result[i] = v[i] / l
    end
    return result
end

function V.scale(a, v)
    local result = {}
    for i = 1, #v do
        result[i] = a * v[i]
    end
    return result
end

function V.cross(v, w)
    return { v[2] * w[3] - v[3] * w[2], v[3] * w[1] - v[1] * w[3], v[1] * w[2] - v[2] * w[1] }
end

function V.to_string(v)
    local str = "("
    for i = 1, #v - 1 do
        str = str .. tostring(v[i]) .. ", "
    end
    str = str .. tostring(v[#v]) .. ")"
    return str
end

function V.add(v1, v2)
    local result = {}
    for i = 1, #v1 do
        result[i] = v1[i] + v2[i]
    end
    return result
end

function V.sub(v1, v2)
    local result = {}
    for i = 1, #v1 do
        result[i] = v1[i] - v2[i]
    end
    return result
end

local function atan2(y, x)
    if x > 0 then
        return math.atan(y / x)
    elseif x < 0 then
        if y >= 0 then
            return math.atan(y / x) + math.pi
        else
            return math.atan(y / x) - math.pi
        end
    else
        if y > 0 then
            return math.pi / 2
        elseif y < 0 then
            return -math.pi / 2
        else
            error()
        end
    end
end

function V.angle(v)
    if v[1] == 0 then
        if v[2] > 0 then return math.pi / 2 end
        if v[2] < 0 then return -math.pi / 2 end
        if v[2] == 0 then error() end
    end
    return atan2(v[2], v[1])
end

function V.dist(v1, v2)
    return V.length(V.sub(v1, v2))
end

function V.mul(c, v)
    local result = {}
    for i = 1, #v do
        result[i] = c * v[i]
    end
    return result
end

function V.dot(v1, v2)
    local result = 0
    for i = 1, #v1 do
        result = result + v1[i] * v2[i]
    end
    return result
end

function V.cross(v1, v2)
    local result = {}
    result[1] = v1[2] * v2[3] - v1[3] * v2[2]
    result[2] = v1[3] * v2[1] - v1[1] * v2[3]
    result[3] = v1[1] * v2[2] - v1[2] * v2[1]
    return result
end

function V.nul(l)
    local result = {}
    for i = 1, l do
        result[i] = 0
    end
    return result
end

function V.unit(v)
    if V.length(v) == 0 then
        error()
    else
        return V.mul(1 / V.length(v), v)
    end
end

function V.projection(v1, v2)
    if V.length2(v2) == 0 then
        return V.nul(#v2)
    else
        return V.mul(V.dot(v1, v2) / V.length2(v2), v2)
    end
end

function V.plane_projection(v1, v2)
    return V.sub(v1, V.projection(v1, v2))
end

function V.rotate2D(v, a)
    local result = {}
    result[1] = v[1] * math.cos(a) - v[2] * math.sin(a)
    result[2] = v[1] * math.sin(a) + v[2] * math.cos(a)
    return result
end

function V.spherical(r, theta, phi)
    --https://en.wikipedia.org/wiki/Spherical_coordinate_system
    --r in [0, +infinity)
    --theta in [0, pi]
    --phi in [0, 2pi)
    local result = {}
    result[1] = r * math.sin(theta) * math.cos(phi)
    result[2] = r * math.sin(theta) * math.sin(phi)
    result[3] = r * math.cos(theta)
    return result
end

function V.print(v)
    local str = "{"
    for i = 1, #v - 1 do
        str = str .. v[i] .. ", "
    end
    str = str .. v[#v] .. "}"
    print(str)
end

function V.copy(v)
    local result = {}
    for i = 1, #v do
        result[i] = v[i]
    end
    return result
end

local M = {}

function M.scalar(a, m)
    local result = {}
    local I = #m
    local J = #m[1]
    for i = 1, I do
        result[i] = {}
        for j = 1, J do
            result[i][j] = a * m[i][j]
        end
    end
    return result
end

function M.add(m1, m2)
    local result = {}
    local I = #m1
    local J = #m1[1]
    for i = 1, I do
        result[i] = {}
        for j = 1, J do
            result[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return result
end

function M.mulv(m, v)
    local result = {}
    for i = 1, #m do
        result[i] = V.dot(m[i], v)
    end
    return result
end

function M.mulm(m1, m2)
    local result = {}
    local I = #m1
    local J = #m2[1]
    local K = #m2
    for i = 1, I do
        result[i] = {}
        for j = 1, J do
            result[i][j] = 0
            for k = 1, K do
                result[i][j] = result[i][j] + m1[i][k] * m2[k][j]
            end
        end
    end
    return result
end

function M.transpose(m)
    local result = {}
    local J = #m
    local I = #m[1]
    for i = 1, I do
        result[i] = {}
        for j = 1, J do
            result[i][j] = m[j][i]
        end
    end
    return result
end

function M.perspective(fovy, aspect, zNear, zFar)
    local f = 1 / math.tan(fovy / 2)
    local result = {
        { f / aspect, 0, 0,                               0 },
        { 0,          f, 0,                               0 },
        { 0,          0, (zFar + zNear) / (zNear - zFar), (2 * zFar * zNear) / (zNear - zFar) },
        { 0,          0, -1,                              0 }
    }
    return result
end

function M.ortho(left, right, bottom, top, nearVal, farVal)
    local tx = -(right + left) / (right - left)
    local ty = -(top + bottom) / (top - bottom)
    local tz = -(farVal + nearVal) / (farVal - nearVal)
    local dx = 2 / (right - left)
    local dy = 2 / (top - bottom)
    local dz = -2 / (farVal - nearVal)
    local result = {
        { dx, 0,  0,  tx },
        { 0,  dy, 0,  ty },
        { 0,  0,  dz, tz },
        { 0,  0,  0,  1 }
    }
    return result
end

function M.lookAt(eye, center, up)
    local F = V.sub(center, eye)
    local f = V.unit(F)
    local up2 = V.unit(up)
    local s = V.cross(f, up2)
    local u = V.cross(V.unit(s), f)
    local m = {
        { s[1],  s[2],  s[3],  0 },
        { u[1],  u[2],  u[3],  0 },
        { -f[1], -f[2], -f[3], 0 },
        { 0,     0,     0,     1 }
    }
    local t = {
        { 1, 0, 0, -eye[1] },
        { 0, 1, 0, -eye[2] },
        { 0, 0, 1, -eye[3] },
        { 0, 0, 0, 1 }
    }
    local result = M.mulm(m, t)
    return result
end

-- https://en.wikipedia.org/wiki/Euler_angles x_alpha z_beta x_gamma
function M.euler(alpha, beta, gamma)
    local ca = math.cos(alpha)
    local sa = math.sin(alpha)
    local cb = math.cos(beta)
    local sb = math.sin(beta)
    local cg = math.cos(gamma)
    local sg = math.sin(gamma)
    local result = {
        { cb,       ca * sb,                 sa * sb,                0 },
        { -cg * sb, ca * cb * cg - sa * sg,  ca * sg + cb * cg * sa, 0 },
        { sb * sg,  -cg * sa - ca * cb * sg, ca * cg - cb * sa * sg, 0 },
        { 0,        0,                       0,                      1 }
    }
    return result
end

function M.translation(X, Y, Z)
    local result = {
        { 1, 0, 0, -X },
        { 0, 1, 0, -Y },
        { 0, 0, 1, -Z },
        { 0, 0, 0, 1 }
    }
    return result
end

function M.scale(X, Y, Z)
    local result = {
        { X, 0, 0, 0 },
        { 0, Y, 0, 0 },
        { 0, 0, Z, 0 },
        { 0, 0, 0, 1 }
    }
    return result
end

function M.rot_x(a)
    local ca = math.cos(a)
    local sa = math.sin(a)
    local result = {
        { 1, 0,  0,   0 },
        { 0, ca, -sa, 0 },
        { 0, sa, ca,  0 },
        { 0, 0,  0,   1 }
    }
    return result
end

function M.rot_y(a)
    local ca = math.cos(a)
    local sa = math.sin(a)
    local result = {
        { ca,  0, sa, 0 },
        { 0,   1, 0,  0 },
        { -sa, 0, ca, 0 },
        { 0,   0, 0,  1 }
    }
    return result
end

function M.rot_z(a)
    local ca = math.cos(a)
    local sa = math.sin(a)
    local result = {
        { ca, -sa, 0, 0 },
        { sa, ca,  0, 0 },
        { 0,  0,   1, 0 },
        { 0,  0,   0, 1 }
    }
    return result
end

function M.id(n)
    local result = {}
    for i = 1, n do
        result[i] = {}
        for j = 1, n do
            if i == j then
                result[i][j] = 1
            else
                result[i][j] = 0
            end
        end
    end
    return result
end

function M.print(m)
    local str = "{"
    local I = #m
    local J = #m[1]
    for i = 1, I do
        str = str .. "{"
        for j = 1, J do
            str = str .. m[i][j] .. ", "
        end
        str = str:sub(1, -3)
        str = str .. "},\n"
    end
    str = str:sub(1, -3)
    str = str .. "}"
    print(str)
end

return { V, M }
