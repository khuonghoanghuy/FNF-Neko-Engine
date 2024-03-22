package hscript;

import flixel.FlxG;
import flixel.FlxSprite;
import state.PlayState;

class StageCode
{
	var interp = new hscript.Interp();
	var parser = new hscript.Parser();

	public function new(script:String)
	{
		var program = parser.parseString(script);

		set("Paths", Paths);
		set("FlxSprite", FlxSprite);
		set("FlxG", FlxG);
		set("Color", Color);
		set("PlayState", PlayState.init);
		set("add", function(object:flixel.FlxBasic)
		{
			PlayState.init.add(object);
		});
		set("remove", function(object:flixel.FlxBasic)
		{
			PlayState.init.remove(object);
		});
		set("makeBG", StageFunction.makeBG);
		set("makeAnimateBG", StageFunction.makeAnimateBG);
		set("playSound", function(nameFile:String, loudInt:Float = 0.4)
		{
			SoundFunction.play(nameFile, loudInt);
		});
		set("playRandomSound", function(filename:String, min:Int, max:Int, loudInt:Float = 0.4)
		{
			SoundFunction.playRandom(filename, min, max, loudInt);
		});
		set("playMusic", function(filename:String, loudInt:Float = 0.4, looped:Bool = false)
		{
			SoundFunction.playMusic(filename, loudInt, looped);
		});

		set("CreateFunction", StageFunction.createFunc);
		set("UpdateFunction", StageFunction.updateFunc);

		try
		{
			trace(interp.execute(program));
			interp.execute(program);
		}
		catch (e:Dynamic)
		{
			trace("Error loading stage:\n" + e);
			lime.app.Application.current.window.alert("Error loading stage:\n" + e, "Error Loading Stage!");
		}
	}

	inline function set(key:String, value:Dynamic)
	{
		return interp.variables.set(key, value);
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
