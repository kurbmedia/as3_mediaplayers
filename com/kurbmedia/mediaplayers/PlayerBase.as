package com.kurbmedia.mediaplayers{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.IOErrorEvent;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;	
	import com.kurbmedia.mediaplayers.drawing.DrawingObject;
	import com.kurbmedia.mediaplayers.controls.*;
	
	import flash.net.URLRequest;
	
	public class PlayerBase extends MovieClip{
		
		protected var player_base:DrawingObject;
		public    var player_data:Object;
		
		protected var _config;	
		
		public var play_pause_button:PlayPauseButton;
		public var play_button:PlayButton;
		public var pause_button:PauseButton;
		public var progress_bar:ProgressBar;
		public var mute_button:MuteButton;
		public var timer_text:TextField;
		
		protected var has_metadata:Boolean = false;
		protected var is_playing:Boolean   = false;
		
		public function PlayerBase(config){	

			_config = config;
			
			addEventListener(PlayerEvent.RENDER_COMPLETE, _config.render_complete);
			
			/*
				Player data variables:
				backgroundColor:String  		- Background color for player          
				borderRadius:int        		- Border radius of player              
				buttonColor:String				- Button background color              
				buttonHoverColor:String 		- Button background color on hover     
				buttonDownColor:String  		- Button background color on mouse_down
				iconColor:String				- Color of icons used on buttons       
				progressBarStrokeColor:String	- Color of progress bar outline
				progressBarColor:String			- Background color for actual progress bar
				file:String						- URL of the file to play
				autoPlay:Boolean				- Should the audio auto-play?
			*/


			player_data = new Object();
			
			if(root.loaderInfo.parameters.configure != undefined){
				for(var i in root.loaderInfo.parameters.configure) player_data[i] = root.loaderInfo.parameters.configure[i];
			}
			
			player_base   = new DrawingObject();
			player_base.x = player_base.y = 0;
			addChildAt(player_base, 0);
			
			player_base.draw(0,0, stage.stageWidth, stage.stageHeight, player_data);

			dispatchEvent(new PlayerEvent(PlayerEvent.CONSTRUCT_COMPLETE));
			
		}
		
		protected function request_file(file_path:String):URLRequest{
			return new URLRequest(file_path);
		}
		
		protected function metadata_loaded(e:*){
			has_metadata = true;
		}
		
		protected function load_error(e:IOErrorEvent){}
		
	}
	
}