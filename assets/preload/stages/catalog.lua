function onCreate()
	-- background shit
	makeLuaSprite('foolsstage', 'stages/foolsstage', -300, -100);
	setScrollFactor('foolsstage', 0.5, 0.5);


        addLuaSprite('foolsstage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end