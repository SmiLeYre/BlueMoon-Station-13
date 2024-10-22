/atom/movable/screen/fullscreen/dimmer
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "black"
	alpha = 200
	plane = ESCAPE_MENU_PLANE
	layer = ESCAPE_MENU_DIMMER_LAYER
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	clear_with_screen = FALSE


/atom/movable/screen/fullscreen/dimmer/right
	screen_loc = "hud:LEFT,TOP to LEFT,TOP-15"

/atom/movable/screen/fullscreen/dimmer/bottom
	screen_loc = "bottom:LEFT,TOP to LEFT+18,TOP"
