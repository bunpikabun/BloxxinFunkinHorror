function onCreate()
	-- background shit
	makeLuaSprite('elevator', 'stages/elevator', -300, -100);
	setScrollFactor('elevator', 1, 1);


        addLuaSprite('elevator', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end