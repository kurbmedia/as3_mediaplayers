package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	import com.kurbmedia.mediaplayers.drawing.DrawingObject;
	
	public class ProgressBar extends Sprite{
		
		public 	  var progress_indicator;
		protected var player_data;
		
		private   var border;
		
		public function ProgressBar(){
			addEventListener(Event.ADDED_TO_STAGE, _listen);			
		}
		

		private function _listen(e:Event){
			MovieClip(root).addEventListener(PlayerEvent.CONSTRUCT_COMPLETE, setup_control);
		}
		
		private function setup_control(e:PlayerEvent){
			
			player_data = MovieClip(root).control_styles(this.name);
			MovieClip(root).removeEventListener(PlayerEvent.CONSTRUCT_COMPLETE, setup_control);
			
			if(player_data.strokeColor != undefined || player_data.stroke != undefined){
				for(var i = 0; i < numChildren; i++){
					if(getQualifiedClassName(getChildAt(i)) == "flash.display::Shape") removeChild(getChildAt(i));
				}
				
				var stroke     = parseInt(player_data.stroke);
				var line_color = (player_data.strokeColor == undefined) ? "0x000000" : player_data.strokeColor;
				
				border = new Sprite();
				border.graphics.lineStyle(stroke, uint(line_color), 1, true);
				border.graphics.drawRect(0,0, this.width, this.height);
				addChild(border);
			}
			
			if(player_data.backgroundColor != undefined){
				var drawer = new DrawingObject();
				drawer.draw(0,0,progress_indicator.width,progress_indicator.height, player_data);
				
				progress_indicator.graphics.clear();
				progress_indicator.addChild(drawer);
				progress_indicator.scaleX = 0;
			}
		}
		
		public function update_progress(new_progress:Number){
			if(new_progress > 1) new_progress = 1 / new_progress;
			progress_indicator.scaleX = new_progress;
		}
						
	}
	
}