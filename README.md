# badRB_UI
Really bad Roblox UI

# DOCS:
## Connect library
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SashkinYT/badRB_UI/main/UILib.lua"))()
```
## Create window:
```lua
local window = Lib:CreateUI("Window")
```
## Create tab:
```lua
local tab = window:NewTab("Tab")
```
## Create label
```lua
tab:NewObject("Name", "Text")
```
## Create button
```lua
tab:NewObject("Name", "Button", function()
    print("Hello!")
end)
```
## Create toggle
```lua
tab:NewObject("Name", "Toggle", function(state)
    if state then
        print("Hello!")
    end
end)
```
## Create textbox
```lua
tab:NewObject("Name", "Input", function(text)
    print(text)
end)
```
