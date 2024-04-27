/mob/living/simple_animal/hostile/construct
	name = "Construct"
	real_name = "Construct"
	desc = ""
	gender = NEUTER
	mob_biotypes = NONE
	speak_emote = list("hisses")
	response_help_continuous = "thinks better of touching"
	response_help_simple = "think better of touching"
	response_disarm_continuous = "flails at"
	response_disarm_simple = "flail at"
	response_harm_continuous = "punches"
	response_harm_simple = "punch"
	speak_chance = 1
	icon = 'icons/mob/mob.dmi'
	speed = 0
	spacewalk = TRUE
	a_intent = INTENT_HARM
	stop_automated_movement = 1
	status_flags = CANPUSH
	attack_sound = 'sound/weapons/punch1.ogg'
	see_in_dark = 7
	see_invisible = SEE_INVISIBLE_HIDDEN_RUNES
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	damage_coeff = list(BRUTE = 1, BURN = 1, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	healable = 0
	faction = list("cult")
	movement_type = FLYING
	pressure_resistance = 100
	unique_name = 1
	AIStatus = AI_OFF //normal constructs don't have AI
	loot = list(/obj/item/ectoplasm)
	del_on_death = TRUE
	initial_language_holder = /datum/language_holder/construct
	deathmessage = "collapses in a shattered heap."
	hud_type = /datum/hud/constructs
	blood_volume = 0
	var/list/construct_spells = list()
	var/playstyle_string = "<span class='big bold'>You are a generic construct!</span><b> Your job is to not exist, and you should probably adminhelp this.</b>"
	var/master = null
	var/seeking = FALSE
	var/can_repair_constructs = FALSE
	var/can_repair_self = FALSE
	var/runetype
	var/datum/action/innate/cult/create_rune/our_rune
	/// Theme controls color. THEME_CULT is red THEME_WIZARD is purple and THEME_HOLY is blue
	var/theme = "cult"
	var/datum/mind/original_mind

/mob/living/simple_animal/hostile/construct/Initialize(mapload)
	. = ..()
	update_health_hud()
	var/spellnum = 1
	ADD_TRAIT(src, TRAIT_HEALS_FROM_CULT_PYLONS, INNATE_TRAIT)
	for(var/spell in construct_spells)
		var/pos = 2+spellnum*31
		if(construct_spells.len >= 4)
			pos -= 31*(construct_spells.len - 4)
		var/obj/effect/proc_holder/spell/the_spell = new spell(null)
		the_spell?.action.default_button_position ="6:[pos],4:-2"
		AddSpell(the_spell)
		spellnum++
	if(runetype)
		var/pos = 2+spellnum*31
		if(construct_spells.len >= 4)
			pos -= 31*(construct_spells.len - 4)
		our_rune = new runetype(src)
		our_rune.default_button_position = "6:[pos],4:-2" // Set the default position to this random position
		our_rune.Grant(src)
	if(icon_state)
		add_overlay("glow_[icon_state]_[theme]")

/mob/living/simple_animal/hostile/construct/Destroy()
	original_mind = null
	QDEL_NULL(our_rune)
	. = ..()

/mob/living/simple_animal/hostile/construct/death()
	if(original_mind && !(QDELETED(original_mind)))
		transfer_ckey(original_mind.current)
	..()

/mob/living/simple_animal/hostile/construct/Login()
	..()
	to_chat(src, playstyle_string)

/mob/living/simple_animal/hostile/construct/examine(mob/user)
	var/t_He = ru_who(TRUE)
	var/t_s = p_s()
	. = list("<span class='cult'>This is [icon2html(src, user)] \a <b>[src]</b>!")
	if(desc)
		. += desc
	if(health < maxHealth)
		if(health >= maxHealth/2)
			. += "<span class='warning'>[t_He] look[t_s] slightly dented.</span>"
		else
			. += "<span class='warning'><b>[t_He] look[t_s] severely dented!</b></span>"

	if(length(.))
		.[1] += "<hr>"
	. += "</span>"

/mob/living/simple_animal/hostile/construct/attack_animal(mob/living/simple_animal/M)
	if(isconstruct(M)) //is it a construct?
		var/mob/living/simple_animal/hostile/construct/C = M
		if(!C.can_repair_constructs || (C == src && !C.can_repair_self))
			return
		if(health < maxHealth)
			adjustHealth(-5)
			if(src != M)
				Beam(M,icon_state="sendbeam",time=4)
				M.visible_message("<span class='danger'>[M] repairs some of \the <b>[src]'s</b> dents.</span>", \
						   "<span class='cult'>You repair some of <b>[src]'s</b> dents, leaving <b>[src]</b> at <b>[health]/[maxHealth]</b> health.</span>")
			else
				M.visible_message("<span class='danger'>[M] repairs some of [ru_ego()] own dents.</span>", \
						   "<span class='cult'>You repair some of your own dents, leaving you at <b>[M.health]/[M.maxHealth]</b> health.</span>")
		else
			if(src != M)
				to_chat(M, "<span class='cult'>You cannot repair <b>[src]'s</b> dents, as [ru_who()] [p_have()] none!</span>")
			else
				to_chat(M, "<span class='cult'>You cannot repair your own dents, as you have none!</span>")
	else if(src != M)
		return ..()

/mob/living/simple_animal/hostile/construct/narsie_act()
	return

/mob/living/simple_animal/hostile/construct/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	return FALSE

/mob/living/simple_animal/hostile/construct/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(updating_health)
		update_health_hud()

/////////////////Juggernaut///////////////
/mob/living/simple_animal/hostile/construct/armored
	name = "Juggernaut"
	real_name = "Juggernaut"
	desc = "A massive, armored construct built to spearhead attacks and soak up enemy fire."
	icon_state = "behemoth"
	icon_living = "behemoth"
	maxHealth = 150
	health = 150
	response_harm_continuous = "harmlessly punches"
	response_harm_simple = "harmlessly punch"
	harm_intent_damage = 0
	obj_damage = 90
	melee_damage_lower = 25
	melee_damage_upper = 25
	attack_verb_continuous = "smashes their armored gauntlet into"
	attack_verb_simple = "smash your armored gauntlet into"
	speed = 2.5
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'sound/weapons/punch3.ogg'
	status_flags = 0
	mob_size = MOB_SIZE_LARGE
	force_threshold = 10
	construct_spells = list(/obj/effect/proc_holder/spell/targeted/forcewall/cult,
							/obj/effect/proc_holder/spell/dumbfire/juggernaut)
	runetype = /datum/action/innate/cult/create_rune/wall
	playstyle_string = "<b>You are a Juggernaut. Though slow, your shell can withstand heavy punishment, \
						create shield walls, rip apart enemies and walls alike, and even deflect energy weapons.</b>"

/mob/living/simple_animal/hostile/construct/armored/hostile //actually hostile, will move around, hit things
	AIStatus = AI_ON
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //only token destruction, don't smash the cult wall NO STOP

/mob/living/simple_animal/hostile/construct/armored/bullet_act(obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		var/reflectchance = 40 - round(P.damage/3)
		if(prob(reflectchance))
			apply_damage(P.damage * 0.5, P.damage_type)
			visible_message("<span class='danger'>The [P.name] is reflected by [src]'s armored shell!</span>", \
							"<span class='userdanger'>The [P.name] is reflected by your armored shell!</span>")

			// Find a turf near or on the original location to bounce to
			if(P.starting)
				var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/turf/curloc = get_turf(src)

				// redirect the projectile
				P.original = locate(new_x, new_y, P.z)
				P.starting = curloc
				P.firer = src
				P.yo = new_y - curloc.y
				P.xo = new_x - curloc.x
				var/new_angle_s = P.Angle + rand(120,240)
				while(new_angle_s > 180)	// Translate to regular projectile degrees
					new_angle_s -= 360
				P.setAngle(new_angle_s)

			return BULLET_ACT_FORCE_PIERCE // complete projectile permutation

	return ..()



////////////////////////Wraith/////////////////////////////////////////////
/mob/living/simple_animal/hostile/construct/wraith
	name = "Wraith"
	real_name = "Wraith"
	desc = "A wicked, clawed shell constructed to assassinate enemies and sow chaos behind enemy lines."
	icon_state = "floating"
	icon_living = "floating"
	maxHealth = 65
	health = 65
	melee_damage_lower = 20
	melee_damage_upper = 20
	retreat_distance = 2 //AI wraiths will move in and out of combat
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	construct_spells = list(/obj/effect/proc_holder/spell/targeted/ethereal_jaunt/shift)
	runetype = /datum/action/innate/cult/create_rune/tele
	playstyle_string = "<b>You are a Wraith. Though relatively fragile, you are fast, deadly, can phase through walls, and your attacks will lower the cooldown on phasing.</b>"

	var/attack_refund = 10 //1 second per attack
	var/crit_refund = 50 //5 seconds when putting a target into critical
	var/kill_refund = 250 //full refund on kills

/mob/living/simple_animal/hostile/construct/wraith/AttackingTarget() //refund jaunt cooldown when attacking living targets
	var/prev_stat
	if(isliving(target) && !iscultist(target))
		var/mob/living/L = target
		prev_stat = L.stat

	. = ..()

	if(. && isnum(prev_stat))
		var/mob/living/L = target
		var/refund = 0
		if(QDELETED(L) || (L.stat == DEAD && prev_stat != DEAD)) //they're dead, you killed them
			refund += kill_refund
		else if(L.InCritical() && prev_stat == CONSCIOUS) //you knocked them into critical
			refund += crit_refund
		if(L.stat != DEAD && prev_stat != DEAD)
			refund += attack_refund
		for(var/obj/effect/proc_holder/spell/targeted/ethereal_jaunt/shift/S in mob_spell_list)
			S.charge_counter = min(S.charge_counter + refund, S.charge_max)

/mob/living/simple_animal/hostile/construct/wraith/hostile //actually hostile, will move around, hit things
	AIStatus = AI_ON



/////////////////////////////Artificer/////////////////////////
/mob/living/simple_animal/hostile/construct/builder
	name = "Artificer"
	real_name = "Artificer"
	desc = "A bulbous construct dedicated to building and maintaining the Cult of Nar'Sie's armies."
	icon_state = "artificer"
	icon_living = "artificer"
	maxHealth = 50
	health = 50
	response_harm_continuous = "viciously beats"
	response_harm_simple = "viciously beat"
	harm_intent_damage = 5
	obj_damage = 60
	melee_damage_lower = 5
	melee_damage_upper = 5
	retreat_distance = 10
	minimum_distance = 10 //AI artificers will flee like fuck
	attack_verb_continuous = "rams"
	attack_verb_simple = "ram"
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'sound/weapons/punch2.ogg'
	construct_spells = list(/obj/effect/proc_holder/spell/aoe_turf/conjure/wall,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/floor,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/soulstone,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/construct/lesser,
							/obj/effect/proc_holder/spell/targeted/projectile/magic_missile/lesser)
	runetype = /datum/action/innate/cult/create_rune/revive
	playstyle_string = "<b>You are an Artificer. You are incredibly weak and fragile, but you are able to construct fortifications, \

						use magic missile, repair allied constructs, shades, and yourself (by clicking on them), \
						<i>and, most important of all,</i> create new constructs by producing soulstones to capture souls, \
						and shells to place those soulstones into.</b>"
	can_repair_constructs = TRUE
	can_repair_self = TRUE

/mob/living/simple_animal/hostile/construct/builder/Found(atom/A) //what have we found here?
	if(isconstruct(A)) //is it a construct?
		var/mob/living/simple_animal/hostile/construct/C = A
		if(C.health < C.maxHealth) //is it hurt? let's go heal it if it is
			return TRUE
		else
			return FALSE
	else
		return FALSE

/mob/living/simple_animal/hostile/construct/builder/CanAttack(atom/the_target)
	if(see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return FALSE
	if(Found(the_target) || ..()) //If we Found it or Can_Attack it normally, we Can_Attack it as long as it wasn't invisible
		return TRUE //as a note this shouldn't be added to base hostile mobs because it'll mess up retaliate hostile mobs

/mob/living/simple_animal/hostile/construct/builder/MoveToTarget(var/list/possible_targets)
	..()
	if(isliving(target))
		var/mob/living/L = target
		if(isconstruct(L) && L.health >= L.maxHealth) //is this target an unhurt construct? stop trying to heal it
			LoseTarget()
			return FALSE
		if(L.health <= melee_damage_lower+melee_damage_upper) //ey bucko you're hurt as fuck let's go hit you
			retreat_distance = null
			minimum_distance = 1

/mob/living/simple_animal/hostile/construct/builder/Aggro()
	..()
	if(isconstruct(target)) //oh the target is a construct no need to flee
		retreat_distance = null
		minimum_distance = 1

/mob/living/simple_animal/hostile/construct/builder/LoseAggro()
	..()
	retreat_distance = initial(retreat_distance)
	minimum_distance = initial(minimum_distance)

/mob/living/simple_animal/hostile/construct/builder/hostile //actually hostile, will move around, hit things, heal other constructs
	AIStatus = AI_ON
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES //only token destruction, don't smash the cult wall NO STOP

/////////////////////////////Non-cult Artificer/////////////////////////
/mob/living/simple_animal/hostile/construct/builder/noncult
	construct_spells = list(/obj/effect/proc_holder/spell/aoe_turf/conjure/wall,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/floor,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/soulstone/noncult,
							/obj/effect/proc_holder/spell/aoe_turf/conjure/construct/lesser,
							/obj/effect/proc_holder/spell/targeted/projectile/magic_missile/lesser)


/////////////////////////////Harvester/////////////////////////
/mob/living/simple_animal/hostile/construct/harvester
	name = "Harvester"
	real_name = "Harvester"
	desc = "A long, thin construct built to herald Nar'Sie's rise. It'll be all over soon."
	icon_state = "chosen"
	icon_living = "chosen"
	maxHealth = 40
	health = 40
	sight = SEE_MOBS
	melee_damage_lower = 15
	melee_damage_upper = 20
	attack_verb_continuous = "butchers"
	attack_verb_simple = "butcher"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	construct_spells = list(/obj/effect/proc_holder/spell/aoe_turf/area_conversion,
							/obj/effect/proc_holder/spell/targeted/forcewall/cult)
	playstyle_string = "<B>You are a Harvester. You are incapable of directly killing humans, but your attacks will remove their limbs: \
						Bring those who still cling to this world of illusion back to the Geometer so they may know Truth. Your form and any you are pulling can pass through runed walls effortlessly.</B>"
	can_repair_constructs = TRUE


/mob/living/simple_animal/hostile/construct/harvester/Bump(atom/AM)
	. = ..()
	if(istype(AM, /turf/closed/wall/mineral/cult) && AM != loc) //we can go through cult walls
		var/atom/movable/stored_pulling = pulling
		if(stored_pulling)
			stored_pulling.setDir(get_dir(stored_pulling.loc, loc))
			stored_pulling.forceMove(loc)
		forceMove(AM)
		if(stored_pulling)
			start_pulling(stored_pulling, supress_message = TRUE) //drag anything we're pulling through the wall with us by magic

/mob/living/simple_animal/hostile/construct/harvester/AttackingTarget()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		if(HAS_TRAIT(C, TRAIT_NODISMEMBER))
			return ..()		//ATTACK!
		var/list/parts = list()
		var/undismembermerable_limbs = 0
		for(var/X in C.bodyparts)
			var/obj/item/bodypart/BP = X
			if(BP.body_part != HEAD && BP.body_part != CHEST)
				if(BP.dismemberable)
					parts += BP
				else
					undismembermerable_limbs++
		if(!LAZYLEN(parts))
			if(undismembermerable_limbs) //they have limbs we can't remove, and no parts we can, attack!
				return ..()
			C.DefaultCombatKnockdown(60)
			visible_message("<span class='danger'>[src] knocks [C] down!</span>")
			to_chat(src, "<span class='cultlarge'>\"Bring [C.ru_na()] to me.\"</span>")
			return FALSE
		do_attack_animation(C)
		var/obj/item/bodypart/BP = pick(parts)
		BP.dismember()
		return FALSE
	. = ..()

/mob/living/simple_animal/hostile/construct/harvester/Initialize(mapload)
	. = ..()
	var/datum/action/innate/seek_prey/seek = new()
	seek.Grant(src)
	seek.Activate()

///////////////////////Master-Tracker///////////////////////

/datum/action/innate/seek_master
	name = "Seek your Master"
	desc = "You and your master share a soul-link that informs you of their location"
	background_icon_state = "bg_demon"
	buttontooltipstyle = "cult"
	button_icon_state = "cult_mark"
	var/tracking = FALSE

/datum/action/innate/seek_master/Activate()
	var/datum/antagonist/cult/C = owner.mind.has_antag_datum(/datum/antagonist/cult)
	if(!C)
		return
	if(!C.cult_team)
		to_chat(owner, "<span class='cult italic'>You are alone, and have no team.</span>")
		return
	var/datum/objective/eldergod/summon_objective = locate() in C.cult_team.objectives
	var/mob/living/simple_animal/hostile/construct/the_construct = owner
	if(summon_objective.check_completion())
		the_construct.master = C.cult_team.blood_target

	if(!the_construct.master)
		to_chat(the_construct, "<span class='cult italic'>You have no master to seek!</span>")
		the_construct.seeking = FALSE
		return
	if(tracking)
		tracking = FALSE
		the_construct.seeking = FALSE
		to_chat(the_construct, "<span class='cult italic'>You are no longer tracking your master.</span>")
		return
	else
		tracking = TRUE
		the_construct.seeking = TRUE
		to_chat(the_construct, "<span class='cult italic'>You are now tracking your master.</span>")


/datum/action/innate/seek_prey
	name = "Seek the Harvest"
	desc = "None can hide from Nar'Sie, activate to track a survivor attempting to flee the red harvest!"
	icon_icon = 'icons/mob/actions/actions_cult.dmi'
	background_icon_state = "bg_demon"
	buttontooltipstyle = "cult"
	button_icon_state = "cult_mark"

/datum/action/innate/seek_prey/Activate()
	if(GLOB.cult_narsie == null)
		return
	var/mob/living/simple_animal/hostile/construct/the_construct = owner
	if(the_construct.seeking)
		desc = "None can hide from Nar'Sie, activate to track a survivor attempting to flee the red harvest!"
		button_icon_state = "cult_mark"
		the_construct.seeking = FALSE
		to_chat(the_construct, "<span class='cult italic'>You are now tracking Nar'Sie, return to reap the harvest!</span>")
		return
	else
		if(LAZYLEN(GLOB.cult_narsie.souls_needed))
			the_construct.master = pick(GLOB.cult_narsie.souls_needed)
			var/mob/living/real_target = the_construct.master //We can typecast this way because Narsie only allows /mob/living into the souls list
			to_chat(the_construct, "<span class='cult italic'>You are now tracking your prey, [real_target.real_name] - harvest [real_target.ru_na()]!</span>")
		else
			to_chat(the_construct, "<span class='cult italic'>Nar'Sie has completed her harvest!</span>")
			return
		desc = "Activate to track Nar'Sie!"
		button_icon_state = "sintouch"
		the_construct.seeking = TRUE


/////////////////////////////ui stuff/////////////////////////////

/mob/living/simple_animal/hostile/construct/update_health_hud()
	if(hud_used)
		if(health >= maxHealth)
			hud_used.healths.icon_state = "[icon_state]_health0"
		else if(health > maxHealth*0.8)
			hud_used.healths.icon_state = "[icon_state]_health2"
		else if(health > maxHealth*0.6)
			hud_used.healths.icon_state = "[icon_state]_health3"
		else if(health > maxHealth*0.4)
			hud_used.healths.icon_state = "[icon_state]_health4"
		else if(health > maxHealth*0.2)
			hud_used.healths.icon_state = "[icon_state]_health5"
		else
			hud_used.healths.icon_state = "[icon_state]_health6"
