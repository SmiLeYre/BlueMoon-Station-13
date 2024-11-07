// ОБР Кролики

// Отображаем их в списке доступных ОБР
/datum/ert/rabbit
	roles = list(/datum/antagonist/ert/security/rabbit)
	leader_role = /datum/antagonist/ert/commander/rabbit
	teamsize = 6
	opendoors = FALSE
	rename_team = "Rabbit Team"
	mission = "Устраните любые нарушения и/или отклонения от нормы на станции."
	polldesc = "a Rabbit Team"
	code = "Orange"
	ertphrase = 'modular_bluemoon/sanecman/sound/ert/rabbit_protocol.ogg'

// Назначаем каждому роль
/datum/antagonist/ert/security/rabbit
	role = "Specialist"
	outfit = /datum/outfit/ert/security/rabbit

/datum/antagonist/ert/commander/rabbit
	role = "Lieutenant"
	outfit = /datum/outfit/ert/commander/rabbit

// Одеваем стильно
/datum/outfit/ert/commander/rabbit
	name = "Rabbit Team Leader"

	uniform = /obj/item/clothing/under/suit/lobotomy/rabbit
	head = /obj/item/clothing/head/rabbit_helmet
	suit = /obj/item/clothing/suit/armor/ego_gear/rabbit
	l_hand = /obj/item/gun/energy/e_gun/rabbit/captain
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/commander/rabbit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/explosive/L = new/obj/item/implant/explosive(H)
	L.implant(H, null, 1)
	H.faction |= "rabbit"
	..()

/datum/outfit/ert/security/rabbit
	name = "Rabbit Team"

	uniform = /obj/item/clothing/under/suit/lobotomy/rabbit
	head = /obj/item/clothing/head/rabbit_helmet/grunt
	suit = /obj/item/clothing/suit/armor/ego_gear/rabbit/grunts
	l_hand = /obj/item/gun/energy/e_gun/rabbit
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/security/rabbit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/explosive/L = new/obj/item/implant/explosive(H)
	L.implant(H, null, 1)
	H.faction |= "rabbit"
	..()
