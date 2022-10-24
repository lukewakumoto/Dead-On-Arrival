// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_event_register(event, id, script){
	with(obj_event_manager){
		
		
		if (!ds_map_exists(eventMap, event)){
			// if the event doesn't exist, we add it to the event map
			var listenerList = ds_list_create();
			
			// add the listener info to the event map
			ds_map_add_list(eventMap,event, listenerList)
		} else{
			var listenerList = eventMap[? event];	
		}
		
		// add listener info
		var listenerInfo;
		
		// add listener ID
		listenerInfo[0] = id
		
		// add script and arguments
		var arg_len = argument_count - 2;
		for (var i = 0; i < arg_len; i ++){
			listenerInfo[i + 1] = argument[i + 2]
			i++;
		}
		
		// add listner info to the list
		ds_list_add(listenerList, listenerInfo)
	}
}