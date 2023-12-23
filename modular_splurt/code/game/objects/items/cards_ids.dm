/obj/item/card/id/syndicate/slaver
	name = "\improper Slaver Trader ID"
	desc = "A cheap ID used by slave traders."
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_SLAVER)

/obj/item/card/id/syndicate/slaver/leader
	name = "\improper Slaver Master ID"
	desc = "A cheap ID used by slave traders. This guy seems to run the show."

/obj/item/card/id/vampire
	name = "Bloodfledge ID"
	desc = "An ID made to easily recognize bloodsucker fledglings without requiring medical scans."
	icon = 'modular_bluemoon/vagabond/icons/obj/vampirecard.dmi'
	icon_state = "vampire"
	assignment = "Bloodsucker Fledgling"
	uses_overlays = FALSE

/obj/item/card/id/away/hotel/splurt
	name = "Staff ID"
	assignment = "Hotel Staff"
	desc = "A staff ID used to access the hotel's doors."
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT, ACCESS_AWAY_ENGINE)

/obj/item/card/id/away/hotel/splurt/security
	name = "Officer ID"
	assignment = "Hotel Security"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT, ACCESS_AWAY_SEC, ACCESS_AWAY_ENGINE)

/obj/item/card/id/away/hotel/splurt/manager
	name = "Manager ID"
	assignment = "Hotel Manager"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT, ACCESS_AWAY_ENGINE, ACCESS_AWAY_SEC, ACCESS_AWAY_GENERIC1)

/obj/item/card/id/inteq_command/crew_id
	name = "InteQ Vanguard ID card"
	id_type_name = "InteQ ID card"
	desc = "An ID straight from the InteQ."
	registered_name = "InteQ"
	assignment = "InteQ Operative"
	icon_state = "inteq"
	access = list(ACCESS_INTEQ, ACCESS_ROBOTICS)
	uses_overlays = FALSE

/obj/item/card/id/inteq_command/captain_id
	name = "InteQ Vanguard Leader ID card"
	id_type_name = "InteQ captain ID card"
	desc = "An ID straight from the InteQ."
	registered_name = "InteQ"
	assignment = "InteQ Ship Captain"
	icon_state = "inteq"
	access = list(ACCESS_INTEQ, ACCESS_INTEQ_LEADER, ACCESS_ROBOTICS)
	uses_overlays = FALSE
