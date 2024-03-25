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
		lastBeat = 0;
		lastStep = 0;
		curStep = 0;
		curBeat = 0;
		isSubStateMode = true;
		FlxG.fixedTimestep = false;
		openfl.system.System.gc();
		if (SaveData.maxiumFPSCapper >= 0.01
			&& SaveData.maxiumFPSCapper <= Std.parseInt(CoolUtil.coolStringFile(Paths.txt("fpsMaxiumCap"))))
			Lib.current.stage.frameRate = SaveData.maxiumFPSCapper;
		else
			Lib.current.stage.frameRate = 60; // or any other default value
	}

	public var lastBeat:Float = 0;
	public var lastStep:Float = 0;
	public var curStep:Int = 0;
	public var curBeat:Int = 0;

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
