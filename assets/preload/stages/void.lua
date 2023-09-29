function onCreate()
	-- background shit

	makeLuaSprite('voidsky', 'stages/voidsky', -300, -100);
	setScrollFactor('voidsky', 0.5, 0.5);

        makeAnimatedLuaSprite('voidstatic','stages/voidstatic',-300,-100)addAnimationByPrefix                            ('voidstatic','dance','static',5,true)
        objectPlayAnimation('voidstatic','dance',false)
        setScrollFactor('voidstatic', 1, 1);


        addLuaSprite('voidsky', false);
	addLuaSprite('voidstatic', true);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end