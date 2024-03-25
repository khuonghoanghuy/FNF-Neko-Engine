package subState;

import backend.MusicBeatSub;
import backend.SaveData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.system.System;

class ResetDataSubState extends MusicBeatSub
{
	public function new()
	{
		super();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);

		var grid:FlxBackdrop = new FlxBackdrop(FlxGridOverlay.createGrid(80, 80, 160, 160, true, 0x33FFFFFF, 0x0));
		grid.velocity.set(40, 40);
		grid.alpha = 0;
		FlxTween.tween(grid, {alpha: 1}, 0.5, {ease: FlxEase.backOut});
		add(grid);

		var actionNeeded:FlxText = new FlxText(20, 15, 0, "ACTION NEEDED!!", 32);
		actionNeeded.scrollFactor.set();
		actionNeeded.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		actionNeeded.updateHitbox();
		add(actionNeeded);

		var cationText:FlxText = new FlxText(0, 0, 0,
			"Are you sure?\nAll Data will be reset to default\nPress Accept to continue\nPress Back to close this menu", 32);
		cationText.scrollFactor.set();
		cationText.screenCenter();
		cationText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		cationText.updateHitbox();
		add(cationText);

		actionNeeded.alpha = 0;
		actionNeeded.x = FlxG.width - (actionNeeded.width + 20);
		cationText.alpha = 0;

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(actionNeeded, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
		FlxTween.tween(cationText, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			Application.current.window.alert("Game now will be exit!", "FNF Neko Engine");
			FlxG.save.erase();
			System.exit(0);
		}

		if (controls.BACK)
		{
			close();
		}
	}
}
