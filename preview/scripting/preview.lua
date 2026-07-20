--==============================================================================
-- Esron Dark - Lua Preview
-- Este arquivo existe apenas para testar a coloração do tema.
--==============================================================================

--==============================================================================
-- Constants
--==============================================================================

local VERSION = "1.0.0"
local AUTHOR = "Esron"
local PI = 3.1415926535

--==============================================================================
-- Variables
--==============================================================================

local username = "Esron"
local age = 25
local enabled = true
local score = 99.5
local nothing = nil

--==============================================================================
-- Multiple Assignment
--==============================================================================

local x, y, z = 10, 20, 30

--==============================================================================
-- Tables
--==============================================================================

local config = {
    theme = "Esron Dark",
    version = VERSION,
    author = AUTHOR,
    enabled = true,
    colors = {
        keyword = "#7A9FE6",
        type = "#D16D6D",
        ["function"] = "#5A7FBF",
        builtin = "#88C0D0",
        string = "#A3BE8C",
        number = "#D08770"
    }
}

--==============================================================================
-- Arrays
--==============================================================================

local languages = {
    "Lua",
    "Python",
    "Rust",
    "Go",
    "C++"
}

--==============================================================================
-- Functions
--==============================================================================

local function add(a, b)
    return a + b
end

local function greet(name)
    print("Hello " .. name)
end

function config:show()
    print(self.theme)
end

--==============================================================================
-- Anonymous Function
--==============================================================================

local multiply = function(a, b)
    return a * b
end

--==============================================================================
-- Closures
--==============================================================================

local function counter()

    local value = 0

    return function()
        value = value + 1
        return value
    end
end

local nextValue = counter()

--==============================================================================
-- If
--==============================================================================

if enabled then

    print("Enabled")

elseif age > 18 then

    print("Adult")

else

    print("Disabled")

end

--==============================================================================
-- Loops
--==============================================================================

for i = 1, 5 do
    print(i)
end

for index, language in ipairs(languages) do
    print(index, language)
end

for key, value in pairs(config) do
    print(key, value)
end

local count = 0

while count < 5 do
    count = count + 1
end

repeat
    count = count - 1
until count == 0

--==============================================================================
-- Operators
--==============================================================================

local sum = 10 + 5
local sub = 10 - 5
local mul = 10 * 5
local div = 10 / 5
local mod = 10 % 3
local pow = 2 ^ 8
local floor = 10 // 3

--==============================================================================
-- Logical
--==============================================================================

local result = enabled and true
local fallback = nothing or "Default"

--==============================================================================
-- Strings
--==============================================================================

local single = "Hello"

local multiline = [[
Line One
Line Two
Line Three
]]

local formatted = string.format(
    "%s v%s",
    config.theme,
    VERSION
)

--==============================================================================
-- Builtin Functions
--==============================================================================

print(username)

type(username)

tostring(age)

tonumber("123")

pairs(config)

ipairs(languages)

next(config)

assert(enabled)

pcall(function()
    error("Example")
end)

--==============================================================================
-- Metatable
--==============================================================================

local Vector = {}

Vector.__index = Vector

function Vector:new(x, y)

    return setmetatable({
        x = x,
        y = y
    }, self)
end

function Vector:length()

    return math.sqrt(self.x ^ 2 + self.y ^ 2)

end

local point = Vector:new(10, 20)

print(point:length())

--==============================================================================
-- Standard Library
--==============================================================================

math.random()

math.floor(3.14)

math.max(1, 2, 3)

string.upper("lua")

string.lower("LUA")

table.insert(languages, "Zig")

table.sort(languages)

os.date()

os.time()

coroutine.create(function()

    coroutine.yield()

end)

--==============================================================================
-- File IO
--==============================================================================

local file = io.open("preview.txt", "r")

if file then

    local content = file:read("*a")

    file:close()

end

--==============================================================================
-- Error Handling
--==============================================================================

local ok, err = pcall(function()

    error("Lua Error")

end)

if not ok then

    print(err)

end

--==============================================================================
-- Labels / Goto
--==============================================================================

local i = 0

::continue::

i = i + 1

if i < 3 then
    goto continue
end

--==============================================================================
-- Main
--==============================================================================

greet(username)

print(add(5, 10))

print(multiply(3, 4))

print(nextValue())

print(nextValue())

config:show()

print("End of Preview")