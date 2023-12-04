/mob/living/simple_animal/hostile/carp/brown
	name = "brown space carp"
	desc = "A ferocious, fang-bearing creature that resembles a fish."
	icon = 'modular_bluemoon/krashly/icons/mob/simple_mob/brown_carp.dmi'
	faction = list("carp", "InteQ")

/mob/living/simple_animal/hostile/carp/brown/beret
	name = "brown space carp with beret"
	icon = 'modular_bluemoon/krashly/icons/mob/simple_mob/brown_carp_beret.dmi'

/mob/living/simple_animal/hostile/carp/brown/beret/drop_loot()
	new /obj/item/clothing/suit/armor/inteq/vanguard(src.loc)
	new /obj/item/clothing/head/HoS/inteq_vanguard(src.loc)
