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
	/*public function loadconfig()
		{
			if (controlsJson.up != null)
			{
				Controls.keyUp = controlsJson.up;
			}
			else
			{
				Controls.keyUp = "W";
			}
			if (controlsJson.down != null)
			{
				Controls.keyDown = controlsJson.down;
			}
			else
			{
				Controls.keyDown = "S";
			}
			if (controlsJson.left != null)
			{
				Controls.keyLeft = controlsJson.left;
			}
			else
			{
				Controls.keyLeft = "A";
			}
			if (controlsJson.right != null)
			{
				Controls.keyRight = controlsJson.right;
			}
			else
			{
				Controls.keyRight = "D";
			}
	}*/
}
