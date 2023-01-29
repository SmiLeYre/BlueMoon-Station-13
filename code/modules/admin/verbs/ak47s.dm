GLOBAL_VAR_INIT(terrorism, FALSE)
/client/proc/ak47s() // For when you just can't summon guns worthy of a firefight
	if(!SSticker.HasRoundStarted())
		alert("The game hasn't started yet!")
		return
	GLOB.terrorism = TRUE

//BLUEMOON CHANGES BEGIN
	var/choice = alert(src, "Только для арены или для всех?","Подумай дважды","Всех", "Арены")
	message_admins("[key_name_admin(holder)] активирует AK-47s для [choice]!")
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.stat == DEAD || !(H.client))
			continue
		if(choice != "Всех" && !istype(get_area(H), /area/centcom/evac))
			continue
		H.make_terrorism()

/mob/living/carbon/human/proc/make_terrorism()
	var/obj/item/gun/energy/laser/LaserAK/AK = new(src)
	if(!GLOB.terrorism)
		AK.flags_1 |= ADMIN_SPAWNED_1 //To prevent announcing
	SEND_SOUND(src, 'sound/misc/ak47s.ogg')
	to_chat(src, "<span class='boldannounce'><font size=6>МАТУШКА РОССИЯ ВООРУЖАЕТ ТОЛПУ!</font></span>")
//BLUEMOON CHANGES END
	put_in_hands(AK)
	AK.pickup(src) //For the stun shielding
