function onCreate()
	-- background shit

        makeAnimatedLuaSprite('roomsside','stages/roomsside',-180,180)addAnimationByPrefix                                    ('roomsside','dance','run',20,true)
        objectPlayAnimation('roomsside','dance',false)
        setScrollFactor('roomsside', 1, 1);

        makeAnimatedLuaSprite('bflegsside','stages/bflegsside',432,625)addAnimationByPrefix                                    ('bflegsside','dance','run',40,true)
        objectPlayAnimation('bflegsside','dance',false)
        setScrollFactor('bflegsside', 1, 1);


        addLuaSprite('roomsside', false);
        addLuaSprite('bflegsside', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end