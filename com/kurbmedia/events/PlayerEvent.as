package com.kurbmedia.events{
	
	import flash.events.Event;
	
	public class PlayerEvent extends Event{
		
		public static const RENDER_COMPLETE:String = "PlayerEvent.RENDER_COMPLETE";
	
		public var object:*;
	
		public function PlannerEvent(val:String, obj = null){
			object = obj;
			super(val, true, false);
		}
	}
	
}