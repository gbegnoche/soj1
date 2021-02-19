/// @description Ensure correct layer
if (layer_exists("il_Actors")) {
	if (layer_get_name(layer) != "il_Actors") {
		layer = layer_get_id("il_Actors");
	}
}
