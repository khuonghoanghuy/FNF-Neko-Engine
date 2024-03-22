package hscript;

import flixel.FlxSprite;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import state.PlayState;

class StageFunction
{
	public static function makeBG(paths:String, xPos:Float, yPos:Float, scale:Float, flipx:Bool = false, flipy:Bool = false, scrollFactorX:Float = 1,
			scrollFactorY:Float = 1)
	{
		var aBg:FlxSprite = new FlxSprite(xPos, yPos, Paths.image(paths));
		aBg.scale.set(scale, scale);
		aBg.flipX = flipx;
		aBg.flipY = flipy;
		aBg.scrollFactor.set(scrollFactorX, scrollFactorY);
		PlayState.init.add(aBg);
	}

	// test
	public static function makeAnimateBG(paths:String, xPos:Float, yPos:Float, scale:Float, flipx:Bool = false, flipy:Bool = false, scrollFactorX:Float = 1,
			scrollFactorY:Float = 1, animationName:String, animationPrefix:String)
	{
		var aBg:FlxSprite = new FlxSprite(xPos, yPos);
		aBg.scale.set(scale, scale);
		aBg.flipX = flipx;
		aBg.flipY = flipy;
		aBg.scrollFactor.set(scrollFactorX, scrollFactorY);
		aBg.frames = Paths.getSparrowAtlas(paths);
		aBg.animation.addByPrefix(animationName, animationPrefix, 24, false);
		aBg.animation.play(animationName);
		// coolBgAnimatedPlayed.push(animationName);
		PlayState.init.add(aBg);
	}

	public static function createFunc(code:String):Dynamic
	{
		// will callback when a new state load
		return StageCode.execute(code);
	}

	public static function updateFunc(code:String):Dynamic
	{
		// Update function using a timer instead of elapsed time
		var timer:Timer = new Timer(100); // Adjust interval as needed
		timer.addEventListener(TimerEvent.TIMER, function(e:TimerEvent)
		{
			StageCode.execute(code);
		});
		timer.start();
		return timer; // Return the timer for potential control/stopping
	}
}
