function love.load()
	require "level1";

	sound_data = love.sound.newSoundData("resources/SimGretina-ThisRemindsMeOfSomething.ogg");
	rate = sound_data:getSampleRate();
    channels = sound_data:getChannels();
	sound_bg = love.audio.newSource(sound_data);
	sound_bg:play();
	wave_size = 256;

	-- non-main
	level1Load();

end


function love.update(dt)
	wave = {};
	local curSample = sound_bg:tell('samples')
	
	for i=curSample, curSample+(wave_size-1) / 2 do
	    table.insert(wave, (sound_data:getSample(i * 2) + sound_data:getSample(i * 2 + 1)));
	end
	
	-- non-main
	level1Update(dt);
end

function lower_bound_0(num)
	if(num < 0) then
		return 0;
	else
		return num;
	end
end


function love.draw()
	local width = love.graphics.getWidth();
	local height = love.graphics.getHeight();

	local width_scale = (width / wave_size);
	for key, val in pairs(wave) do 
	  love.graphics.line( key * width_scale, height, 
	  	                  key * width_scale, height - val * 100);
	end
	--
	-- non-main
	level1Draw();
end




