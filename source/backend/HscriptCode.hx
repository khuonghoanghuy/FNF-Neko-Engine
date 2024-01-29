package backend;

import flixel.FlxG;
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

		trace(interp.execute(program));
		interp.execute(program);
	}
}
