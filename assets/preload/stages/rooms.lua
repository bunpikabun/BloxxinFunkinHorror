function onCreate()
	-- background shit

        makeAnimatedLuaSprite('rooms','stages/rooms',-180,180)addAnimationByPrefix                                    ('rooms','dance','run',20,true)
        objectPlayAnimation('rooms','dance',false)
        setScrollFactor('rooms', 1, 1);

        makeAnimatedLuaSprite('bflegs','stages/bflegs',432,625)addAnimationByPrefix                                    ('bflegs','dance','run',24,true)
        objectPlayAnimation('bflegs','dance',false)
        setScrollFactor('bflegs', 1, 1);


        addLuaSprite('rooms', false);
        addLuaSprite('bflegs', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end