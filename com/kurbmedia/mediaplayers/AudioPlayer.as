package com.kurbmedia.mediaplayers{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer; 
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	import com.kurbmedia.mediaplayers.configs.AudioConfig;
	
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class AudioPlayer extends PlayerBase{
			
		public var audio:Sound;	
		public var audio_channel:SoundChannel;
		public var audio_transform:SoundTransform;
		
		private var update_timer:Timer = null;
		private var audio_progress = 0;		
				
		public function AudioPlayer(){
			
			super(new AudioConfig(stage, MovieClip(root)));
			
			addEventListener(PlayerEvent.PLAY_DATA, _config.audio_playing);
			addEventListener(PlayerEvent.PAUSE_DATA, _config.audio_paused);
			addEventListener(PlayerEvent.STOP_DATA, _config.audio_stopped);
			addEventListener(PlayerEvent.MUTE_DATA, _config.audio_mute);
			addEventListener(PlayerEvent.UNMUTE_DATA, _config.audio_unmute);
			
			addEventListener(PlayerEvent.PLAY_DATA, play_audio);
			addEventListener(PlayerEvent.PAUSE_DATA, pause_audio);
			addEventListener(PlayerEvent.MUTE_DATA, mute_audio);
			addEventListener(PlayerEvent.UNMUTE_DATA, mute_audio);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.RENDER_COMPLETE));
			
			
			audio 		    = new Sound();
			audio_channel   = new SoundChannel();
			audio_transform = new SoundTransform(1,1);
			
			audio.load(request_file(player_data.file));
			enable_play_buttons(false);
			
			audio.addEventListener(ProgressEvent.PROGRESS, load_progress);  
			audio.addEventListener(Event.COMPLETE, load_complete);  
			audio.addEventListener(IOErrorEvent.IO_ERROR, load_error);  
			audio.addEventListener(Event.ID3, metadata_loaded);
			
			audio_channel.addEventListener(Event.SOUND_COMPLETE, update_complete);
			
			if(getChildByName('timer_text')) timer_text.text = "Loading....";
			
		}
		
		private function enable_play_buttons(dir:Boolean){
			
			var a = (dir == true) ? 1 : .5;
			
			if(getChildByName('play_pause_button')){
				play_pause_button.alpha   	   = a;
				play_pause_button.mouseEnabled = dir;
			}

			if(getChildByName('play_button')){
				play_button.alpha 		 = a;
				play_button.mouseEnabled = dir;
			}
		}
		
		private function load_progress(e:ProgressEvent){
			var percent:Number = Math.round(e.bytesLoaded / e.bytesTotal * 100);
			if((has_metadata || percent > 20) && !is_playing){
				if(getChildByName('progress_bar') || getChildByName('timer_text')){
					update_timer = new Timer(100);  
					update_timer.addEventListener(TimerEvent.TIMER, update_progress);  
					update_timer.start();
				}
				
				enable_play_buttons(true);				
				
				//dispatchEvent(new PlayerEvent(PlayerEvent.PLAY_DATA));
				//is_playing = true;
			}
		}
		
		private function load_complete(e:Event){}
		
		private function mute_audio(e:PlayerEvent){
			audio_transform.volume = (e.type == PlayerEvent.MUTE_DATA) ? 0 : 1;
			audio_channel.soundTransform = audio_transform;
		}
		
		private function play_audio(e:PlayerEvent){
			if(is_playing) return;
			audio_channel = audio.play(audio_progress);
			audio_channel.soundTransform = audio_transform;
			is_playing = true;
		}	
		
		private function pause_audio(e:PlayerEvent){
			audio_progress = audio_channel.position;
			audio_channel.stop();
			is_playing = false;
		}	
		
		private function update_complete(e:Event){
			dispatchEvent(new PlayerEvent(PlayerEvent.STOP_DATA));
			audio_progress = 0;
			
			// Fix the timer if we were using it.
			if(update_timer != null){
				update_timer.stop();
				update_timer.reset();
			}
		}
		
		private function update_progress(e:TimerEvent){
			
			if(getChildByName('timer_text')){
				var total_min = Math.floor(audio.length / 1000 / 60);  
				var total_sec = Math.floor(audio.length / 1000) % 60;  
				var curr_min  = Math.floor(audio_channel.position / 1000 / 60);  
				var curr_sec  = Math.floor(audio_channel.position / 1000) % 60;  

				if (total_sec < 10) total_sec = '0' + total_sec;  
				if (curr_sec < 10)  curr_sec  = '0' + curr_sec;  

				timer_text.text = (audio.id3.TIME != undefined || audio.bytesLoaded >= audio.bytesTotal) ? (curr_min + ':' + curr_sec + ' / ' + total_min + ':' + total_sec) : (curr_min + ':' + curr_sec + ' / --:--');
			}
			
			if(getChildByName('progress_bar')){
				if(audio.id3.TIME != undefined){
					progress_bar.update_progress(audio_channel.position / audio.length);
					return;
				}
				
				var durationloaded = audio.length;
				var bytesloaded    = audio.bytesLoaded;
				var byterate 	   = bytesloaded/durationloaded;

				var totalbytes    = audio.bytesTotal;
				var totalduration = totalbytes * byterate;
				
				if(audio.bytesLoaded >= audio.bytesTotal){
					audio.length
					progress_bar.update_progress(audio_channel.position / audio.length);
				}else{
					progress_bar.update_progress((audio_channel.position / totalduration) * 100);
				}				
				
			}
		}
		
	}
	
}