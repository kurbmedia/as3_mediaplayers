package com.kurbmedia.mediaplayers.events{
	
	import flash.events.Event;
	
	public class PlayerEvent extends Event{
		
		public static const RENDER_COMPLETE:String    = "PlayerEvent.RENDER_COMPLETE";
		public static const CONSTRUCT_COMPLETE:String = "PlayerEvent.CONSTRUCT_COMPLETE";
		public static const PLAY_DATA:String 		  = "PlayerEvent.PLAY_DATA";
		public static const PAUSE_DATA:String 		  = "PlayerEvent.PAUSE_DATA";
		public static const STOP_DATA:String 		  = "PlayerEvent.STOP_DATA";
		public static const MUTE_DATA:String 		  = "PlayerEvent.MUTE_DATA";
		public static const UNMUTE_DATA:String		  = "PlayerEvent.UNMUTE_DATA";
		public static const CHANGE_VOLUME:String 	  = "PlayerEvent.CHANGE_VOLUME";
	
		public var object:*;
	
		public function PlayerEvent(val:String, obj = null){
			object = obj;
			super(val, true, false);
		}
	}
	
}