/obj/item/organ/internal/cyberimp/chest/scanner //Ported from skyrat
	name = "internal health analyzer"
	desc = "An advanced health analyzer implant, designed to directly interface with a host's body and relay scan information to the brain on command."
	slot = ORGAN_SLOT_THRUSTERS //BLUEEMOON EDIT: Now you have to choose. You can't be superior cyborg-ish lifeform. Seethe well. Doesn't cause an error anymore!
	icon = 'modular_bluemoon/0451/icons/implants/internal_HA.dmi'
	icon_state = "internal_HA"
	actions_types = list(/datum/action/item_action/organ_action/use)
	w_class = WEIGHT_CLASS_SMALL

/obj/item/organ/internal/cyberimp/chest/scanner/ui_action_click(owner, action)
	if(istype(action, /datum/action/item_action/organ_action/use))
		if(organ_flags & ORGAN_FAILING)
			to_chat(owner, span_warning("Your health analyzer relays an error! It can't interface with your body in its current condition!"))
			return
		else
			healthscan(owner, owner, 1, TRUE)
			chemscan(owner, owner)
