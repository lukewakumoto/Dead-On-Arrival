/// @description Insert description here
// You can write your code in this editor
var _spark = instance_create_layer(x,y,"Bullets", obj_spark)
_spark.direction = direction - 180
if (penetration < 100 && distance_to_point(xstart,ystart) > dist_to_visible){
	instance_destroy();
}
