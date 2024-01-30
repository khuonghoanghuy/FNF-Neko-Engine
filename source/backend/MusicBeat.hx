package backend;

import backend.Conductor.BPMChangeEvent;
import backend.PlayerSetting;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import openfl.Lib;
import openfl.events.Event;

class MusicBeat extends FlxUIState
{
	public var lastBeat:Float = 0;
	public var lastStep:Float = 0;

	public var curStep:Int = 0;
	public var curBeat:Int = 0;
	public var controls(get, never):Controls;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override function create()
	{
		super.create();
		lastBeat = 0;
		lastStep = 0;
		curStep = 0;
		curBeat = 0;
		FlxG.fixedTimestep = false;
		openfl.system.System.gc();
		if (FlxG.save.data.maxiumFPSCapper >= 0.01
			&& FlxG.save.data.maxiumFPSCapper <= Std.parseInt(CoolUtil.coolStringFile(Paths.txt("fpsMaxiumCap"))))
			Lib.current.stage.frameRate = FlxG.save.data.maxiumFPSCapper;
		else
			Lib.current.stage.frameRate = 60; // or any other default value
	}

	override function update(elapsed:Float)
	{
		var oldStep:Int = curStep;

		updateCurStep();
		updateBeat();

		if (oldStep != curStep && curStep > 0)
			stepHit();
		super.update(elapsed);
		if (FlxG.keys.justPressed.F)
		{
			FlxG.fullscreen = !FlxG.fullscreen;
		}
	}

	private function updateBeat():Void
	{
		curBeat = Math.floor(curStep / 4);
	}

	private function updateCurStep():Void
	{
		var lastChange:BPMChangeEvent = {
			stepTime: 0,
			songTime: 0,
			bpm: 0
		}
		for (i in 0...Conductor.bpmChangeMap.length)
		{
			if (Conductor.songPosition >= Conductor.bpmChangeMap[i].songTime)
				lastChange = Conductor.bpmChangeMap[i];
		}

		curStep = lastChange.stepTime + Math.floor((Conductor.songPosition - lastChange.songTime) / Conductor.stepCrochet);
	}

	public function stepHit():Void
	{
		if (curStep % 4 == 0)
			beatHit();
	}

	public function beatHit():Void
	{
		// do literally nothing dumbass
	}
}
