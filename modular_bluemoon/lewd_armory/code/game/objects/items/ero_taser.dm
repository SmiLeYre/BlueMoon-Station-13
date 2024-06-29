/obj/item/gun/energy/e_gun/erotaser
	name = "dominatrix taser"
	desc = "This weapon uses an condensed energy in a cartridge to propel electric-charged projectiles. After hitting the target's body, it conducts a stimulating effect on most vulnerable nerve endings​. <span class='boldnotice'>Can be used only on those, who want to be non-coned.</span>​"
	icon = 'modular_bluemoon/lewd_armory/icons/obj/guns/energy.dmi'
	icon_state = "erotaser"
	ammo_type = list(/obj/item/ammo_casing/energy/erodisabler)
	ammo_x_offset = 2
	// Not enough guns have altfire systems like this yet for this to be a universal framework.
	var/last_altfire = 0
	var/altfire_delay = CLICK_CD_RANGE
