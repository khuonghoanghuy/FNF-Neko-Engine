package debug;

import flixel.FlxG;
import flixel.system.debug.watch.Tracker.TrackerProfile;

/**
 * Note: This is only work on DEBUG Build
 */
class Profile
{
	public function new() {}

	public static function newTracker(ObjectClass:Class<Dynamic>, ?Variables:Array<String>, ?Extensions:Array<Class<Dynamic>>)
	{
		FlxG.debugger.addTrackerProfile(new TrackerProfile(ObjectClass, Variables, Extensions));
	}
}
