function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'jimdead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'agony'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'kerplunk'); --put in mods/music/
end