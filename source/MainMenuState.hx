package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; //This is also used for Discord RPC
	public static var bloxxinVersion:String = '1.5';
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		//#if ACHIEVEMENTS_ALLOWED 'badges', #end
		'credits',
		'options'
	];

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var image0:FlxSprite;
	var image1:FlxSprite;
	var image2:FlxSprite;
	var image3:FlxSprite;
	var image4:FlxSprite;

	override function create()
	{
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement, false);
		FlxG.cameras.setDefaultDrawTarget(camGame, true);

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.set(0, 0);
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		image0 = new FlxSprite().loadGraphic(Paths.image('mainmenuimages/Story'));
		image0.scrollFactor.set(0, 0);
		image0.scale.set(0.65, 0.65);
		image0.screenCenter();
		image0.offset.set(0, -100);
		add(image0);
	
		image1 = new FlxSprite().loadGraphic(Paths.image('mainmenuimages/Freeplay'));
		image1.scrollFactor.set(0, 0);
		image1.scale.set(0.65, 0.65);
		image1.screenCenter();
		image1.offset.set(0, -100);
		add(image1);

		image2 = new FlxSprite().loadGraphic(Paths.image('mainmenuimages/Badges'));
		image2.scrollFactor.set(0, 0);
		image2.scale.set(0.65, 0.65);
		image2.screenCenter();
		image2.offset.set(0, -100);
		image2.alpha = 0;
		add(image2);

		image3 = new FlxSprite().loadGraphic(Paths.image('mainmenuimages/Credits'));
		image3.scrollFactor.set(0, 0);
		image3.scale.set(0.65, 0.65);
		image3.screenCenter();
		image3.offset.set(0, -100);
		add(image3);

		image4 = new FlxSprite().loadGraphic(Paths.image('mainmenuimages/Options'));
		image4.scrollFactor.set(0, 0);
		image4.scale.set(0.65, 0.65);
		image4.screenCenter();
		image4.offset.set(0, -100);
		add(image4);
		
		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
            var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, 50);
			menuItem.scale.set(0.3, 0.3);
            menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
            menuItem.animation.addByPrefix('idle', "idle", 10);
            menuItem.animation.addByPrefix('selected', "selected", 24);
            menuItem.animation.play('idle');
            menuItem.ID = i;
            menuItem.screenCenter(X);
            menuItem.x += FlxG.width * i;
            menuItems.add(menuItem);
            var scr:Float = (optionShit.length - 4) * 0.135;
            if(optionShit.length < 6) scr = 0;
            menuItem.scrollFactor.set(0, scr);
            menuItem.antialiasing = ClientPrefs.globalAntialiasing;
            //menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
            menuItem.updateHitbox();
		}

		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Bloxxin' Funkin Horror v" + bloxxinVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if(FreeplayState.vocals != null) FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		image0.alpha = FlxMath.lerp(image0.alpha, (curSelected == 0 ? 1 : 0), 0.4 * 60 * elapsed);
		image1.alpha = FlxMath.lerp(image1.alpha, (curSelected == 1 ? 1 : 0), 0.4 * 60 * elapsed);
		//image2.alpha = FlxMath.lerp(image2.alpha, (curSelected == 2 ? 1 : 0), 0.4 * 60 * elapsed);
		image3.alpha = FlxMath.lerp(image3.alpha, (curSelected == 2 ? 1 : 0), 0.4 * 60 * elapsed);
		image4.alpha = FlxMath.lerp(image4.alpha, (curSelected == 3 ? 1 : 0), 0.4 * 60 * elapsed);

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (controls.ACCEPT) 
						{
							spr.animation.play('selected');
						}				
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										PlayState.storyPlaylist = ['proveit', 'deadline'];
										PlayState.isStoryMode = true;
										WeekData.reloadWeekFiles(true);
										PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase(), PlayState.storyPlaylist[0].toLowerCase());
										PlayState.campaignScore = 0;
										PlayState.campaignMisses = 0;
										LoadingState.loadAndSwitchState(new PlayState(), true);
										FreeplayState.destroyFreeplayVocals();
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									//case 'badges':
										//MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();
			FlxTween.tween(spr, {x: (spr.ID - curSelected) * FlxG.width + (FlxG.width - spr.width)/2}, 0.1);

			if (spr.ID == curSelected)
			{
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
