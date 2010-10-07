package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.Sprite;
	
	import com.kurbmedia.mediaplayers.drawing.DrawingObject;
	
	public class ButtonBase extends Sprite{
		
		public function ButtonBase(){}
		
		public function draw(colors){
			if(colors == undefined || colors == null) return;
			var new_base = new DrawingObject();
			new_base.draw(0,0,this.width, this.height, { backgroundColor:colors, borderRadius:5 });
			this.graphics.clear();
			addChild(new_base);
		}
		
	}
	
}