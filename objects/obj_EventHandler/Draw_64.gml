if (!ds_queue_empty(eventQueue)) {
	var item = ds_queue_head(eventQueue);
	if (variable_struct_exists(item, "draw_gui")) {
		item.draw_gui();
	}
}
