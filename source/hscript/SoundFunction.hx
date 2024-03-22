package hscript;

import flixel.FlxG;

class SoundFunction
{
	public static function play(filename:String, loudInt:Float = 0.4)
	{
		FlxG.sound.cache(filename);
		return FlxG.sound.play(Paths.sound(filename), loudInt);
	}

	public static function playRandom(filename:String, min:Int, max:Int, loudInt:Float = 0.4)
	{
		FlxG.sound.cache(filename);
		return FlxG.sound.play(Paths.soundRandom(filename, min, max), loudInt);
	}

	public static function playMusic(filename:String, loudInt:Float = 0.4, looped:Bool = false)
	{
		FlxG.sound.cache(filename);
		return FlxG.sound.playMusic(Paths.music(filename), loudInt, looped);
	}
}
