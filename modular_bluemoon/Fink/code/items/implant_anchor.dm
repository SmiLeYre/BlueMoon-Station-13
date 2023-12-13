/obj/item/implant/anchor
	name = "anchor implant"
	desc = "Prevents you from leaving guarded buy you local sector."
	var/base_z_level


/obj/item/implant/anchor/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Employee Anchor Implant<BR>
				<b>Implant Details:</b> The onboard gateway system has been modified to reject entry by individuals containing this implant<BR>"}
	return dat

/obj/item/implanter/anchor
	name = "Implanter (anchor)"
	imp_type = /obj/item/implant/anchor

/obj/item/implantcase/anchor
	name = "implant case - 'anchor'"
	desc = "A glass case containing an anchor implant."
	imp_type = /obj/item/implant/anchor

/obj/item/implant/anchor/Initialize()
	. = ..()
	var/base_z_level = imp_in.z
	return base_z_level

	//ниже указан шаблон имплантации раундстартом, вставить в желаемую гостроль
	//var/mob/living/M = mob_override || owner.current
	//M.faction |= ROLE_???
	//var/obj/item/implant/anchor/Implant = new/obj/item/implant/anchor(M)

/obj/item/implant/anchor/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if (.)
		RegisterSignal(target, COMSIG_LIVING_LIFE, .proc/on_life)
		var/base_z_level = target.z
	return base_z_level



/obj/item/implant/anchor/proc/on_life(mob/living/owner, base_z_level) //mob/living/owner
	if((owner.z != base_z_level) && (owner.z != 1)) // не сектор спавна и не сектор цк?
		owner.visible_message("<span class='rose'>I don`t feeling well leaving my local sector.</span>")
		owner.adjustBruteLoss(0.4, FALSE) //Provides slow harassing for both brute and burn damage.
		owner.adjustFireLoss(0.4, FALSE)
