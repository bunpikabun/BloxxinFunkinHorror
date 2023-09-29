function onCreate()

	--by: hydro546.
	--i procrastinated 2 months on this

	makeLuaSprite('bgThing', 'robloCredit', -520,200)
	scaleObject('bgThing', 0.75, 0.75)
	setObjectCamera('bgThing', 'hud')
	addLuaSprite('bgThing', true)
	setScrollFactor('bgThing', 0, 0)

	makeLuaText("song", songName, 0, 20, 210); -- it automatically gets the songs name
	addLuaText('song');
	setTextSize('song', 30);
	setObjectCamera('song', 'hud');


-----------------musicians--------------------

	makeLuaText("musicText", '[musicians]:', 0, 20, 250);
	addLuaText('musicText');
	setTextSize('musicText', 20);
	setTextColor("musicText", "FF0000")
	setObjectCamera('musicText', 'hud');

	makeLuaText("musicians", 'Unfunny2', 0, 170, 250); --change this to musicians name
	addLuaText('musicians');
	setTextSize('musicians', 20);
	setObjectCamera('musicians', 'hud');

-----------------charters--------------------

	makeLuaText("chartText", '[charters]:', 0, 20, 270);
	addLuaText('chartText');
	setTextSize('chartText', 20);
	setTextColor("chartText", "FF0000")
	setObjectCamera('chartText', 'hud');

	makeLuaText("charters", 'Unfunny2', 0, 150, 270); --change this to charters name
	addLuaText('charters');
	setTextSize('charters', 20);
	setObjectCamera('charters', 'hud');

-----------------artists--------------------

	makeLuaText("artText", '[artists]:', 0, 20, 290);
	addLuaText('artText');
	setTextSize('artText', 20);
	setTextColor("artText", "FF0000")
	setObjectCamera('artText', 'hud');

	makeLuaText("artists", 'Unfunny2', 0, 140, 290); --change this to artists name
	addLuaText('artists');
	setTextSize('artists', 20);
	setObjectCamera('artists', 'hud');


-----------------quote lol--------------------

	makeLuaText("quote", 'Proscribe stop posting your gonna get proscribed BROOOOOOO', 0, 20, 385); --quote editing here
	addLuaText('quote');
	setTextSize('quote', 20);
	setObjectCamera('song', 'hud');

end

function onCreatePost()
    runTimer('moveOut', 3.7, 1)
end

function onUpdate()    
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'moveOut' then
        doTweenX('bye', 'bgThing', -1000, 0.6, 'Linear')
	doTweenX('bye2', 'song', -1000, 0.8, 'Linear');

	doTweenX('bye3', 'musicText', -1000, 0.8, 'Linear');
	doTweenX('bye4', 'musicians', -1000, 0.8, 'Linear');

	doTweenX('bye5', 'chartText', -1000, 0.8, 'Linear');
	doTweenX('bye6', 'charters', -1000, 0.8, 'Linear');

	doTweenX('bye7', 'artText', -1000, 0.8, 'Linear');
	doTweenX('bye8', 'artists', -1000, 0.8, 'Linear');

	doTweenX('bye9', 'quote', -1000, 0.8, 'Linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'bye' then
        removeLuaSprite('bgThing', true)
	removeLuaSprite('song', true)

	removeLuaSprite('musicText', true)
	removeLuaSprite('musicians', true)

	removeLuaSprite('chartText', true)
	removeLuaSprite('charters', true)

	removeLuaSprite('artText', true)
	removeLuaSprite('artists', true)

	removeLuaSprite('quote', true)
    end
end

