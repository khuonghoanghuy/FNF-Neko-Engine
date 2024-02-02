package backend;

import haxe.ds.StringMap;

class SaveData
{
	public static var saveData:StringMap<Dynamic> = new StringMap<Dynamic>();

	public static function main()
	{
		saveInit();
		trace(saveData.get("ghosttap")); // Output: true
		trace(saveData.get("downscroll")); // Output: false
		trace(saveData.get("advanceDisplay")); // Output: true
		trace(saveData.get("maxiumFPSCapper")); // Output: 60
		trace(saveData.get("camLerpPlayState")); // Output: true

		var saveDataCopy = getSaveData();
		trace(saveDataCopy.get("ghosttap")); // Output: true
		trace(saveDataCopy.get("downscroll")); // Output: false
		trace(saveDataCopy.get("advanceDisplay")); // Output: true
		trace(saveDataCopy.get("maxiumFPSCapper")); // Output: 60
		trace(saveDataCopy.get("camLerpPlayState")); // Output: true
	}

	public static function saveInit()
	{
		if (!saveData.exists("ghosttap"))
			saveData.set("ghosttap", true);

		if (!saveData.exists("downscroll"))
			saveData.set("downscroll", false);

		if (!saveData.exists("advanceDisplay"))
			saveData.set("advanceDisplay", true);

		if (!saveData.exists("maxiumFPSCapper"))
			saveData.set("maxiumFPSCapper", 60);

		if (!saveData.exists("camLerpPlayState"))
			saveData.set("camLerpPlayState", true);
	}

	public static function resetData()
	{
		saveData.set("ghosttap", true);
		saveData.set("downscroll", false);
		saveData.set("advanceDisplay", true);
		saveData.set("maxiumFPSCapper", 60);
		saveData.set("camLerpPlayState", true);
	}

	public static function getSaveData():StringMap<Dynamic>
	{
		return saveData.copy();
	}
}
