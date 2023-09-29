function onCreate()
	-- background shit
	makeLuaSprite('catboystage', 'stages/catboystage', -300, -100);
	setScrollFactor('catboystage', 1, 1);
	setProperty('catboystage.antialiasing', false);

        addLuaSprite('catboystage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end