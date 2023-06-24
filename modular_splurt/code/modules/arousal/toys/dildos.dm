/obj/item/dildo/flared/gigantic
	name 				= "Bitch Breaker"
	desc 				= "You can barely carry this thing! Meant for... \"advanced\" interrogation techniques."
	dildo_size 			= 4
	force				= 10
	attack_verb 		= list("penetrated", "slapped", "gaped", "prolapsed", "inseminated", "destroyed", "broke", "demolished", "whacked")
	hitsound = 'sound/weapons/klonk.ogg'

/obj/item/dildo/flared/gigantic/suicide_act(mob/living/user)
	if(do_after(user,45,target=src))
		user.visible_message("<span class='suicide'>[user] tears-up and gags as they try to deepthroat the [src]! WHY WOULD THEY DO THAT? It looks like [user.ru_who()] trying to commit suicide!!</span>")
		playsound(loc, 'sound/weapons/gagging.ogg', 50, 2, -1)
		user.Stun(400)
		user.adjust_blurriness(24)
		user.adjustOxyLoss(15)
	return MANUAL_SUICIDE
