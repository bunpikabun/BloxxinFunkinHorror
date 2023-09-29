function onCreate()
	-- background shit
	makeLuaSprite('pofplate', 'stages/pofplate', -300, -100);
	setScrollFactor('pofplate', 1, 1);

        makeLuaSprite('sky', 'stages/sky', -300, -100);
	setScrollFactor('sky', 0.2, 0.2);

        makeLuaSprite('pofmines', 'stages/pofmines', -400, 0);
	setScrollFactor('pofmines', 1.3, 1.3);


	addLuaSprite('sky', false);
        addLuaSprite('pofplate', false);
        addLuaSprite('pofmines', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end