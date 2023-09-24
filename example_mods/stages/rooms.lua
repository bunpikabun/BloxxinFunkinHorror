function onCreate()
	-- background shit

        makeAnimatedLuaSprite('rooms','rooms',-80,200)addAnimationByPrefix                                    ('rooms','dance','run',20,true)
        objectPlayAnimation('rooms','dance',false)
        setScrollFactor('rooms', 0.9, 0.9);


        addLuaSprite('rooms', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end