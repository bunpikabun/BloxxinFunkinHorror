function onCreate()
	-- background shit
	makeLuaSprite('test', 'stages/test', -300, -100);
	setScrollFactor('test', 1, 1);


	addLuaSprite('test', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end