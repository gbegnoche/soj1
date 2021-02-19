/// @function create_player_attack_obj(x,y,damage)
/// @description Create an attack obj at the give coordinates
/// @param x
/// @param y
/// @param damage
function create_player_attack_obj(argument0, argument1, argument2) {

	var xx = argument0;
	var yy = argument1;
	var dam = argument2;

	var att = instance_create_depth(xx, yy, 0, obj_Attack);

	att.damage = dam;



}
