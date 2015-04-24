local function solveStaircase(price)
    local ans = {price[1], price[2]}
    for i = 3, #price do
        ans[i] = math.min(ans[i-1], ans[i-2]) + price[i]
    end
    return ans[#price]
end

local n = tonumber(io.read('*n'))
local price = {}
for i = 1, n do
    table.insert(price, tonumber(io.read('*n')))
end
local result = solveStaircase(price)
print(result)
