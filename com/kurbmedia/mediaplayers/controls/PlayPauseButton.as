package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class PlayPauseButton extends ControlBase{
		
		public var play_button;
		public var pause_button;
		
		private var playing_state:Boolean = false;
		
		override protected function init_instance(){
			removeChild(pause_button);
			
			if(player_data.iconColor != undefined){
				var colorTransform:ColorTransform = play_button.transform.colorTransform;
				colorTransform.color = uint(player_data.iconColor);
				play_button.transform.colorTransform = pause_button.transform.colorTransform = colorTransform;
			}
			
			play_button.mouseEnabled = false;
			pause_button.mouseEnabled = false;
			
			MovieClip(_root).addEventListener(PlayerEvent.PAUSE_DATA, set_stop);
			MovieClip(_root).addEventListener(PlayerEvent.STOP_DATA, set_stop);
			MovieClip(_root).addEventListener(PlayerEvent.PLAY_DATA, set_play);
		}
		
		private function set_stop(e:PlayerEvent){
			playing_state = false;
			update_icons();
		}
		
		private function set_play(e:PlayerEvent){
			playing_state = true;
			update_icons();
		}
		
		override protected function click_event(e:MouseEvent):void{
			if(playing_state === false){
				dispatch_event(new PlayerEvent(PlayerEvent.PLAY_DATA));
				playing_state = true;
			}else{
				dispatch_event(new PlayerEvent(PlayerEvent.PAUSE_DATA));
				playing_state = false;
			}
			
			update_icons();
		}
		
		private function update_icons(){
			if(playing_state === false){
				if(contains(pause_button)) removeChild(pause_button);
				if(!contains(play_button)) addChild(play_button);	
			}else{
				if(contains(play_button)) removeChild(play_button);	
				if(!contains(pause_button)) addChild(pause_button);	
			}			
		}
		
	}
	
}