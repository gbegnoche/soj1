/// @function create_deactivated_instance(object)
/// @description Create an object and immediately deactivate
/// @param object Object to create
function create_deactivated_instance(argument0) {

	var obj = argument0;

	var ins = instance_create_layer(0, 0, "il_Actors", obj);
	instance_deactivate_object(ins);

	return ins;



}
