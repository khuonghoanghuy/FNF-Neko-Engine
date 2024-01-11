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
	}
}
