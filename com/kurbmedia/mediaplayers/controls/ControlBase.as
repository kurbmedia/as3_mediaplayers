package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	import flash.utils.getDefinitionByName;
	
	import com.kurbmedia.mediaplayers.events.PlayerEvent;
	
	public class ControlBase extends MovieClip{
		
		protected var player_data;
		public    var icon;
		public 	  var placeholder;
		
		protected var bg_normal;
		protected var bg_hover;
		protected var bg_down;
		
		protected var _root;
		
		private var _down_state:Boolean = false;
		
		public function ControlBase(){
			stop();
			useHandCursor = buttonMode = true;
			addEventListener(Event.ADDED_TO_STAGE, _listen);			
		}
		
		protected function hover_state(e:MouseEvent):void{}
		protected function down_state(e:MouseEvent):void{}
		protected function up_state(e:MouseEvent):void{}
		protected function click_event(e:MouseEvent):void{}
		
		// This would be declared in a child if we need it to actually do something.
		protected function init_instance(){}
		
		private function _listen(e:Event){
			MovieClip(root).addEventListener(PlayerEvent.CONSTRUCT_COMPLETE, setup_control);
		}
		
		protected function dispatch_event(e:*){
			_root.dispatchEvent(e);
		}
		
		private function manage_states(e:MouseEvent){
			
			if(contains(bg_normal)) removeChild(bg_normal);
			if(contains(bg_hover)) removeChild(bg_hover); 
			if(contains(bg_down)) removeChild(bg_down); 
			
			switch(e.type){
				case MouseEvent.MOUSE_OVER:
					(_down_state === true) ? addChildAt(bg_down, 0) : addChildAt(bg_hover, 0);
				break;
				case MouseEvent.MOUSE_OUT: 
					(_down_state === true) ? addChildAt(bg_down, 0) : addChildAt(bg_normal, 0);
				break;
				case MouseEvent.MOUSE_DOWN:
					addChildAt(bg_down, 0); _down_state = true;
				break;
				case MouseEvent.MOUSE_UP:
					addChildAt(bg_normal, 0); _down_state = false;
				break;
				default: addChildAt(bg_normal, 0); _down_state = false;
			}
		}
		
		private function setup_control(e:Event){			
			
			player_data = MovieClip(root).player_data;
			_root = MovieClip(root);
			
			MovieClip(root).removeEventListener(PlayerEvent.CONSTRUCT_COMPLETE, setup_control);
			
			addEventListener(MouseEvent.MOUSE_OVER, hover_state);
			addEventListener(MouseEvent.MOUSE_OUT, hover_state);
			addEventListener(MouseEvent.MOUSE_DOWN, down_state);
			addEventListener(MouseEvent.MOUSE_UP, up_state);
			
			addEventListener(MouseEvent.MOUSE_OVER, manage_states);
			addEventListener(MouseEvent.MOUSE_OUT, manage_states);
			addEventListener(MouseEvent.MOUSE_DOWN, manage_states);
			addEventListener(MouseEvent.MOUSE_UP, manage_states);
			
			addEventListener(MouseEvent.MOUSE_UP, click_event);
			
			if(getChildByName('icon')){ 
				icon.buttonMode = icon.mouseEnabled = false;
				if(player_data.iconColor != undefined){
					var colorTransform:ColorTransform = icon.transform.colorTransform;
					colorTransform.color = uint(player_data.iconColor);
					icon.transform.colorTransform = colorTransform;
				}
			}
			
			if(getChildByName('placeholder')) removeChild(placeholder);
			
			var klass = getDefinitionByName('ButtonNormalState') as Class;
			bg_normal = new klass();
			
			klass 	  = getDefinitionByName('ButtonOverState') as Class;
			bg_hover  = new klass();
			
			klass 	  = getDefinitionByName('ButtonDownState') as Class;
			bg_down   = new klass();
			
			bg_normal.x = bg_down.x = bg_hover.x = 0;
			bg_normal.y = bg_down.y = bg_hover.y = 0;
			
			bg_normal.draw(player_data.buttonColor);
			bg_hover.draw(player_data.buttonHoverColor);
			bg_down.draw(player_data.buttonDownColor);
			
			addChildAt(bg_normal, 0);
			
			this.init_instance();
			
		}
		
	}
	
}