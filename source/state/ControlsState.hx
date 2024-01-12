package state;

import backend.MusicBeat;
import backend.SaveData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import state.OptionsState;

class ControlsState extends MusicBeat
{
	var curKey:Int = 0;
	var inChange:Bool = false;
	var controlsKey:FlxText;
	var warmText:FlxText;

	public function new()
	{
		super();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		controlsKey = new FlxText(0, 0, 0, "", 32);
		controlsKey.screenCenter(X);
		controlsKey.x += 180;
		controlsKey.font = "assets/fonts/vcr.ttf";
		controlsKey.color = FlxColor.WHITE;
		controlsKey.alignment = LEFT;
		add(controlsKey);

		warmText = new FlxText(0, FlxG.height * 0.9 + 18, FlxG.width, "", 32);
		warmText.scrollFactor.set();
		warmText.setFormat("assets/fonts/vcr.ttf", 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(warmText);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE && !inChange)
		{
			FlxG.switchState(new OptionsState());
		}

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			inChange = true;
			warmText.text = "PRESS ANY KEY TO CHANGE";
		}

		switch (curKey)
		{
			case 0:
				controlsKey.text = "Left Key: " + FlxG.save.data.keybinds[0];
			case 1:
				controlsKey.text = "Down Key: " + FlxG.save.data.keybinds[1];
			case 2:
				controlsKey.text = "Up Key: " + FlxG.save.data.keybinds[2];
			case 3:
				controlsKey.text = "Right Key: " + FlxG.save.data.keybinds[3];
		}

		if (FlxG.keys.anyJustPressed([DOWN, S]) && !inChange)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			if (curKey == 0)
			{
				curKey = 3;
			}
			else
			{
				curKey--;
			}
		}

		if (FlxG.keys.anyJustPressed([UP, W]) && !inChange)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			if (curKey == 3)
			{
				curKey = 0;
			}
			else
			{
				curKey++;
			}
		}

		if (inChange)
		{
			if (!controls.ACCEPT && !controls.BACK && !controls.PAUSE && !controls.CHEAT && !controls.PAUSE && FlxG.keys.justPressed.ANY)
			{
				FlxG.save.data.keybinds[curKey] = FlxG.keys.getIsDown()[0].ID.toString();
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				controls.setKeyboardScheme(Solo);
				warmText.text = "";
				inChange = false;
			}
		}
	}
}
