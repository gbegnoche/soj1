if (!ds_queue_empty(eventQueue)) {
	PAUSE;
	var item = ds_queue_head(eventQueue);
	item.step();
	if (item.complete) {
		if (variable_struct_exists(item, "clean_up")) {
			item.clean_up();
		}
		ds_queue_dequeue(eventQueue);
		delete item;
		if (ds_queue_empty(eventQueue)) {
			UNPAUSE;
			exit;
		}
	}
}
