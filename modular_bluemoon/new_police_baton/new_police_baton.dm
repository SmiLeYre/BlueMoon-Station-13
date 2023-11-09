/obj/item/melee/classic_baton/peacekeeper
	name = "peacekeeper baton"
	desc = "A police baton made of hard resin. Designed specificly to enforce with violence and pain."
	icon = 'modular_bluemoon/new_police_baton/peacekeeper_baton.dmi' // sprites from Gandalf2k15 (https://github.com/Skyrat-SS13/Skyrat-tg/pull/2860)
	icon_state = "peacekeeper_baton"
	item_state = "peacekeeper_baton"
	lefthand_file = 'modular_bluemoon/new_police_baton/peacekeeper_baton_lefthand.dmi'
	righthand_file = 'modular_bluemoon/new_police_baton/peacekeeper_baton_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 10 // У обычной дубинки 12
	w_class = WEIGHT_CLASS_NORMAL

	stam_dmg = 20
	cooldown = 0
	on_stun_sound = 'sound/effects/woodhit.ogg' // Default path to sound for when we stun.

	wound_bonus = 0
	can_knockdown = FALSE
