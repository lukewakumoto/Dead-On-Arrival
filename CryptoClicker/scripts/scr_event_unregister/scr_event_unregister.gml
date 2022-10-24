// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_event_unregister(ev, objID){
	with(obj_event_manager){
		
		// get listeners
		if(ds_map_exists(eventMap, ev)){
			var listenerList = eventMap[? ev]
			var len = ds_list_size(listenerList)
			
			for (var i = 0; i < len; i ++){
				var listenerInfo = listenerList[| i]
				if (listenerInfo[0] == objID){
					if(len == 1){
						ds_list_destroy(listenerList)
						ds_map_delete(eventMap,ev)
					} else ds_list_delete(listenerList, i)
					break
				}
			}
		}
	}
}