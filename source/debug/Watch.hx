package debug;

import flixel.FlxG;

class Watch
{
	public static function add(object:Dynamic, field:String, ?displayName:String)
	{
		FlxG.watch.add(object, field, displayName);
	}

	public static function addQuick(displayName:String, value:Dynamic)
	{
		FlxG.watch.addQuick(displayName, value);
	}

	public static function addMouse()
	{
		FlxG.watch.addMouse();
	}
}
