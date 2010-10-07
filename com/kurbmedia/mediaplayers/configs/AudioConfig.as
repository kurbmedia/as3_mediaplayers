package com.kurbmedia.mediaplayers.configs{
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class AudioConfig{
		
		private var __stage;
		private var __root;
		
		// You shouldn't need to change this function. This provides a way to access both the stage
		// and the root of the movie.
		
		public function AudioConfig(stage_instance, root_instance){
			__stage = stage_instance;
			__root  = root_instance;
		}
		
		// This function is called when the stage is finished drawing all elements based on the passed configuration.
		
		public function render_complete(e:PlayerEvent){
			
		}
		
		// This function is called any time the audio is paused.
		
		public function audio_paused(e:PlayerEvent){
			
		}
		
		// This function is called any time the audio is told to play, this includes initial play and un-pause.
		
		public function audio_playing(e:PlayerEvent){
			
		}
		
		// This function is called any time the audio is explicitly stopped (not paused).
		
		public function audio_stopped(e:PlayerEvent){
			
		}
		
		// This function is called any time the audio is muted.
		
		public function audio_mute(e:PlayerEvent){
			
		}
		
		// This function is called any time the audio is un-muted.
		
		public function audio_unmute(e:PlayerEvent){
			
		}
		
	}
	
}