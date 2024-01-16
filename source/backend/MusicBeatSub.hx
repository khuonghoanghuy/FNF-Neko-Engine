package backend;

import backend.Conductor.BPMChangeEvent;
import backend.PlayerSetting.PlayerSettings;
import flixel.FlxG;
import flixel.FlxSubState;
import openfl.Lib;
import openfl.events.Event;

class MusicBeatSub extends FlxSubState
{
	public static var isSubStateMode:Bool = false;

	public function new()
	{
		super();
		isSubStateMode = true;
		FlxG.fixedTimestep = false;
		openfl.system.System.gc();
		if (FlxG.save.data.maxiumFPSCapper >= 0.01 && FlxG.save.data.maxiumFPSCapper <= 1000)
			Lib.current.stage.frameRate = FlxG.save.data.maxiumFPSCapper;
		else
			Lib.current.stage.frameRate = 60; // or any other default value
	}

	private var lastBeat:Float = 0;
	private var lastStep:Float = 0;

	private var curStep:Int = 0;
	private var curBeat:Int = 0;
	private var controls(get, never):Controls;

	inline function get_controls():Controls
		return PlayerSettings.player1.controls;

	override function update(elapsed:Float)
	{
		// everyStep();
		var oldStep:Int = curStep;

		updateCurStep();
		curBeat = Math.floor(curStep / 4);

		if (oldStep != curStep && curStep > 0)
			stepHit();

		super.update(elapsed);
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
			if (Conductor.songPosition > Conductor.bpmChangeMap[i].songTime)
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

	override function close()
	{
		super.close();
		isSubStateMode = false;
	}

	override function closeSubState()
	{
		super.closeSubState();
		isSubStateMode = false;
	}
}
