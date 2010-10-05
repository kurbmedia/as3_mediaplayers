package com.kurbmedia{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import com.kurbmedia.events.AudioEvent;
	import com.kurbmedia.configs.AudioConfig;
	
	public class AudioPlayer extends MovieClip{
		
		private var player_base:Sprite;
		public  var player_data:Object;
		
		private var _config:AudioConfig;
		
		public function AudioPlayer(){
			
			_config = new AudioConfig(stage, MovieClip(root));
			addEventListener(AudioEvent.RENDER_COMPLETE, _config.render_complete);
			
			player_data = {
				'backgroundColor':0xFFFFFF,
				'autoPlay':true,
				'borderRadius':'10',
				'file':undefined
			};
			
			if(root.loaderInfo.parameters.configure != undefined){
				for(var i in root.loaderInfo.parameters.configure) player_data[i] = root.loaderInfo.parameters.configure[i];
			}
			
			player_base = new Sprite();
			player_base.x = player_base.y = 0;
			
			if(player_data.strokeColor != undefined) player_base.graphics.lineStyle(1, uint(player_data.strokeColor));
			player_base.graphics.beginFill(uint(player_data.backgroundColor));

			if(player_data.borderRadius != undefined){
				player_base.graphics.drawRoundRect(0,0, stage.stageWidth, stage.stageHeight, player_data.borderRadius);
			}else{
				player_base.graphics.drawRect(0,0, stage.stageWidth, stage.stageHeight);
			}
			
			player_base.graphics.endFill();
			addChild(player_base);
			
		}
		
	}
	
}