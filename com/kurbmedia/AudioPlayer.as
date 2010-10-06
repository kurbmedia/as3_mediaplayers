package com.kurbmedia{
	
	import flash.display.MovieClip;
	
	import com.kurbmedia.events.PlayerEvent;
	import com.kurbmedia.events.AudioEvent;
	import com.kurbmedia.configs.AudioConfig;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class AudioPlayer extends PlayerBase{
			
		public var audio:Sound;	
		public var audio_channel:SoundChannel;
		public var audio_transform:SoundTransform;
				
		public function AudioPlayer(){
			super(new AudioConfig(stage, MovieClip(root)));
			dispatchEvent(new PlayerEvent(PlayerEvent.RENDER_COMPLETE));
			
			audio 		    = new Sound();
			audio_channel   = new SoundChannel();
			audio_transform = new SoundTransform(1,1);
			
			audio.load(request_file(player_data.file));
			
		}
		
	}
	
}