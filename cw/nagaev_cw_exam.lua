local n = tonumber(io.read())
if n <= 2 then
    print(1)
    print(1)
elseif n == 3 then
    print(2)
    print(1, 3)
elseif n == 4 then
    print(4)
    print(2, 4 ,1, 3)
elseif n >= 5 then
    print(n)
    for i = 1, n, 2 do
        print(i)
    end
    for i = 2, n, 2 do
        print(i)
    end
end
