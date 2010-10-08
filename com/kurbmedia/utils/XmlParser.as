package com.kurbmedia.utils{
	
	import flash.xml.*;	
	
	public class XmlParser{

		private var return_object:Object;
		
		public function XmlParser(){}
		
		public function parse(xml_data:XML):Object{
			
			return_object = new Object();
			xml_data = xml_data[0];
			
			var node_list:XMLList = XMLList(xml_data.children());

			for(var i in node_list){
				
				var node = node_list[i];
				
				if(node_list[i].children().length() > 0){					
					if(node_list[i].children()[0].nodeKind() == "text"){
						return_object[node.name()] = node_list[i].children()[0].split("\n").join("").split("\t").join("");
					}else{
						return_object[node.name()] = array_from_node(node);
					}					
				}else{
					if(return_object[node.name()] != undefined && return_object[node.name()] != null){
						var current_object = return_object[node.name()];
						if(current_object is Array){
							return_object[node.name()].push(object_from_node(node));
						}else{
							return_object[node.name()] = new Array();
							return_object[node.name()].push(current_object);
						}						
												
					}else{
						return_object[node.name()] = object_from_node(node);
					}					
				}
			}
		
			return return_object;
		}
		
		private function array_from_node(node:XML):Array{
			
			var to_return:Array  = new Array();
			
			for(var i in node.children()){
																				
				if(node.children()[i].children().length() > 0){
					
					if(node.children()[i].children()[0].nodeKind() == "text"){
						to_return.push(node.children()[i].children()[0].split("\n").join("").split("\t").join(""));
					}else{
						to_return.push(array_from_node(node.children()[i]));
					}
					
				}else{
					to_return.push(object_from_node(node.children()[i]));
				}
			}
			
			return to_return;
		}
		
		private function object_from_node(node:XML):Object{
			
			var to_return:Object = new Object();
			
			for(var i in node.attributes()){
				var attr_name  = node.attributes()[i].name().toString();
				var attr_value = node.attribute(node.attributes()[i].name()).toString();
				 
				to_return[attr_name] = attr_value;
			}
			
			return to_return;
		}
		
	}
	
}