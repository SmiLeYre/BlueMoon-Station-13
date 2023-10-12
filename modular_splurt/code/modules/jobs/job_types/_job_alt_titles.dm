// Command
/datum/job/captain/New()
	var/list/extra_titles = list(
		"Station Director",
		"Station Commander",
		"Station Overseer",
		"Sectorial Commander",
		"Syndicate Admiral",
		"Station Mistress",
		"Station Master",
		"Cockpitain",
		"Cuntpitain",
		"Senator",
		"Consul",
		"Cap-Slut",
		"Condom"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/chief_engineer/New()
	var/list/extra_titles = list(
		"Head Engineer",
		"Construction Coordinator",
		"Project Manager",
		"Power Plant Director",
		"Aunt Syndi Pet",
		"Mother Destroyer",
		"Bordel Architect",
		"Big Iron",
		"Magos",
		"Magos Biologis"

	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hop/New()
	var/list/extra_titles = list(
		"Head Of Stations Pets",
		"Head Of Cumdumps",
		"Head Of Slutty Personnel",
		"Headpat Of Personnel",
		"Headgiver To Personnel",
		"Personnel Manager",
		"Staff Administrator",
		"Records Administrator",
		"Syndicate Administrator",
		"Personnel Manager of Syndicate",
		"Captain Attachment"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hos/New()
	var/list/extra_titles = list(
		"Security Commander",
		"Head of Slutcurity",
		"Division Leader",
		"Cerberus Leader",
		"Syndicate Field Commander",
		"Commissar"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Head of Spookcurity")
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/qm/New()
	var/list/extra_titles = list(
		"Supply Chief",
		"Cargonia Chief",
		"Brigadier",
		"Logistics Syndicate Supervisor",
		"Manager of Shipping Sex"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/rd/New()
	var/list/extra_titles = list(
		"Science Administrator",
		"Cybersun Lead Specialist",
		"CEO of Sex",
		"Sex Research Director",
		"Research Manager"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/cmo
	alt_titles = list(
		"Medical Director",
		"Medical Administrator",
		"Specialist Of Interdyne",
		"Healing Fleshlight Mistress",
		"Healing Fleshlight Master",
		"Chief Heal Slut"
	) // Sandcode do not have alt titles for CMO at the moment.


// Engineering
/datum/job/atmos/New()
	var/list/extra_titles = list(
		"Atmos Plumber",
		"Syndicate Atmospherics Master",
		"Anal Plumber",
		"Atmos-Slut",
		"Buttplug",
		"Disposals Technician"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/engineer/New()
	var/list/extra_titles = list(
		"Structural Engineer",
		"Astromechanic",
		"Syndicate Constructing Master",
		"Station Architect",
		"Hazardous Material Operator",
		"Junior Engineer",
		"Engi-Slut",
		"Apprentice Engineer",
		"Techpriest Enginseer"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Service
/datum/job/assistant/New()
	var/list/extra_titles = list(
		"Volunteer",
		"Morale Officer",
		"Stripper",
		"Tourist",
		"SolFed Tourist",
		"NRI Tourist",
		"Clerk",
		"Blacksmith",
		"All-purpose Fleshlight",
		"All-purpose Dildo",
		"Cumdump",
		"Greytider",
		"Bard",
		"Snack",
		"Stress Relief",
		"Freeloader",
		"Syndicate Specialist",
		"Station Pet",
		"Whore",
		"Slut",
		"Slave"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/bartender/New()
	var/list/extra_titles = list(
		"Mixologist",
		"Sommelier",
		"Bar Owner",
		"Barmaid",
		"The Semen Degustator",
		"Crocin Terrorist",
		"Expediter"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/janitor/New() // "Custodian" is formally an ERT Janitor's job title. It causes conflict with ID and manifest. Yell at upstream maintainer(s).
	var/list/rem_titles = list(
		"Custodian"
	)
	var/list/extra_titles = list(
		"Slutty Maid",
		"Cum Cleaner",
		"Liquidator",
		"Custodial Technician"
	)
	LAZYREMOVE(alt_titles, rem_titles)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/chaplain/New() // Yell at upstream maintainer(s) to fix "Bichop" title.
	var/list/rem_titles = list(
		"Bichop"
	)
	var/list/extra_titles = list(
		"Bishop",
		"Priestess",
		"Prior",
		"Monk",
		"Nun",
		"Tiger Cooperative Disciple",
		"Keeper of Cum",
		"Counselor",
		"Techpriest",
		"Syndicate Techpriest"
	)
	LAZYADD(alt_titles, extra_titles)
	LAZYREMOVE(alt_titles, rem_titles)
	. = ..()

/datum/job/clown // Sorry, but no TWO entertainer titles.
	alt_titles = list("Jester", "Comedian", "Cumedian", "Sexy Clown")

/datum/job/cook/New()
	var/list/extra_titles = list(
		"Waffle Co. Specialist",
		"Chef De Partie",
		"Chef De Sexe",
		"Boss Of This Gym",
		"Prey Prepper",
		"Poissonier",
		"Baker"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/curator/New()
	var/list/extra_titles = list(
		"Keeper",
		"Archaeologist",
		"Historian",
		"Scholar",
		"Hentai Artist",
		"Artist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hydro/New()
	var/list/extra_titles = list(
		"Hydroponicist",
		"Farmer",
		"Beekeeper",
		"Plants Breeder",
		"Vintner",
		"Soiler"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

// No additions for janitor

/datum/job/lawyer/New()
	var/list/extra_titles = list(
		"Syndicate Attorney",
		"Law-Slut",
		"Internal Affairs Agent",
		"Attorney"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/mime/New()
	var/list/extra_titles = list(
		"Pantomime",
		"Cumtomime",
		"Sexy Mime",
		"Mimic"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Science

/datum/job/scientist/New()
	var/list/extra_titles = list(
		"Researcher",
		"Toxins Researcher",
		"Research Intern",
		"Junior Scientist",
		"Sex Researcher",
		"Rack Researcher",
		"Nanite Programmer",
		"Tetromino Researcher",
		"Xenoarchaeologist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/roboticist/New()
	var/list/extra_titles = list(
		"Cybersun Specialist",
		"Ripperdoc",
		"Droid Mechanic",
		"Borgs Slut",
		"Borgs Raper",
		"Robo-Slut",
		"Techpriest Biologis"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

// Medical

/datum/job/chemist/New()
	var/list/extra_titles = list(
		"Alchemist",
		"Apothecarist",
		"Chemical Plumber",
		"Organomegaly Healer",
		"Hexocrocin Therapist",
		"Chemi-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/doctor/New()
	var/list/extra_titles = list(
		"Physician",
		"Medical Intern",
		"Medical Resident",
		"Medtech",
		"Oral Doctor",
		"Healing Fleshlight",
		"Medi-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/psychologist/New()
	var/list/extra_titles = list(
		"Therapist",
		"Psychiatrist",
		"Hypnotist",
		"Hypnosis Expert",
		"Hypnotherapist",
		"Sex Educator",
		"Rental Mommy",
		"Rental Daddy",
		"The Rapist",
		"Psycho-Slut",
		"Sexual Advisor"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/geneticist/New()
	var/list/extra_titles = list(
		"Genetics Researcher",
		"Gene-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/paramedic/New()
	var/list/extra_titles = list(
		"Field Medic Of Interdyne",
		"Emergency Horny Technical",
		"Emergency Cum Receiver",
		"Emergency Condom Team",
		"Crocin Deliverer",
		"Para-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/virologist/New()
	var/list/extra_titles = list(
		"Microbiologist",
		"Biochemist",
		"Syndicate Bioweapon Scientist",
		"Plague Doctor",
		"Monkey Destroyer",
		"Viro-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Security
/datum/job/detective/New()
	var/list/extra_titles = list(
		"Gumshoe",
		"Slutective",
		"Van Dorn Agent",
		"Forensic Investigator",
		"Cinder Dick",
		"Syndicate Survey Specialist",
		"Cooperate Auditor"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookective")
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/officer/New()
	var/list/extra_titles = list(
		"Security Agent",
		"Probation Officer",
		"Guardsman",
		"Civil Protection",
		"Police Officer",
		"Tyranny Lover",
		"Cerberus",
		"SAARE Operative",
		"PCRC Operative",
		"Syndicate Combatant",
		"Gorlex Marauders Trainee",
		"Slutcurity Officer"
	)
	var/list/rem_titles = list(
		"Peacekeeper"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookcurity Officer")
	LAZYADD(alt_titles, extra_titles)
	LAZYREMOVE(alt_titles, rem_titles)
	. = ..()

/datum/job/warden/New()
	var/list/extra_titles = list(
		"Prison Chief",
		"Armory Manager",
		"Prison Administrator",
		"Dungeon Master",
		"Brig Superintendent",
		"Brig Overwatch",
		"High-Ranked Security Officer",
		"Slutcurity Captain",
		"Syndicate Supervisor",
		"Voreden"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookden")
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Cargo
/datum/job/cargo_tech/New()
	var/list/extra_titles = list(
		"Deliveries Officer",
		"Mail Man",
		"Mail Woman",
		"Horny Mailer",
		"Pleasures Deliverer",
		"Cock Packager",
		"Mailroom Technician",
		"Disposal Technician",
		"Donk Co. Specialist",
		"Logistics Technician",
		"Cryptocurrency Technician"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/mining/New()
	var/list/extra_titles = list(
		"Exotic Ore Miner",
		"Digger",
		"Hunter",
		"Ashwalker Sex Slave",
		"Ashwalker Breeder",
		"Shaft Syndi-Miner",
		"Slayer"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()
