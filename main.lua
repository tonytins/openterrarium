


dofile("player.lua")
dofile("map.lua")
dofile("menu.lua")
dofile("collision.lua")

--the scale of the map
scale = 12

function love.draw()
	maplib.draw()
	player.draw()
	menu.draw()   
end

function love.load()
	maplib.createmap()
	
	font = love.graphics.newFont("font.ttf", 12)
	fontmed = love.graphics.newFont("font.ttf", 22)
	fontbig = love.graphics.newFont("font.ttf", 35)
	
	love.graphics.setFont(font)
	
	
	minesound = love.audio.newSource("mine.ogg", "static")
	placesound = love.audio.newSource("place.ogg", "static")
	stepsound = love.audio.newSource("step.ogg", "static")
	oof = love.audio.newSource("oof.ogg", "static")
end

function love.quit( )
	print("Thanks for playing!")
	return nil
end

function love.update(dt)
	menu.animate()
	mine(key)
	gravity(dt)
end
