function onCreate()
	-- background shit
	makeLuaSprite('floatingpoint', 'stages/floatingpoint', -300, -100);
	setScrollFactor('floatingpoint', 0.1, 0.1);


        addLuaSprite('floatingpoint', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end