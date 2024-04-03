/obj/item/ttsdevice
	name = "TTS device"
	desc = "A small device with a keyboard attached. Anything entered on the keyboard is played out the speaker. \n<span class='notice'>Ctrl-click the device to make it beep.</span> \n<span class='notice'>Ctrl-shift-click to name the device."
	icon = 'icons/obj/device.dmi'
	icon_state = "gangtool-purple"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	obj_flags = UNIQUE_RENAME

/obj/item/ttsdevice/attack_self(mob/user)
	user.balloon_alert_to_viewers("typing...", "started typing...")
	playsound(src, 'sound/items/tts/started_type.ogg', 50, TRUE)
	var/str = tgui_input_text(user, "What would you like the device to say?", "Say Text", "", MAX_MESSAGE_LEN, encode = FALSE)
	if(QDELETED(src) || !user.canUseTopic(src))
		return
	if(!str)
		user.balloon_alert_to_viewers("stops typing", "stopped typing")
		playsound(src, 'sound/items/tts/stopped_type.ogg', 50, TRUE)
		return
	src.say(str)
	str = null

/obj/item/ttsdevice/CtrlClick(mob/living/user)
	var/noisechoice = tgui_input_list(user, "Какой звук вы хотите воспроизвести?", "Робот-Звуки", list("БИИП","БЗЗЗ","ПИНГ"))
	if(noisechoice == "Beep")
		user.audible_message("активирует звук <b>БИИП</b> на своём ТТС!")
		playsound(user, 'sound/machines/twobeep.ogg', 50, 1, -1)
	if(noisechoice == "БЗЗЗ")
		user.audible_message("активирует звук <b>БЗЗЗ</b> на своём ТТС!")
		playsound(user, 'sound/machines/buzz-sigh.ogg', 50, 1, -1)
	if(noisechoice == "ПИНГ")
		user.audible_message("активирует звук <b>ПИНГ</b> на своём ТТС!")
		playsound(user, 'sound/machines/ping.ogg', 50, 1, -1)

/obj/item/ttsdevice/CtrlShiftClick(mob/living/user)
	var/new_name = reject_bad_name(tgui_input_text(user, "Name your Text-to-Speech device. This matters for displaying it in the chat bar.", "Set TTS Device Name", "", MAX_NAME_LEN))
	if(new_name)
		name = "[new_name]'s [initial(name)]"
	else
		name = initial(name)
