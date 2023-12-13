/obj/item/implant/anchor
	name = "anchor implant"
	desc = "Prevents you from leaving local sector, guarded by you."
	var/base_z_level

/obj/item/implant/anchor/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Employee Anchor Implant<BR>
				<b>Implant Details:</b> Prevents implanted from leaving local sector, guarded by you.<BR>"}
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

	//шаблон имплантации раундстартом, вставить в желаемую гостроль
	//var/mob/living/M = mob_override || owner.current
	//M.faction |= ROLE_???
	//var/obj/item/implant/anchor/Implant = new/obj/item/implant/anchor(M)

/obj/item/implant/anchor/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if (.)
		RegisterSignal(target, COMSIG_LIVING_LIFE, .proc/on_life)


/obj/item/implant/anchor/proc/on_life(mob/living/owner, base_z_level)
	if((owner.z != base_z_level) && (owner.z != 1)) // не сектор спавна и не сектор цк?
		to_chat(owner, "<span class='rose'>It hurts!</span>")
		owner.adjustBruteLoss(0.5, FALSE) //Provides slow harassing for both brute and burn damage.
		owner.adjustFireLoss(0.5, FALSE)
		to_chat(owner, "<span class='rose'>I don`t feeling well leaving my local sector.</span>")
