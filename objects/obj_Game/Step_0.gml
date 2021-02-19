// Check health
if (currentHP <= 0 && !gameOver) {
	gameOver = true;
	pause = true
	instance_destroy(obj_Enemy);
	obj_Player.image_speed = 0;
}
