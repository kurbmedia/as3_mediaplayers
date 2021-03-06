package com.kurbmedia.mediaplayers.drawing{
	
	import flash.display.Sprite;
	import flash.geom.*
	
	public class DrawingObject extends Sprite{
		
		public function DrawingObject(){}
		
		public function draw(_x, _y, _w, _h, player_data:Object){
						
			if(player_data.strokeColor != undefined || player_data.stroke != undefined){ 
				
				var stroke     = parseInt(player_data.stroke);
				var line_color = (player_data.strokeColor == undefined) ? "0x000000" : player_data.strokeColor;
				
				if(stroke > 0){
					this.graphics.lineStyle(stroke, uint(line_color), 1, true);
					_w = _w - stroke;
					_h = _h - stroke;
					if(stroke > 1) _x = _x + (stroke / 2);
					if(stroke > 1) _y = _y + (stroke / 2);
				}
			}
			
			if(player_data.backgroundColor != undefined){
				var bgcolor = convert_to_uint(player_data.backgroundColor)
			
				if(bgcolor is Array){
					var matr:Matrix = new Matrix();
					matr.createGradientBox(_w,_h,90,0,0);
					this.graphics.beginGradientFill('linear', bgcolor, [1,1], [0x00, 0xFF], matr);
				}else{
					this.graphics.beginFill(bgcolor);
				}		
			}

			if(player_data.borderRadius != undefined){
				this.graphics.drawRoundRect(_x, _y, _w, _h, player_data.borderRadius);
			}else{
				this.graphics.drawRect(_x, _y, _w, _h);
			}
			
			this.graphics.endFill();
		}
		
		protected function convert_to_uint(color){
			var colors = color.toString().split(',');
			if(colors.length > 1){
				for(var i=0; i< colors.length; i++) colors[i] = uint(colors[i]);
				return colors;
			}else{
				return uint(color);
			}
		}
		
	}
	
}