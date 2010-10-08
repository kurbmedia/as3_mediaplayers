package com.kurbmedia.mediaplayers{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer; 
	import flash.text.TextFormat;
	import flash.text.TextField;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class VideoPlayer extends PlayerBase{
			
		public var flv_player:FLVPlayBack;	
				
		public function VideoPlayer(){
			addEventListener(PlayerEvent.CONSTRUCT_COMPLETE, init_player);
			super();			
		}
		
		private function init_player(e:PlayerEvent){
			
			addEventListener(PlayerEvent.PLAY_DATA, play_video);
			addEventListener(PlayerEvent.PAUSE_DATA, pause_video);
			addEventListener(PlayerEvent.MUTE_DATA, mute_video);
			addEventListener(PlayerEvent.UNMUTE_DATA, mute_video);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.RENDER_COMPLETE));
			
			
		}
		
		private function enable_play_buttons(dir:Boolean){
			
			var a = (dir == true) ? 1 : .5;
			
			if(has_control('play_pause_button')){
				play_pause_button.alpha   	   = a;
				play_pause_button.mouseEnabled = dir;
			}

			if(has_control('play_button')){
				play_button.alpha 		 = a;
				play_button.mouseEnabled = dir;
			}
		}
		
		
		private function mute_video(e:PlayerEvent){
		}
		
		private function play_video(e:PlayerEvent){
		}	
		
		private function pause_video(e:PlayerEvent){
		}	
		
	}
	
}