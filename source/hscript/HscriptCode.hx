package hscript;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import object.Boyfriend;
import object.Character;
import state.PlayState;

class HscriptCode
{
	var playState:PlayState = null;

	public function new(haxeScript:String)
	{
		// super(haxeScript);
		var script = haxeScript;
		var parser = new hscript.Parser();
		var program = parser.parseString(script);
		var interp = new hscript.Interp();

		interp.variables.set("Math", Math);
		interp.variables.set("FlxG", FlxG);
		interp.variables.set("PlayState", PlayState.init);
		interp.variables.set("Game", PlayState.init); // same
		// interp.variables.set("FlxColor", FlxColor);
		interp.variables.set("FlxSprite", FlxSprite);
		interp.variables.set('FlxCamera', FlxCamera);
		interp.variables.set("Paths", Paths);
		interp.variables.set('setVar', function(name:String, value:Dynamic)
		{
			PlayState.init.variables.set(name, value);
		});
		interp.variables.set('SetProperty', function(vari:String, value:String)
		{
			return Reflect.setProperty(playState, vari, value.split('.'));
		});
		interp.variables.set("SetPostion", function(type:FlxObject, x:Float, y:Float)
		{
			return type.setPosition(x, y);
		});
		interp.variables.set("ChangeEvent", function(typeEvent:String, value1:String, value2:String, value3:String)
		{
			switch (typeEvent)
			{
				case "changeDadChar":
					PlayState.init.remove(PlayState.init.dad);
					PlayState.init.dad = new Character(Std.parseFloat(value1), Std.parseFloat(value2), value3, false);
					PlayState.init.add(PlayState.init.dad);
				case "changeBfChar":
					PlayState.init.remove(PlayState.init.boyfriend);
					PlayState.init.boyfriend = new Boyfriend(Std.parseFloat(value1), Std.parseFloat(value2), value3);
					PlayState.init.add(PlayState.init.boyfriend);
			}
		});
		interp.variables.set("RunEvent", PlayState.runEvent);
		interp.variables.set("WorkOnCreate", PlayState.workOnCreate);
		interp.variables.set("WorkOnBeatHit", function(atBeat, code:String)
		{
			if (PlayState.init.curBeat == atBeat)
			{
				execute(code);
			}
		});
		interp.variables.set("WorkOnStepHit", function(atStep, code:String)
		{
			if (PlayState.init.curStep == atStep)
			{
				execute(code);
			}
		});
		interp.variables.set("WorkOnCurrentUpdate", PlayState.workOnCurrentUpdate);
		interp.variables.set("WorkOnUpdate", function(atUpdate:Float, code:String)
		{
			if (FlxG.elapsed == atUpdate)
			{
				execute(code);
			}
		});
		interp.variables.set("add", function(object:flixel.FlxBasic)
		{
			PlayState.init.add(object);
		});
		interp.variables.set("remove", function(object:flixel.FlxBasic)
		{
			PlayState.init.remove(object);
		});

		trace(interp.execute(program));
		interp.execute(program);
	}

	public static function execute(codeToRun:String):Dynamic
	{
		var parser = new hscript.Parser();
		var interp = new hscript.Interp();

		@:privateAccess
		parser.line = 1;
		parser.allowTypes = true;
		return interp.execute(parser.parseString(codeToRun));
	}
}
