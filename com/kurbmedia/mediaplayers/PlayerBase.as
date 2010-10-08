package com.kurbmedia.mediaplayers{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.IOErrorEvent;
	import flash.events.Event;
	
	import com.kurbmedia.utils.XmlParser;
	import com.kurbmedia.mediaplayers.events.PlayerEvent;	
	import com.kurbmedia.mediaplayers.drawing.DrawingObject;
	import com.kurbmedia.mediaplayers.controls.*;
	
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.xml.*;
	
	public class PlayerBase extends MovieClip{
		
		protected var player_base:DrawingObject;
		public    var player_data:Object;
		
		public var play_pause_button:PlayPauseButton;
		public var play_button:PlayButton;
		public var pause_button:PauseButton;
		public var progress_bar:ProgressBar;
		public var mute_button:MuteButton;
		public var timer_text:TextField;
		
		protected var has_metadata:Boolean = false;
		protected var is_playing:Boolean   = false;
		
		public function PlayerBase(){	
			
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
			
			var xml_loader = new URLLoader();			
			xml_loader.addEventListener(Event.COMPLETE, process_data);
			//xml_loader.load(new URLRequest('../configs/audio_player.xml'));
			xml_loader.load(new URLRequest(root.loaderInfo.parameters.xmlPath));
			
		}
		

		protected function has_control(control_name:String):Boolean{
			for(var i = 0; i < player_data.controls.length; i++) if(player_data.controls[i].name == control_name) return true;
			return false;
		}
		
		public function control_styles(control_name:String):Object{
			var defaults = player_data.defaults;
			var styles = {};
			for(var i = 0; i < player_data.controls.length; i++) if(player_data.controls[i].name == control_name) styles = player_data.controls[i];
			for(i in styles) if(styles[i] == "") styles[i] = undefined;
			for(i in defaults) if(styles[i] == undefined && defaults[i] != "") styles[i] = defaults[i];
			return styles;
		}
		
		private function process_data(e:Event){
			XML.ignoreWhitespace = true;
			var parser = new XmlParser();
			player_data = parser.parse(new XML(e.target.data));
			player_data.file = { url:root.loaderInfo.parameters.file, autoPlay:root.loaderInfo.parameters.autoPlay };
			
			player_base   = new DrawingObject();
			player_base.x = player_base.y = 0;
			addChildAt(player_base, 0);
			
			player_base.draw(0,0, stage.stageWidth, stage.stageHeight, player_data.player);
			
			dispatchEvent(new PlayerEvent(PlayerEvent.CONSTRUCT_COMPLETE));
		}
		
		protected function metadata_loaded(e:*){
			has_metadata = true;
		}
		
		protected function load_error(e:IOErrorEvent){}
		
		protected function request_file(file_path:String):URLRequest{
			return new URLRequest(file_path);
		}
		
	}
	
}