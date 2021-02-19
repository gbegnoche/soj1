if (!hideGUI) {
	// Draw hp
	var curHP = obj_Game.currentHP;
	var maxHP = obj_Game.maxHP;
	var counter = 1;
	while (counter <= maxHP) {
		draw_sprite_stretched(spr_HealthContainer, 0, 32 * counter, 32, 32, 32);
		if (counter <= curHP) {
			draw_sprite_stretched(spr_HealthFull, 0, 32 * counter, 32, 32, 32);
		}
		counter++;
	}
	if (!(curHP == floor(curHP))) {
		draw_sprite_stretched(spr_HealthHalf, 0, 32 * (floor(curHP) + 1), 32, 32, 32);
	}
}
