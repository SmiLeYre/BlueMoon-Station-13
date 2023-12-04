/obj/item/reagent_containers/food/snacks/cheesewedge/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/cheesewedge/proc/splat(atom/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	if(!ishuman(hit_atom))
		return

	var/mutable_appearance/cheeseoverlay = mutable_appearance('modular_splurt/icons/effects/cheesed.dmi')
	var/mob/living/carbon/human/H = hit_atom
	if((H.dna.species.mutant_bodyparts["mam_snouts"] && H.dna.features["mam_snouts"] != "None") || (H.dna.species.mutant_bodyparts["snout"] && H.dna.features["snout"] != "None"))
		cheeseoverlay.icon_state = "cheesed_snout"
	else
		cheeseoverlay.icon_state = "cheesed_human"
	H.visible_message("<span class='warning'>[H] is cheesed by [src]!</span>", "<span class='userdanger'>You've been cheesed by [src]!</span>")
	playsound(H, 'modular_splurt/sound/effects/slap.ogg')
	if(!H.is_mouth_covered())
		reagents.trans_to(H, 15, log = "cheesed hit") //Cream pie combat
	if(!H.cheesed) // one layer at a time
		H.add_overlay(cheeseoverlay)
		H.cheesed = TRUE
		SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "cheesed", /datum/mood_event/creampie/cheesed)

	qdel(src)
