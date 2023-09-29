function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bffurrydead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'contentDeleted'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'kerplunk'); --put in mods/music/
end