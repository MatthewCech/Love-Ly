# Love-Ly
A Love2D testbed! Note - including binaries in git repos is ill-advised, and I am only doing it to simplify this matter. The idea is that the repo itself is stand-alone.

### Love2D Windows Setup notes:

- Make a directory and give it whatever name you want
- Inside that directory, add main.lua. Go ahead and add some hello world text to that!:

```lua
function love.draw()
    love.graphics.print('Hello World!', 400, 300)
end
```

- Take this directory and drag it onto the corresponding love.exe you want to run! love.exe just runs the game, lovec.exe provides a console as well.
