/obj/item/firing_pin/kaiju
	name = "kaiju firing pin" //Basically same as outback, but i changed so you cannot remove it
	desc = "You shouldn't have this."
	icon_state = "firing_pin_explorer"
	fail_message = "<span class='warning'>CANNOT FIRE WHILE ON STATION!</span>"
	pin_removeable = FALSE

// This checks that the user isn't on the station Z-level.
/obj/item/firing_pin/kaiju/pin_auth(mob/living/user)
	var/turf/station_check = get_turf(user)
	if(!station_check||is_station_level(station_check.z))
		return FALSE
	return TRUE
