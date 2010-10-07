package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class PlayPauseButton extends ControlBase{
		
		public var play_button;
		public var pause_button;
		
		override protected function init_instance(){
			removeChild(pause_button);
			MovieClip(_root).addEventListener(PlayerEvent.STOP_DATA, set_stop);
		}
		
		private function set_stop(e:PlayerEvent){
			if(contains(pause_button)) removeChild(pause_button);
		}
		
		override protected function click_event(e:MouseEvent):void{
			if(contains(play_button)){
				removeChild(play_button);
				addChild(pause_button);
			}else{
				removeChild(pause_button);
				addChild(play_button);
			}
		}
		
	}
	
}