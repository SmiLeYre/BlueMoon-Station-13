/obj/item/shigu_kit
	name = "Butcher Knife Kit"
	desc = "A modkit for making a Butcher Knife into a Shigu Knife."
	icon = 'icons/obj/vending_restock.dmi'
	icon_state = "refill_donksoft"
	var/product = /obj/item/kitchen/knife/butcher/shigu_knife //what it makes
	var/list/fromitem = list(/obj/item/kitchen/knife/butcher) //what it needs

/obj/item/shigu_kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

/obj/item/kitchen/knife/butcher/shigu_knife
	name = "Shigu Butcher Knife"
	desc = "A ultra-sharp butcher knife. Maybe his seemingly glaring surface can scare!"
	icon_state = "Shigu_Knife"
