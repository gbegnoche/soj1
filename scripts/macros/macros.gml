#macro EVENT_QUEUE obj_EventHandler.eventQueue
#macro PLAYER_NAME ds_map_find_value(obj_Game.saveData, "name")
#macro SAVE_DATA obj_Game.saveData
#macro INVENTORY obj_Game.inventory
#macro SAVE_FILE ds_map_find_value(obj_Game.saveData, "save file")
#macro PAUSE obj_Game.pause = true
#macro UNPAUSE obj_Game.pause = false
#macro PLAYER_X obj_Player.x
#macro PLAYER_Y obj_Player.y
#macro MENU_LIST obj_MenuHandler.menuList
#macro SCREEN_CENTER_X (view_get_wport(view_current) / 2)
#macro SCREEN_CENTER_Y (view_get_hport(view_current) / 2)
