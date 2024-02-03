/datum/design/mutagen
	name = "10u Unstable Mutagen"
	id = "mutagen_bottle"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 200)
	make_reagents = list(/datum/reagent/toxin/mutagen = 10)
	category = list("initial","Botany Chemicals")

/datum/design/ash
	name = "10u Ash"
	id = "ash"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 15)
	make_reagents = list(/datum/reagent/ash = 10)
	category = list("initial","Botany Chemicals")

/datum/design/diethylamine
	name = "10u Diethylamine"
	id = "diethylamine"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 100)
	make_reagents = list(/datum/reagent/diethylamine = 10)
	category = list("initial","Botany Chemicals")

/datum/design/strange_seed
	name = "Pack of strange seeds"
	id = "strange_seed"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 800)
	build_path = /obj/item/seeds/random
	category = list("initial","Organic Materials")

/datum/design/rolling_paper
	name = "Rolling Paper"
	id = "rolling_paper"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 250)
	build_path = /obj/item/rollingpaper
	category = list("initial","Organic Materials")

/datum/design/rubber_ducky
	name = "Rubber Ducky"
	id = "rubber_ducky"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 750)
	build_path = /obj/item/bikehorn/rubberducky
	category = list("initial","Organic Materials")
