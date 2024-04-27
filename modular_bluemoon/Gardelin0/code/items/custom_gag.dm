/obj/item/clothing/mask/muzzle/rag_gag
	name = "rag gag"
	desc = "To stop that awful noise, but dirty."
	icon = 'modular_bluemoon/Gardelin0/icons/clothing/object/masks.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	mob_overlay_icon = 'modular_bluemoon/Gardelin0/icons/clothing/worn/mask.dmi'
	icon_state = "raggag"
	item_state = "raggag"

/obj/item/clothing/mask/muzzle/rag_gag/verb/make_rag()
	set name = "Make rag"
	set category = "Object"
	set src in usr
	if(iscarbon(usr) && usr.get_item_by_slot(ITEM_SLOT_MASK) == src)
		to_chat(span_notice("You must take it off first!"))
		return
	else
		new /obj/item/reagent_containers/rag(usr.loc)
		qdel(src)

/obj/item/reagent_containers/rag/verb/make_gag()
	set name = "Make gag"
	set category = "Object"
	set src in usr

	new /obj/item/clothing/mask/muzzle/rag_gag(usr.loc)
	qdel(src)
