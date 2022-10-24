// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire(event_fire){
	with(obj_event_manager){
		// CHeck if there is an event entry
		if (ds_map_exists(eventMap, event_fire)){
			// Get listeners
			var listenerList = eventMap[? event_fire]
			
			var len = ds_list_size(listenerList)
				
				
			var listenerInfo, listener, script, args
			for (var i = 0; i < len; i ++){
				//Get variables for current listener
				listenerInfo = listenerList[| i];
				listener = listenerInfo[0]
				script = listenerInfo[1]
				
				var lenArgs = array_length(listenerInfo)-2
				var unregister = false
				
				if (lenArgs <= 0){
					if (instance_exists(listener)){
						show_debug_message("About to execute script")
						with (listener) script()
						show_debug_message("just executed script")
					} else unregister = true
					
				} else{
					if (instance_exists(listener)){
						args = array_create(lenArgs,0)	
						array_copy(args, 0, listenerInfo, 2, lenArgs)
						with(listener) unregister =  scr_script_execute_alt(script, args)
					} else unregister = true
				}
				
				if (unregister){
					//scr_event_unregister(event_fire, listener)	
					i--
				}
			}
		}
	}
}