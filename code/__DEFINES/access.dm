#define ACCESS_SECURITY 1 // Security equipment, security records, gulag item storage, secbots
#define ACCESS_BRIG 2 // Brig cells+timers, permabrig, gulag+gulag shuttle, prisoner management console
#define ACCESS_ARMORY 3 // Armory, gulag teleporter, execution chamber
#define ACCESS_FORENSICS_LOCKERS 4 //Detective's office, forensics lockers, security+medical records
#define ACCESS_MEDICAL 5
#define ACCESS_MORGUE 6
#define ACCESS_TOX 7 //R&D department, R&D console, burn chamber on some maps
#define ACCESS_TOX_STORAGE 8 //Toxins storage, burn chamber on some maps
#define ACCESS_GENETICS 9
#define ACCESS_ENGINE 10 //Engineering area, power monitor, power flow control console
#define ACCESS_ENGINE_EQUIP 11 //APCs, EngiVend/YouTool, engineering equipment lockers
#define ACCESS_MAINT_TUNNELS 12
#define ACCESS_EXTERNAL_AIRLOCKS 13
#define ACCESS_EMERGENCY_STORAGE 14 //Not in use
#define ACCESS_CHANGE_IDS 15
#define ACCESS_AI_UPLOAD 16
#define ACCESS_TELEPORTER 17
#define ACCESS_EVA 18
#define ACCESS_HEADS 19 //Bridge, EVA storage windoors, gateway shutters, AI integrity restorer, clone record deletion, comms console
#define ACCESS_CAPTAIN 20
#define ACCESS_ALL_PERSONAL_LOCKERS 21
#define ACCESS_CHAPEL_OFFICE 22
#define ACCESS_TECH_STORAGE 23
#define ACCESS_ATMOSPHERICS 24
#define ACCESS_BAR 25
#define ACCESS_JANITOR 26
#define ACCESS_CREMATORIUM 27
#define ACCESS_KITCHEN 28
#define ACCESS_ROBOTICS 29
#define ACCESS_RD 30
#define ACCESS_CARGO 31
#define ACCESS_CONSTRUCTION 32
#define ACCESS_CHEMISTRY 33
#define ACCESS_CARGO_BOT 34 //Not in use
#define ACCESS_HYDROPONICS 35
#define ACCESS_MANUFACTURING 36 //Only used on research.dmm away mission
#define ACCESS_LIBRARY 37
#define ACCESS_LAWYER 38
#define ACCESS_VIROLOGY 39
#define ACCESS_CMO 40
#define ACCESS_QM 41
#define ACCESS_COURT 42
#define ACCESS_SURGERY 45
#define ACCESS_THEATRE 46
#define ACCESS_RESEARCH 47
#define ACCESS_MINING 48
#define ACCESS_MINING_OFFICE 49 //Not in use
#define ACCESS_MAILSORTING 50
#define ACCESS_MINT 51 //Not in use
#define ACCESS_MINT_VAULT 52 //Not in use
#define ACCESS_VAULT 53
#define ACCESS_MINING_STATION 54
#define ACCESS_XENOBIOLOGY 55
#define ACCESS_CE 56
#define ACCESS_HOP 57
#define ACCESS_HOS 58
#define ACCESS_RC_ANNOUNCE 59 //Request console announcements
#define ACCESS_KEYCARD_AUTH 60 //Used for events which require at least two people to confirm them
#define ACCESS_TCOMSAT 61 // has access to the entire telecomms satellite / machinery
#define ACCESS_GATEWAY 62
#define ACCESS_SEC_DOORS 63 // Outer brig doors, department security posts
#define ACCESS_MINERAL_STOREROOM 64 //For releasing minerals from the ORM
#define ACCESS_MINISAT 65
#define ACCESS_WEAPONS 66 //Weapon authorization for secbots
#define ACCESS_NETWORK 67 //NTnet diagnostics/monitoring software
#define ACCESS_CLONING 68 //Cloning room and clone pod ejection
#define ACCESS_ENTER_GENPOP 69
#define ACCESS_LEAVE_GENPOP 70
//SPLURT EDIT BEGIN
#define ACCESS_BRIGDOC 71
#define ACCESS_BLUESHIELD 72
#define ACCESS_BRIDGE_OFFICER 73
#define ACCESS_PSYCH 76
#define ACCESS_PEACEKEEPER 77
//SPLURT EDIT END
	//BEGIN CENTCOM ACCESS
	/*Should leave plenty of room if we need to add more access levels.
	Mostly for admin fun times.*/
#define ACCESS_CENT_GENERAL 101//General facilities. CentCom ferry.
#define ACCESS_CENT_THUNDER 102//Thunderdome.
#define ACCESS_CENT_SPECOPS 103//Special Ops. Captain's display case, Marauder and Seraph mechs.
#define ACCESS_CENT_MEDICAL 104//Medical/Research
#define ACCESS_CENT_LIVING 105//Living quarters.
#define ACCESS_CENT_STORAGE 106//Generic storage areas.
#define ACCESS_CENT_TELEPORTER 107//Teleporter.
#define ACCESS_CENT_CAPTAIN 109//Captain's office/ID comp/AI.
#define ACCESS_CENT_BAR 110 // The non-existent CentCom Bar

	//The Syndicate
#define ACCESS_SYNDICATE 150//General Syndicate Access. Includes Syndicate mechs and ruins.
#define ACCESS_SYNDICATE_LEADER 151//Nuke Op Leader Access

	//The InteQ
#define ACCESS_INTEQ 152//General Syndicate Access. Includes Syndicate mechs and ruins.
#define ACCESS_INTEQ_LEADER 153//Nuke Op Leader Access

	//Away Missions or Ruins
	/*For generic away-mission/ruin access. Why would normal crew have access to a long-abandoned derelict
	or a 2000 year-old temple? */
#define ACCESS_AWAY_GENERAL 200//General facilities.
#define ACCESS_AWAY_MAINT 201//Away maintenance
#define ACCESS_AWAY_MED 202//Away medical
#define ACCESS_AWAY_SEC 203//Away security
#define ACCESS_AWAY_ENGINE 204//Away engineering
#define ACCESS_AWAY_GENERIC1 205//Away generic access
#define ACCESS_AWAY_GENERIC2 206
#define ACCESS_AWAY_GENERIC3 207
#define ACCESS_AWAY_GENERIC4 208

/// - - - AWAY MISSIONS - - -
/*For generic away-mission/ruin access. Why would normal crew have access to a long-abandoned derelict
	or a 2000 year-old temple? */
#define ACCESS_AWAY_COMMAND "away_command"
#define ACCESS_AWAY_ENGINEERING "away_engineering"
#define ACCESS_AWAY_MEDICAL "away_medical"
#define ACCESS_AWAY_SUPPLY "away_supply"
#define ACCESS_AWAY_SCIENCE "away_science"
#define ACCESS_AWAY_MAINTENANCE "away_maintenance"

	//Special, for anything that's basically internal
#define ACCESS_BLOODCULT 250
#define ACCESS_CLOCKCULT 251

	//Таркоф, ёбанный в рот.
#define ACCESS_TARKOFF "tarkoff"

/**
 * A list of PDA paths that can be painted as well as the regional heads which should be able to paint them.
 * If a PDA is not in this list, it cannot be painted using the PDA & ID Painter.
 * If a PDA is in this list, it can always be painted with ACCESS_CHANGE_IDS.
 * Used to see pda_region in [/datum/controller/subsystem/id_access/proc/setup_tgui_lists]
 */
#define PDA_PAINTING_REGIONS list( \
	/obj/item/modular_computer/pda = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/clown = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/mime = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/medical = list(REGION_MEDBAY), \
	/obj/item/modular_computer/pda/viro = list(REGION_MEDBAY), \
	/obj/item/modular_computer/pda/coroner = list(REGION_MEDBAY), \
	/obj/item/modular_computer/pda/engineering = list(REGION_ENGINEERING), \
	/obj/item/modular_computer/pda/security = list(REGION_SECURITY), \
	/obj/item/modular_computer/pda/detective = list(REGION_SECURITY), \
	/obj/item/modular_computer/pda/warden = list(REGION_SECURITY), \
	/obj/item/modular_computer/pda/janitor = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/science = list(REGION_RESEARCH), \
	/obj/item/modular_computer/pda/heads/quartermaster = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/hop = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/hos = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/cmo = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/ce = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/rd = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/heads/captain = list(REGION_COMMAND), \
	/obj/item/modular_computer/pda/cargo = list(REGION_SUPPLY), \
	/obj/item/modular_computer/pda/bitrunner = list(REGION_SUPPLY), \
	/obj/item/modular_computer/pda/shaftminer = list(REGION_SUPPLY), \
	/obj/item/modular_computer/pda/chaplain = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/lawyer = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/botanist = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/roboticist = list(REGION_RESEARCH), \
	/obj/item/modular_computer/pda/curator = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/cook = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/bar = list(REGION_GENERAL), \
	/obj/item/modular_computer/pda/atmos = list(REGION_ENGINEERING), \
	/obj/item/modular_computer/pda/chemist = list(REGION_MEDBAY), \
	/obj/item/modular_computer/pda/geneticist = list(REGION_RESEARCH), \
)
