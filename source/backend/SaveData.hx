package backend;

import flixel.FlxG;
import flixel.util.FlxSave;

class SaveData
{
	// first, add ur variables of data here!
	public static var ghosttap:Bool = true;
	public static var downscroll:Bool = false;
	public static var maxiumFPSCapper:Int = 60;
	public static var camLerpPlayState:Bool = false;

	// after that, add ur variable of save data here
	public static function init():Void
	{
		if (FlxG.save.data.ghosttap == null)
		{
			FlxG.save.data.ghosttap = ghosttap;
		}

		if (FlxG.save.data.downscroll == null)
		{
			FlxG.save.data.downscroll = downscroll;
		}

		if (FlxG.save.data.maxiumFPSCapper == null)
		{
			FlxG.save.data.maxiumFPSCapper = maxiumFPSCapper;
		}

		if (FlxG.save.data.camLerpPlayState == null)
		{
			FlxG.save.data.camLerpPlayState = camLerpPlayState;
		}

		var save = new FlxSave();
		save.bind("funkin", "huy1234th");
		save.flush();
		trace("Save Data has init!!");
		reinit();
	}

	// finally, readd ur save data on reinit!
	public static function reinit():Void
	{
		if (FlxG.save.data.ghosttap != null)
		{
			ghosttap = FlxG.save.data.ghosttap;
		}

		if (FlxG.save.data.downscroll != null)
		{
			downscroll = FlxG.save.data.downscroll;
		}

		if (FlxG.save.data.maxiumFPSCapper != null)
		{
			maxiumFPSCapper = FlxG.save.data.maxiumFPSCapper;
		}

		if (FlxG.save.data.camLerpPlayState != null)
		{
			camLerpPlayState = FlxG.save.data.camLerpPlayState;
		}

		var save = new FlxSave();
		save.bind("funkin", "huy1234th");
		save.flush();
		trace("Save Data has reInit!!");
	}
}
