package com.kurbmedia.configs{
	
	import com.kurbmedia.events.AudioEvent;
	
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
		
		public function render_complete(e:AudioEvent){
			
		}
		
		// This function is called when the audio initially starts playing, or any time audio
		// starts or is re-started from the beginning.
		
		public function audio_start(e:AudioEvent){
			
		}
		
		// This function is called any time the audio is paused.
		
		public function audio_paused(e:AudioEvent){
			
		}
		
		// This function is called any time the audio is un-paused.
		
		public function audio_unpaused(e:AudioEvent){
			
		}
		
		// This function is called any time the audio is explicitly stopped (not paused).
		
		public function audio_stopped(e:AudioEvent){
			
		}
		
		// This function is called any time the audio is muted.
		
		public function audio_mute(e:AudioEvent){
			
		}
		
		// This function is called any time the audio is un-muted.
		
		public function audio_unmute(e:AudioEvent){
			
		}
		
	}
	
}