package state;

import backend.Controls.Control;
import backend.CoolUtil;
import backend.MusicBeat;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;
import openfl.Lib;
import openfl.events.Event;

class OptionsState extends MusicBeat
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [
		/*"Controls",*/ "Ghost tap",
		"Downscroll",
		"Advance Display" /*, "Maxium FPS Cap"*/];

	private var grpControls:FlxTypedGroup<Alphabet>;
	var controlsStuff:String;
	var versionShit:FlxText;

	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		var grid:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x33FFFFFF, 0x0));
		grid.velocity.set(40, 40);
		grid.alpha = 0;
		FlxTween.tween(grid, {alpha: 1}, 0.5, {ease: FlxEase.backOut});
		add(grid);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
			var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
			controlLabel.isMenuItem = true;
			controlLabel.targetY = i;
			grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		versionShit = new FlxText(5, FlxG.height - 18, 0, controlsStuff, 18);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		changeSelection();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			switch (controlsStrings[curSelected])
			{
				case "Controls":
					FlxG.switchState(new ControlsState());
				case "Ghost tap":
					FlxG.save.data.ghosttap = !FlxG.save.data.ghosttap;
				case "Downscroll":
					FlxG.save.data.downscroll = !FlxG.save.data.downscroll;
				case "Advance Display":
					FlxG.save.data.advanceDisplay = !FlxG.save.data.advanceDisplay;
			}
			FlxG.save.flush();
			FlxG.save.bind('funkin', 'huy1234th');
		}

		if (controls.BACK)
			FlxG.switchState(new MainMenuState());
		if (controls.UP_P)
			changeSelection(-1);
		if (controls.DOWN_P)
			changeSelection(1);
		if (controls.LEFT)
		{
			switch (controlsStrings[curSelected])
			{
				case "Maxium FPS Cap":
					if (FlxG.save.data.maxiumFPSCapper == 60)
					{
						FlxG.save.data.maxiumFPSCapper = 60;
					}
					else
					{
						FlxG.save.data.maxiumFPSCapper -= 1;
					}
					FlxG.stage.addEventListener(Event.ACTIVATE, function(_)
					{
						Lib.current.stage.frameRate = FlxG.save.data.maxiumFPSCapper;
					});
			}
			FlxG.save.flush();
			FlxG.save.bind('funkin', 'huy1234th');
		}
		if (controls.RIGHT)
		{
			switch (controlsStrings[curSelected])
			{
				case "Maxium FPS Cap":
					FlxG.save.data.maxiumFPSCapper += 1;
					FlxG.stage.addEventListener(Event.ACTIVATE, function(_)
					{
						Lib.current.stage.frameRate = FlxG.save.data.maxiumFPSCapper;
					});
			}
			FlxG.save.flush();
			FlxG.save.bind('funkin', 'huy1234th');
		}
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		switch (controlsStrings[curSelected])
		{
			case "Controls":
				controlsStuff = "Change the Keybind from keyboard (bro idk how to write this ;_;): ";
			case "Ghost tap":
				controlsStuff = "Help you play more easier than ever with ghost tap: ";
			case "Downscroll":
				controlsStuff = "If you can't play upscroll, downscroll will help you play much better: ";
			case "Advande Display":
				controlsStuff = "Display more stuff like Accuracy, Ranking and more: ";
			case "Maxium FPS Cap":
				controlsStuff = "Let FPS capping more FPS than ever (WARMING: THIS ONE IS GOT MUCH FPS MAY CAUSE CRASH GAME!!): ";
		}

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}
}
