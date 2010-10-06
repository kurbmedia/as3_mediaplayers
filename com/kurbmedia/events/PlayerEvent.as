package com.kurbmedia.events{
	
	import flash.events.Event;
	
	public class PlayerEvent extends Event{
		
		public static const RENDER_COMPLETE:String    = "PlayerEvent.RENDER_COMPLETE";
		public static const CONSTRUCT_COMPLETE:String = "PlayerEvent.CONSTRUCT_COMPLETE";
	
		public var object:*;
	
		public function PlayerEvent(val:String, obj = null){
			object = obj;
			super(val, true, false);
		}
	}
	
}