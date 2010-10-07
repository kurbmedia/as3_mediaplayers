package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class MuteButton extends ControlBase{
		
		public var mute_button;
		public var unmute_button;
		
		override protected function init_instance(){
			
			if(player_data.iconColor != undefined){
				var colorTransform:ColorTransform = mute_button.transform.colorTransform;
				colorTransform.color = uint(player_data.iconColor);
				mute_button.transform.colorTransform = unmute_button.transform.colorTransform = colorTransform;
			}
			
			mute_button.mouseEnabled = false;
			unmute_button.mouseEnabled = false;
			removeChild(unmute_button);
		}
		
		override protected function click_event(e:MouseEvent):void{
			if(contains(mute_button)){
				removeChild(mute_button);
				addChild(unmute_button);
			}else{
				removeChild(unmute_button);
				addChild(mute_button);
			}
		}
				
	}
	
}