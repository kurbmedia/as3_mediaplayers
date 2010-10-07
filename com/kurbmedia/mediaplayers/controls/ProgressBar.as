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
			
			player_data = MovieClip(root).player_data;			
			MovieClip(root).removeEventListener(PlayerEvent.CONSTRUCT_COMPLETE, setup_control);
			
			if(player_data.progressBarStrokeColor != undefined){
				for(var i = 0; i < numChildren; i++){
					if(getQualifiedClassName(getChildAt(i)) == "flash.display::Shape") removeChild(getChildAt(i));
				}
				
				border = new Sprite();
				border.graphics.lineStyle(1, uint(player_data.progressBarStrokeColor));
				border.graphics.drawRect(0,0, this.width, this.height);
				addChild(border);
			}
			
			if(player_data.progressBarColor != undefined){
				var drawer = new DrawingObject();
				drawer.draw(0,0,progress_indicator.width,progress_indicator.height, { backgroundColor:player_data.progressBarColor });
				
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