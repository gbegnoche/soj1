// Collision tilemap
tilemap = layer_tilemap_get_id("Collision");
// Bounding boxes for collision
spriteBBoxLeft = (sprite_get_bbox_left(sprite_index) - collisionXOffset) - sprite_get_xoffset(sprite_index) ;
spriteBBoxRight = (sprite_get_bbox_right(sprite_index) + collisionXOffset) - sprite_get_xoffset(sprite_index);
spriteBBoxBottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
spriteBBoxTop = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
