function onCreate()
	-- background shit
	makeLuaSprite('stalkedstage', 'stalkedstage', -500, -100);
	setScrollFactor('stalkedstage', 0.9, 0.9);


        addLuaSprite('stalkedstage', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end