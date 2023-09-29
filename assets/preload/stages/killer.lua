function onCreate()
	-- background shit

	makeLuaSprite('sky', 'stages/sky', -300, -100);
	setScrollFactor('sky', 0.2, 0.2);

	makeLuaSprite('killermap', 'stages/killermap', -320, -100);
	setScrollFactor('killermap', 1, 1);


        addLuaSprite('sky', false);
        addLuaSprite('killermap', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end