package com.kurbmedia.mediaplayers.controls{
	
	import flash.display.Sprite;
	
	import com.kurbmedia.mediaplayers.drawing.DrawingObject;
	
	public class ButtonBase extends Sprite{
		
		public function ButtonBase(){}
		
		public function draw(colors){
			if(colors == undefined || colors == null) return;
			var new_base = new DrawingObject();
			
			if(colors is String){
				new_base.draw(0,0,this.width, this.height, { backgroundColor:colors, borderRadius:5 });
			}else{
				colors.borderRadius = 5;
				new_base.draw(0,0,this.width, this.height, colors);
			}
			
			this.graphics.clear();
			addChild(new_base);
		}
		
	}
	
}