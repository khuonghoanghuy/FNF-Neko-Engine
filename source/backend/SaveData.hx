package backend;

import flixel.FlxG;

class SaveData
{
	public static function saveInit()
	{
		if (FlxG.save.data.ghosttap == null)
			FlxG.save.data.ghosttap = true;

		if (FlxG.save.data.downscroll == null)
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.advanceDisplay == null)
			FlxG.save.data.advanceDisplay = true;

		if (FlxG.save.data.maxiumFPSCapper == null)
			FlxG.save.data.maxiumFPSCapper = 60;

		if (FlxG.save.data.camLerpPlayState == null)
			FlxG.save.data.camLerpPlayState = true;
	}

	public static function resetInit()
	{
		FlxG.save.data.ghosttap = null;
		FlxG.save.data.downscroll = null;
		FlxG.save.data.advanceDisplay = null;
		FlxG.save.data.maxiumFPSCapper = null;
		FlxG.save.data.songScores = 0;
		FlxG.save.destroy();
		FlxG.save.erase();
	}
}
