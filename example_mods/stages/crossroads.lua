function onCreate()
	-- background shit

	makeLuaSprite('crossroadsmap', 'crossroadsmap', -300, -100);
	setScrollFactor('crossroadsmap', 0.9, 0.9);

	makeLuaSprite('crossroadssky', 'crossroadssky', -300, -100);
	setScrollFactor('crossroadssky', 0.2, 0.2);


        addLuaSprite('crossroadssky', false);
        addLuaSprite('crossroadsmap', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end