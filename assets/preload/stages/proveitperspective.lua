function onCreate()
	-- background shit
	makeLuaSprite('proveitfog', 'stages/proveitfog', -300, -100);
	setScrollFactor('proveitfog', 0.5, 0.5);

	makeLuaSprite('proveitperspective', 'stages/proveitperspective', -300, -100);
	setScrollFactor('proveitperspective', 1, 1);

        makeLuaSprite('proveitsky', 'stages/proveitsky', -300, -100);
	setScrollFactor('proveitsky', 0.2, 0.2);

	addLuaSprite('proveitsky', false);
	addLuaSprite('proveitfog', true);
        addLuaSprite('proveitperspective', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end