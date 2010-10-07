package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class PlayButton extends ControlBase{
		
		override protected function click_event(e:MouseEvent):void{
			dispatch_event(new PlayerEvent(PlayerEvent.PLAY_DATA));
		}
				
	}
	
}