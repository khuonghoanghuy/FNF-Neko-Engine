package backend;

import openfl.events.Event;
import openfl.system.System;
import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * From FPS class extension to display memory usage.
 * @author Kirill Poletaev
 */
class MoreCounter extends TextField
{
	private var times:Array<Float>;
	#if debug
	private var memPeak:Float = 0;
	#end

	public function new(inX:Float = 10.0, inY:Float = 10.0, inCol:Int = 0x000000)
	{
		super();

		x = inX;
		y = inY;
		selectable = false;
		defaultTextFormat = new TextFormat("_sans", 13, inCol, false, false, false, null, null, LEFT, null, null, null, null);
		// defaultTextFormat = new TextFormat("_sans", 14, inCol);

		addEventListener(Event.ENTER_FRAME, onEnter);
		width = 1280;
		height = 720;
	}

	private function onEnter(_)
	{
		var mem:Float = Math.round(System.totalMemory / 1024 / 1024 * 100) / 100;
		#if debug
		if (mem > memPeak)
			memPeak = mem;
		#end

		if (visible)
		{
			text = "\nMEM: " + mem + " MB";
			#if debug
			text += "\nMEM Peak: " + memPeak + " MB";
			text += "\nPlatform Label: " + lime.system.System.platformLabel;
			text += "\nPlatform Version: " + lime.system.System.platformVersion;
			#end
		}
	}
}
