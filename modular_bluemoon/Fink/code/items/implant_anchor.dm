/obj/item/implant/anchor
	name = "anchor implant"
	desc = "Prevents you from leaving local sector, guarded by you."
	removable = FALSE
	var/list/allowed_z_levels


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

/obj/item/implant/anchor/proc/Setsectors()
	allowed_z_levels = list(1,6,12,src.z) // dynamic набор: цк, ксено межшатолье, инфдормы, сектор имплантации
	if(GLOB.master_mode == "Extended")
		allowed_z_levels.Add(2,5) // экстовая добавка: станционный, шахта
	return allowed_z_levels

/obj/item/implant/anchor/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	RegisterSignal(imp_in, COMSIG_LIVING_LIFE, .proc/on_life)
	ADD_TRAIT(target, TRAIT_ANCHOR, "implant")
	target.sec_hud_set_implants()
	return TRUE


/obj/item/implant/anchor/proc/on_life(mob/living/owner)
	if(!(allowed_z_levels))
		allowed_z_levels = Setsectors()
//	to_chat(owner, "<span class='rose'>allowed_z_levels [allowed_z_levels], owner.z [owner.z] </span>")
//	to_chat(owner, "<span class='rose'>Tick</span>")
	if(!(owner.z in allowed_z_levels))
		to_chat(owner, "<span class='warning'>Больно!</span>")
		owner.adjustBruteLoss(2.5, FALSE) //Provides slow harassing for both brute and burn damage.
		owner.adjustFireLoss(2.5, FALSE)
		to_chat(owner, "<span class='warning'>Мне становится плохо при отдалении от своего родного сектора....</span>")
