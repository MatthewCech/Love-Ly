function love.load()
	image = love.graphics.newImage("resources/w.png");
	sound = love.audio.newSource("resources/SimGretina-ThisRemindsMeOfSomething.ogg");
	love.audio.play(sound);
	rotation = 15;
	ticktime = love.timer.getTime();
	shouldAlternate = true;
	direction = 1;
	posx = 330;
	posy = 330;
	moveSize = 20;
	maxMoves = 4;
	movesTaken = 0;
	red = 0;
	green = 0; 
	blue = 255;
end


function love.update(dt)
	timediff = (love.timer.getTime() - ticktime);
	if(timediff * 1000 > 444) then
		-- Put content in the tick below this --

		if(shouldAlternate) then
			rotation = rotation - 30;
		else
			rotation = rotation + 30;
		end

		if(direction == 0) then posx = posx - moveSize; end 
		if(direction == 1) then posx = posx + moveSize; end 
		if(direction == 2) then posy = posy - moveSize; end 
		if(direction == 3) then posy = posy + moveSize; end 
	
		if(movesTaken >= maxMoves) then
			direction = love.math.random(4) - 1;
			movesTaken = 0;
		end

		--print(posx);
		
		shouldAlternate = not shouldAlternate;
		movesTaken = movesTaken + 1;

		-- Put content in the tick above this --
		ticktime = love.timer.getTime();
	end
end


function love.draw()
	love.graphics.draw(image, posx, posy, math.rad(rotation), -1, -1 ,32, 32);
	love.graphics.setBackgroundColor(red, green, blue);

	updateColor(3);
end

function updateColor(changeval)
	if(blue >= 255 and green <= 0) then
		red = red + changeval;
	end
	if(red >= 255 and green <= 0) then
		blue = blue - changeval;
	end
	if(red >= 255 and blue <= 0) then
		green = green + changeval;
	end
	if(green >= 255 and blue <= 0) then
		red = red - changeval;
	end
	if(red <= 0 and green >= 255) then
		blue = blue + changeval;
	end
	if(red <= 0 and blue >= 255) then
		green = green - changeval;
	end
end