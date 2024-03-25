package state;

import backend.MusicBeat;
import flixel.FlxG;
import flixel.text.FlxText;

class CacheState extends MusicBeat
{
	var theTitleText:FlxText;

	override function create()
	{
		super.create();
		theTitleText = new FlxText(0, 0, 0, "Tryna to load some stuff\nplease wait for this!");
		theTitleText.screenCenter();
		theTitleText.alignment = CENTER;
		add(theTitleText);
		FlxG.sound.cacheAll();
	}
}
