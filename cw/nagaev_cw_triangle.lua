local sides = {
    tonumber(io.read()),
    tonumber(io.read()),
    tonumber(io.read()),
}

table.sort(sides)

local a, b, c = unpack(sides)

if c == a + b then
    print('degenerate')
elseif c^2 > a^2 + b^2 then
    print('obtuse')
elseif c^2 == a^2 + b^2 then
    print('right')
else
    print('acute')
end
