/obj/item/stack/telecrystal
	name = "Telecrystal"
	desc = "Red bluespace crystals..? No... red crystals... what?"
	singular_name = "telecrystal"
	icon_state = "telecrystal"
	icon = 'icons/obj/telescience.dmi'
	grind_results = list(/datum/reagent/telecrystal = 20)
	w_class = WEIGHT_CLASS_TINY
	max_amount = 50
	item_flags = NOBLUDGEON
	novariants = FALSE

/obj/item/stack/telecrystal/attack(mob/target, mob/user)
	if(target == user && isliving(user)) //You can't go around smacking people with crystals to find out if they have an uplink or not.
		var/mob/living/L = user
		for(var/obj/item/implant/uplink/I in L.implants)
			if(I?.imp_in)
				var/datum/component/uplink/hidden_uplink = I.GetComponent(/datum/component/uplink)
				if(hidden_uplink)
					hidden_uplink.telecrystals += amount
					use(amount)
					to_chat(user, "<span class='notice'>You press [src] onto yourself and charge your hidden uplink.</span>")
	else
		return ..()

/obj/item/stack/telecrystal/five
	amount = 5

/obj/item/stack/telecrystal/twenty
	amount = 20

/obj/item/stack/telecrystal/inteq
	name = "Credit"
	desc = "This is money. Dirty money.."
	singular_name = "credit"
	icon_state = "credit"
	novariants = TRUE

/obj/item/stack/telecrystal/inteq/five
	amount = 5

/obj/item/stack/telecrystal/inteq/twenty
	amount = 20
