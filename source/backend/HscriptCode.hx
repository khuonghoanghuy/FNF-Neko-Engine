package backend;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import object.Boyfriend;
import object.Character;
import state.PlayState;

class HscriptCode
{
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
		// interp.variables.set("FlxColor", FlxColor);
		interp.variables.set("FlxSprite", FlxSprite);
		interp.variables.set('FlxCamera', FlxCamera);
		interp.variables.set("Paths", Paths);
		interp.variables.set('setVar', function(name:String, value:Dynamic)
		{
			PlayState.init.variables.set(name, value);
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
		interp.variables.set("MakeBG", PlayState.makeBG);
		interp.variables.set("MakeAnimateBG", PlayState.makeAnimateBG);
		interp.variables.set("WorkOnBeatHit", PlayState.init.beatHit);
		interp.variables.set("WorkOnStepHit", PlayState.init.stepHit);

		trace(interp.execute(program));
		interp.execute(program);
	}
}
