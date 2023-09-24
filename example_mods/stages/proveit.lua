function onCreate()
	-- background shit
	makeLuaSprite('proveitfog', 'proveitfog', -300, -100);
	setScrollFactor('proveitfog', 0.5, 0.5);

	makeLuaSprite('proveitstage', 'proveitstage', -300, -100);
	setScrollFactor('proveitstage', 1, 1);

        makeLuaSprite('proveitsky', 'proveitsky', -300, -100);
	setScrollFactor('proveitsky', 0.2, 0.2);

	addLuaSprite('proveitsky', false);
	addLuaSprite('proveitfog', true);
        addLuaSprite('proveitstage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end