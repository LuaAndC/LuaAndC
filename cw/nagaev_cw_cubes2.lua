local a = tonumber(io.read())
local b = tonumber(io.read())
local c = tonumber(io.read())

local function colored(i, j, k)
    local result = 0
    local function add_if(cond)
        if cond then
            result = result + 1
        end
    end
    add_if(i == 1)
    add_if(i == a)
    add_if(j == 1)
    add_if(j == b)
    -- add_if(k == 1) -- AxB
    add_if(k == c)
    return result
end

local cubes = {}
for i = 1, a do
    for j = 1, b do
        for k = 1, c do
            local count = colored(i, j, k)
            if cubes[count] == nil then
                cubes[count] = 0
            end
            cubes[count] = cubes[count] + 1
        end
    end
end

for count = 0, 6 do
    if cubes[count] ~= nil then
        print(count, cubes[count])
    end
end
