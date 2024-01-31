package subState;

import backend.MusicBeatSub;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.display.FlxGridOverlay;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

class OutdateSubState extends MusicBeatSub
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

		var cationText:FlxText = new FlxText(0, 0, 0, "Ayo, you are using a outdated version!!!\nPress Enter to update\nPress Escape to continue", 32);
		cationText.scrollFactor.set();
		cationText.screenCenter();
		cationText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		cationText.updateHitbox();
		add(cationText);

		FlxTween.tween(bg, {alpha: 0.6}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(cationText, {alpha: 1, y: 20}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.3});
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			FlxG.openURL("https://github.com/khuonghoanghuy/FNF-Neko-Engine/releases");
		}

		if (controls.BACK)
		{
			close();
		}
	}
}
