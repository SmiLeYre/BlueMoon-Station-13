// перемещение на тайл целевого моба, при этом перетягивая за собой перетягиваемого моба.
// Сделано так вместо одного forceMove(), которое разрывает хватку. Если делать просто Move без надстроек с переназначением, то в случае, когда перетягиваемый
// моб находится на 1 тайл дальше от турфа, куда наступают, хватка разрывается.
/mob/living/proc/micro_move_to_target_turf(mob/living/target)
	if(loc == target.loc) // на случай, если проигрывается при наступании на кого-то, тот уже лежит
		return

	var/mob/old_pulled_mob
	var/mob/old_pulling_mob
	var/turf/old_src_loc = loc

	if(pulling)
		old_pulled_mob = pulling
	if(pulledby)
		old_pulling_mob = pulledby

	forceMove(target.loc)

	if(old_pulled_mob)
		old_pulled_mob.forceMove(old_src_loc)
		pulling = old_pulled_mob
		old_pulled_mob.pulledby = src
		update_pull_hud_icon()
	if(old_pulling_mob)
		pulledby = old_pulling_mob
		old_pulling_mob.pulling = src
		old_pulling_mob.update_pull_hud_icon()
