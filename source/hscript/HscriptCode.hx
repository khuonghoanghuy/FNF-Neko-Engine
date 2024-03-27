package hscript;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import object.Boyfriend;
import object.Character;
import state.PlayState;

using StringTools;

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

		// classes
		interp.variables.set("Math", Math);
		interp.variables.set("FlxG", FlxG);
		interp.variables.set("PlayState", PlayState.init);
		interp.variables.set("Game", PlayState.init);
		interp.variables.set("Color", Color);
		interp.variables.set("FlxSprite", FlxSprite);
		interp.variables.set('FlxCamera', FlxCamera);
		interp.variables.set("Paths", Paths);

		// global function
		interp.variables.set('setProperty', function(vari:String, value:String)
		{
			return Reflect.setProperty(playState, vari, value.split('.'));
		});

		// sprite function
		interp.variables.set("makeSprite", function(tag:String, sprites:String, x:Float = 0, y:Float = 0)
		{
			tag.replace('.', '');
			var sprite:FlxSprite = new FlxSprite(x, y);
			sprite.loadGraphic(Paths.image(sprites));
			PlayState.init.variableImage.set(tag, sprite);
			sprite.active = true;
		});
		interp.variables.set("setScaleSprite", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.variableImage.get(tag).scale.set(x, y);
				return;
			}
		});
		interp.variables.set("setScrollFactorSprite", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.variableImage.get(tag).scrollFactor.set(x, y);
				return;
			}
		});
		interp.variables.set("setPostionSprite", function(tag:String, x:Float = 0, y:Float = 0)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.variableImage.get(tag).setPosition(x, y);
				return;
			}
		});
		interp.variables.set("updateHitboxSprite", function(tag:String)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.variableImage.get(tag).updateHitbox();
				return;
			}
		});
		interp.variables.set("addSprite", function(tag:String)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.add(PlayState.init.variableImage.get(tag));
				return;
			}
		});
		interp.variables.set("removeSprite", function(tag:String)
		{
			if (PlayState.init.variableImage.exists(tag))
			{
				PlayState.init.remove(PlayState.init.variableImage.get(tag));
				PlayState.init.variableImage.remove(tag); // to remove them
				return;
			}
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
