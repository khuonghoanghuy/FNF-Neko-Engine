package backend;

import backend.Conductor.BPMChangeEvent;
import backend.PlayerSetting;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import openfl.Lib;
import openfl.events.Event;

class MusicBeat extends FlxUIState
{
	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;
	private var controls(get, never):Controls;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override function create()
	{
		super.create();
		FlxG.fixedTimestep = false;
		openfl.system.System.gc();
		if (FlxG.save.data.maxiumFPSCapper >= 0.01 && FlxG.save.data.maxiumFPSCapper <= 1000)
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
