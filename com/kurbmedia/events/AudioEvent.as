package com.kurbmedia.events{
	
	import com.kurbmedia.events.PlayerEvent;
	
	public class AudioEvent extends PlayerEvent{
	
		public function AudioEvent(val:String, obj = null){
			object = obj;
			super(val, object);
		}
	}
	
}