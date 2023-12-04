/obj/item/toy/cards/deck
	icon = 'modular_splurt/icons/obj/toy.dmi'
	original_size = 54

/obj/item/toy/cards/deck/examine()
	. = ..()
	. += "<span class='notice'>Alt-click [src] to remove joker cards.</span>"

/obj/item/toy/cards/deck/populate_deck()
	. = ..()
	cards += "Monochrome Joker"
	cards += "Colorful Joker"

/obj/item/toy/cards/deck/AltClick(mob/living/user, obj/item/I)
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user), FALSE)) //, TRUE))
		return
	var/jokermono = cards.Remove("Monochrome Joker")
	var/jokercolor = cards.Remove("Colorful Joker")
	user.visible_message("[user] searches through the deck to remove joker cards.", "<span class='notice'>You search through the deck to remove joker cards.</span>")
	if(!(jokermono || jokercolor))
		to_chat(user, "<span class='warning'>There are no joker cards to remove!</span>")
		return
	if(jokermono && jokercolor)
		var/obj/item/toy/cards/singlecard/H1 = new/obj/item/toy/cards/singlecard(user.loc)
		var/obj/item/toy/cards/singlecard/H2 = new/obj/item/toy/cards/singlecard(user.loc)
		if(holo)
			holo.spawned += H1 // track them leaving the holodeck
			holo.spawned += H2
		H1.cardname = "Monochrome Joker"
		H2.cardname = "Colorful Joker"
		H1.parentdeck = src
		H2.parentdeck = src
		var/O = src
		H1.apply_card_vars(H1,O)
		H2.apply_card_vars(H2,O)
		var/obj/item/toy/cards/cardhand/C = new/obj/item/toy/cards/cardhand(user.loc)
		C.currenthand += H1.cardname
		C.currenthand += H2.cardname
		C.parentdeck = H1.parentdeck
		C.apply_card_vars(C,H1)
		qdel(H1)
		qdel(H2)
		C.pickup(user)
		user.put_in_active_hand(C)
	else if(jokermono || jokercolor)
		var/obj/item/toy/cards/singlecard/H = new/obj/item/toy/cards/singlecard(user.loc)
		if(holo)
			holo.spawned += H // track them leaving the holodeck
		if(jokermono)
			H.cardname = "Monochrome Joker"
		else
			H.cardname = "Colorful Joker"
		H.parentdeck = src
		var/O = src
		H.apply_card_vars(H,O)
		H.pickup(user)
		user.put_in_active_hand(H)
		update_icon()

/obj/item/toy/cards/cardhand
	icon = 'modular_splurt/icons/obj/toy.dmi'

/obj/item/toy/cards/singlecard
	icon = 'modular_splurt/icons/obj/toy.dmi'
