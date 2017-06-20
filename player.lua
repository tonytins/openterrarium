--the player library
player = {}
player.playerx,player.playery = 1,1

player.mining = true

--controls

function love.keypressed( key, scancode, isrepeat )

	--quit
	if key == "escape" then
		love.event.push('quit')
	end

	local oldposx,oldposy = player.playerx,player.playery
	
	if key == "a" then
      player.playerx = player.playerx - 1
	end
	if key == "d" then
      player.playerx = player.playerx + 1
	end
	
	if key == "w" then
		jump()
	end
	
	--footsteps
	if collision(oldposx,oldposy) ~= true and (player.playery < mapheight and tiles[oldposx][oldposy+1]["block"] ~= 0) then
		stepsound:setPitch(love.math.random(50,100)/100)
		stepsound:stop()
		stepsound:play()
	end
		
end

--try to jump
function jump()
	if player.playery < mapheight and tiles[player.playerx][player.playery+1]["block"] ~= 0 then
		player.playery = player.playery - 1
	end

end

--mining
function mine(key)
	--left mouse button (mine)
	local left = love.mouse.isDown(1)
	local right = love.mouse.isDown(2)

	if mx ~= -1 and my ~= -1 then
		--play sound and remove tile
		if left then
			if tiles[mx][my]["block"] ~= 0 then
				minesound:setPitch(love.math.random(50,100)/100)
				minesound:stop()
				minesound:play()
				tiles[mx][my]["block"] = 0
				player.mining = true
			end
		elseif right then
			if tiles[mx][my]["block"] == 0 and (mx ~= player.playerx or my ~= player.playery) then
				placesound:setPitch(love.math.random(50,100)/100)
				placesound:stop()
				placesound:play()
				tiles[mx][my]["block"] = 1
				player.mining = false
			end
		end
	end
end

function player.draw()
	love.graphics.setFont(font)
	love.graphics.setColor(255,0,0,255)
    love.graphics.print("8", player.playerx*scale, player.playery*scale)
end
