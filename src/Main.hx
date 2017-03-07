package;

import flash.display.Sprite;
import flash.Lib;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.text.TextField;
import haxe.Timer;

/**
 * ...
 * @author Mike Sheridan
 */
class Main extends Sprite 
{
	private var mInit:Bool = false;

	private function onResize(event)
	{
		
	}
	
	private function init()
	{
		if (mInit) return;
		mInit = true;
	}
	
	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onStageAdd);
	}
	
	private function onStageAdd(event)
	{
		trace('Hi');
		removeEventListener(Event.ADDED_TO_STAGE, onStageAdd);
		stage.addEventListener(event.RESIZE, onResize);
		
		#if ios
			Timer.delay(init, 100); //ios 6
		#else
			init();
		#end
	}
	
	public static function main()
	{
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
		
		
	}
}
