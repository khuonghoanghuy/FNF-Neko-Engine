package state;

import backend.Conductor;
import backend.MusicBeat;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class TitleState extends MusicBeat
{
	override public function create()
	{
		super.create();
		FlxG.save.bind('funkinNeko', 'huy1234th');

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			startIntro();
		});
	}

	var logoBl:FlxSprite;
	var gfDance:FlxSprite;
	var danceLeft:Bool = false;
	var titleText:FlxSprite;

	function startIntro():Void
	{
		FlxG.camera.flash(FlxColor.WHITE, 2);
		FlxG.sound.playMusic(Paths.music('freakyMenu'), 1);
		// FlxG.sound.music.fadeIn(4, 0, 0.7);
		Conductor.changeBPM(102);
		persistentUpdate = true;

		logoBl = new FlxSprite(-150, -100);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();

		gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		gfDance.antialiasing = true;
		add(gfDance);
		add(logoBl);

		titleText = new FlxSprite(100, FlxG.height * 0.8);
		titleText.frames = Paths.getSparrowAtlas('titleEnter');
		titleText.animation.addByPrefix('idle', "Press Enter to Begin", 24);
		titleText.animation.addByPrefix('press', "ENTER PRESSED", 24);
		titleText.antialiasing = true;
		titleText.animation.play('idle');
		titleText.updateHitbox();
		add(titleText);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.camera.flash(FlxColor.WHITE, 1);
			FlxG.sound.play(Paths.sound("confirmMenu"), 0.6);
			new FlxTimer().start(1, function(timer:FlxTimer)
			{
				FlxG.switchState(new MainMenuState());
			});
		}
	}

	override function beatHit()
	{
		super.beatHit();

		danceLeft = !danceLeft;

		if (danceLeft)
			gfDance.animation.play('danceRight');
		else
			gfDance.animation.play('danceLeft');
	}
}
