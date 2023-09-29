function onCreate()
	-- background shit
	makeLuaSprite('truss', 'stages/truss', -300, -100);
	setScrollFactor('truss', 1, 1);

        makeLuaSprite('classicsky', 'stages/classicsky', -300, -100);
	setScrollFactor('classicsky', 0.1, 0.1);


	addLuaSprite('classicsky', false);
        addLuaSprite('truss', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end