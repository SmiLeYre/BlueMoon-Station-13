/obj/item/stamp
	name = "\improper GRANTED rubber stamp"
	desc = "A rubber stamp for stamping important documents."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-ok"
	item_state = "stamp"
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	custom_materials = list(/datum/material/wood=60)
	pressure_resistance = 2
	attack_verb = list("stamped")

	var/on_paper_icon_state = "stamp-ok"

/obj/item/stamp/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] stamps 'VOID' on [user.ru_ego()] forehead, then promptly falls over, dead.</span>")
	return (OXYLOSS)

/obj/item/stamp/get_writing_implement_details()
	var/datum/asset/spritesheet/sheet = get_asset_datum(/datum/asset/spritesheet/simple/paper)
	return list(
		interaction_mode = MODE_STAMPING,
		stamp_icon_state = icon_state,
		stamp_class = sheet.icon_class_name(on_paper_icon_state)
	)

/obj/item/stamp/replica
	name = "rubber stamp replica"
	icon_state = "stamp-ok"
	var/item = ""
	var/list/quality_list = list("poorly made replica of ", "odd-looking ", "")
	var/list/quality_desc = list("It just hurts to look at.", "The oddly shaped handle looks slightly uncomfortable to hold.", "Something feels off here.")
	var/list/quality_stamps = list("stamp-ok", "stamp-ok", "stamp-ok")

/obj/item/stamp/replica/Initialize(mapload)
	. = ..()
	var/quality = rand(1, 3)
	name = "[quality_list[quality]][item] rubber stamp"
	desc = "A rubber stamp for stamping important documents. [quality_desc[quality]]"
	on_paper_icon_state = quality_stamps[quality]
	
/obj/item/stamp/replica/qm 
	name = "quartermaster's rubber stamp replica"
	item = "quartermaster's"
	quality_stamps = list("fake-gud-stamp-qm", "fake-mid-stamp-qm", "fake-bad-stamp-qm")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/law
	name = "law office rubber stamp replica"
	item = "law office"
	quality_stamps = list("fake-gud-stamp-law", "fake-mid-stamp-law", "fake-bad-stamp-law")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/captain
	name = "captain's rubber stamp replica"
	item = "captain's"
	quality_stamps = list("fake-gud-stamp-cap", "fake-mid-stamp-cap", "fake-bad-stamp-cap")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/command 
	name = "command rubber stamp replica"
	item = "command"
	quality_stamps = list("fake-gud-stamp-com", "fake-mid-stamp-com", "fake-bad-stamp-com")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/hop
	name = "head of personnel's rubber stamp replica"
	item = "head of personnel's"
	quality_stamps = list("fake-gud-stamp-hop", "fake-mid-stamp-hop", "fake-bad-stamp-hop")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/hos
	name = "head of security's rubber stamp replica"
	item = "security's"
	quality_stamps = list("fake-gud-stamp-hos", "fake-mid-stamp-hos", "fake-bad-stamp-hos")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/ce
	name = "chief engineer's rubber stamp replica"
	item = "chief engineer's"
	quality_stamps = list("fake-gud-stamp-ce", "fake-mid-stamp-ce", "fake-bad-stamp-ce")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/rd
	name = "research director's rubber stamp replica"
	item = "research director's"
	quality_stamps = list("fake-gud-stamp-rd", "fake-mid-stamp-rd", "fake-bad-stamp-rd")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/cmo
	name = "chef medical officer's rubber stamp replica"
	item = "chef medical officer's"
	quality_stamps = list("fake-gud-stamp-cmo", "fake-mid-stamp-cmo", "fake-bad-stamp-cmo")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/clown
	name = "clown's rubber stamp replica"
	item = "clown's"
	quality_stamps = list("fake-gud-stamp-clown", "fake-mid-stamp-clown", "fake-bad-stamp-clown")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/syndicate
	name = "syndicate rubber stamp replica"
	item = "syndicate"
	quality_stamps = list("fake-gud-stamp-syndicate", "fake-mid-stamp-syndicate", "fake-bad-stamp-syndicate")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/ntr
	name = "NanoTrasen rubber stamp replica"
	item = "NanoTrasen"
	quality_stamps = list("fake-gud-stamp-ntr", "fake-mid-stamp-ntr", "fake-bad-stamp-ntr")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/warden
	name = "warden's rubber stamp replica"
	item = "warden's"
	quality_stamps = list("fake-gud-stamp-warden", "fake-mid-stamp-warden", "fake-bad-stamp-warden")
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/replica/security
	name = "security rubber stamp replica"
	item = "security"
	quality_stamps = list("fake-gud-stamp-security", "fake-mid-stamp-security", "fake-bad-stamp-security")
	icon_state = "stamp-qm"
	dye_color = DYE_QM


/obj/item/stamp/qm
	name = "quartermaster's rubber stamp"
	icon_state = "stamp-qm"
	dye_color = DYE_QM

/obj/item/stamp/law
	name = "law office's rubber stamp"
	icon_state = "stamp-law"
	dye_color = DYE_LAW

/obj/item/stamp/captain
	name = "captain's rubber stamp"
	icon_state = "stamp-cap"
	dye_color = DYE_CAPTAIN

/obj/item/stamp/command
	name = "command rubber stamp"
	icon_state = "stamp-com"
	dye_color = DYE_COMMAND

/obj/item/stamp/hop
	name = "head of personnel's rubber stamp"
	icon_state = "stamp-hop"
	dye_color = DYE_HOP

/obj/item/stamp/hos
	name = "head of security's rubber stamp"
	icon_state = "stamp-hos"
	dye_color = DYE_HOS

/obj/item/stamp/ce
	name = "chief engineer's rubber stamp"
	icon_state = "stamp-ce"
	dye_color = DYE_CE

/obj/item/stamp/rd
	name = "research director's rubber stamp"
	icon_state = "stamp-rd"
	dye_color = DYE_RD

/obj/item/stamp/cmo
	name = "chief medical officer's rubber stamp"
	icon_state = "stamp-cmo"
	dye_color = DYE_CMO

/obj/item/stamp/denied
	name = "\improper DENIED rubber stamp"
	icon_state = "stamp-deny"
	dye_color = DYE_REDCOAT

/obj/item/stamp/clown
	name = "clown's rubber stamp"
	icon_state = "stamp-clown"
	dye_color = DYE_CLOWN

/obj/item/stamp/mime
	name = "mime's rubber stamp"
	icon_state = "stamp-mime"
	dye_color = DYE_MIME

/obj/item/stamp/chap
	name = "chaplain's rubber stamp"
	icon_state = "stamp-chap"
	dye_color = DYE_CHAP

/obj/item/stamp/centcom
	name = "CentCom rubber stamp"
	icon_state = "stamp-centcom"
	dye_color = DYE_CENTCOM

/obj/item/stamp/syndicate
	name = "Syndicate rubber stamp"
	icon_state = "stamp-syndicate"
	dye_color = DYE_SYNDICATE

/obj/item/stamp/ntr
	name = "NanoTrasen rubber stamp"
	icon_state = "stamp-ntr"
	dye_color = DYE_CENTCOM

/obj/item/stamp/warden
	name = "warden's rubber stamp"
	icon_state = "stamp-warden"
	dye_color = DYE_RED

/obj/item/stamp/security
	name = "security rubber stamp"
	icon_state = "stamp-security"
	dye_color = DYE_RED

// BLUEMOON ADD START - новый штамп для автоматически сгененированных документов
/obj/item/stamp/machine
	name = "Machinery stamping module"
	desc = "И откуда ты это достал, мясной мешок? Положи обратно!"
	icon_state = "stamp-machine"
	dye_color = DYE_BLUE
// BLUEMOON ADD END

/obj/item/stamp/attack_paw(mob/user)
	return attack_hand(user)
