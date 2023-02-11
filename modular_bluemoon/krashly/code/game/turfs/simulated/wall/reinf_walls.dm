/turf/closed/wall/r_wall/lf_haron
	name = "hull"
	desc = "The armored hull of an ominous looking ship."
	icon = 'modular_bluemoon/krashly/icons/turf/walls/lf_haron_walls.dmi'
	icon_state = "haron_first"
	explosion_block = 20

/turf/closed/wall/r_wall/lf_haron/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	return FALSE

/turf/closed/wall/r_wall/lf_haron/diagonal
	name = "diagonal hull"
	icon_state = "haron_diagonal"

/turf/closed/wall/r_wall/lf_haron/second
	icon_state = "haron_second"

/turf/closed/wall/r_wall/lf_haron/text
	name = "babylon"

/turf/closed/wall/r_wall/lf_haron/text/first
	icon_state = "haron_text_first"

/turf/closed/wall/r_wall/lf_haron/text/second
	icon_state = "haron_text_second"

/turf/closed/wall/r_wall/lf_haron/text/third
	icon_state = "haron_text_third"
