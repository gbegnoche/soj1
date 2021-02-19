var cam = view_get_camera(0);
var dis = min(view_get_wport(view_current), room_width);
var scrollArea = dis - camera_get_view_width(cam);
var spriteMoveDistance = (dis - sprite_get_width(backgroundSprite)) / scrollArea;
var pos = camera_get_view_x(cam);

layer_x("bl_Background", (pos * spriteMoveDistance));
