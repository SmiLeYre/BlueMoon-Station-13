/*
 * Contains:
 * 	Traitor garrotes
 * 	Improvised fiber wire
 *  Переписывалось с нуля
 *  С комментариями тут пиздец. Рефакторинга не будэ
 */

/obj/item/garrote // 6TC traitor item //  12
	name = "Garrote"
	desc = "A length of razor-thin wire with an elegant wooden handle on either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'modular_bluemoon/Fink/icons/obj/garrote.dmi'
	icon_state = "garrot_wrap"
	w_class = WEIGHT_CLASS_TINY
	var/mob/living/carbon/human/strangling //D.grabbedby(A, 1)
	var/improvised = 0
	var/garrote_time = 30
	var/wielded = FALSE
	var/list/obj/item/garrote/garroted_by = list()


/obj/item/garrote/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)

/obj/item/garrote/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed,icon_wielded="garrot_unwrap")

/obj/item/garrote/improvised/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, icon_wielded="garrot_I_unwrap")

/// triggered on wield of two handed item
/obj/item/garrote/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/// triggered on unwield of two handed item
/obj/item/garrote/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/*
/obj/item/garrote/attack_self(mob/living/user as mob)
	wielded= !wielded
	update_icon_state()
	return

/obj/item/garrote/improvised/attack_self(mob/living/user as mob)
	wielded= !wielded
	update_icon_state()
	return
*/

/*
/obj/item/garrote/Destroy()
	.=..()
	if(strangling)
		strangling.garroted_by.Remove(src)
	strangling = null
	return ..()
*/
/obj/item/garrote/update_icon_state()
	//.=..()

	icon_state = "garrot_wrap"
	//return
	//icon_state = "garrot_[wielded ? "un" : ""]wrap"

/obj/item/garrote/improvised // Made via tablecrafting
	//.=..()
	name = "fiber wire"
	desc = "A length of cable with a shoddily-carved wooden handle tied to either end.<br>You suspect you'd have to be behind the target to use this weapon effectively."
	icon = 'modular_bluemoon/Fink/icons/obj/garrote.dmi'
	icon_state = "garrot_I_wrap"
	improvised = 1

/obj/item/garrote/improvised/ComponentInitialize()
	.=..()
	AddComponent(/datum/component/two_handed)

/obj/item/garrote/improvised/update_icon_state()

	icon_state = "garrot_I_wrap"
	//return
	//icon_state = "garrot_I_[wielded ? "un" : ""]wrap"


/obj/item/twohanded/proc/unwield(obj/item/source, mob/living/carbon/user)

/*
/obj/item/garrote/unwield(obj/item/source, mob/living/carbon/user)
	//..=..()
	if(strangling)
		usr.visible_message("<span class='info'>[usr] removes the [src] from [strangling]'s neck.</span>", \
				"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")
		//strangling.garroted_by.Remove(src)
		strangling = null
		update_icon_state()
		STOP_PROCESSING(SSobj, src)
*/

/obj/item/garrote/attack(mob/living/carbon/M as mob, mob/user as mob)

	if(garrote_time > world.time) // Cooldown
		return

	if(!wielded)
		to_chat(user, "<span class = 'warning'>You must unwield the garrote to start straggling [M]!</span>")
		return

	if(!istype(user, /mob/living/carbon/human)) // spap_hand is a proc of /mob/living, user is simply /mob
		return

	var/mob/living/carbon/human/U = user
	var/victimdir = M.dir
	if((!istype(M, /mob/living/carbon/human))||((HAS_TRAIT(M, TRAIT_BLUEMOON_HEAVY_SUPER))&&(!HAS_TRAIT(U, TRAIT_BLUEMOON_HEAVY_SUPER))) )
		to_chat(user, "<span class = 'warning'>You don't think that garroting [M] would be very effective...</span>")
		return

	if(M == U)
		U.suicide() // This will display a prompt for confirmation first.
		return

	if(M.dir != U.dir && !M.lying)
		to_chat(user, "<span class='warning'>You cannot use [src] on [M] from that angle!</span>")
		return

	if(improvised && ((M.head && (M.head.flags_cover & HEADCOVERSMOUTH)))) // Improvised garrotes are blocked by mouth-covering items.
		to_chat(user, "<span class = 'warning'>[M]'s neck is blocked by something [M.p_theyre()] wearing!</span>")
		return
	//if(strangling)
	//	to_chat(user, "<span class = 'warning'>You cannot use [src] on two people at once!</span>")
	//	return

	//user.mode()

	//U.swap_hand() // For whatever reason the grab will not properly work if we don't have the free hand active.
	//var/obj/item/grab/G = M.grabbedby(U, 1)
	//U.swap_hand()


	if(improvised) // Not a trash anymore:|
		U.grab_state = GRAB_AGGRESSIVE
		M.grabbedby(U, 1)
		M.dir = victimdir
		U.setGrabState(GRAB_AGGRESSIVE)

	else
		U.grab_state = GRAB_KILL
		M.grabbedby(U, 1)
		M.dir = victimdir
		M.AdjustSilence(6 SECONDS)
		M.drop_all_held_items()
		U.setGrabState(GRAB_KILL)


	//update_icon_state()
	if(do_after(user,garrote_time, target = src))
		START_PROCESSING(SSobj, src)
		strangling = M

	playsound(src.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -1)

	M.visible_message("<span class='danger'>[U] comes from behind and begins garroting [M] with the [src]!</span>", \
				  "<span class='userdanger'>[U] begins garroting you with the [src]![improvised ? "" : " You are unable to speak!"]</span>", \
				  "You hear struggling and wire strain against flesh!")

	return

/obj/item/garrote/process()
	var/mob/living/carbon/human/user = loc
	if(!strangling)
		//usr.visible_message("<span class='info'>[usr] removes the [src] from [strangling]'s neck.</span>",
				//"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")
		//strangling.garroted_by.Remove(src)
		// Our mark got gibbed or similar
		//update_icon_state()
		STOP_PROCESSING(SSobj, src)
		pulledby.stop_pulling()
		return


	if(!istype(loc, /mob/living/carbon/human))
		//usr.visible_message("<span class='info'>[usr] removes the [src] from [strangling]'s neck.</span>",
				//"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")
		//strangling.garroted_by.Remove(src)
		strangling = null
		//update_icon_state()
		STOP_PROCESSING(SSobj, src)
		pulledby.stop_pulling()
		return

	if(strangling && !wielded)
		//usr.visible_message("<span class='info'>[usr] removes the [src] from [strangling]'s neck.</span>",
				//"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")
		//strangling.garroted_by.Remove(src)
		strangling = null
		//update_icon_state()
		STOP_PROCESSING(SSobj, src)
		pulledby.stop_pulling()
		return


	if(!user.pulling)
		//usr.visible_message("<span class='info'>[usr] removes the [src] from [strangling]'s neck.</span>",
				//"<span class='warning'>You remove the [src] from [strangling]'s neck.</span>")
		//strangling.garroted_by.Remove(src)
		strangling = null
		//update_icon_state()
		STOP_PROCESSING(SSobj, src)
		return



	//var/grab_state = null
/*
	if(src == user.r_hand && istype(user.l_hand, /obj/item/grab))
		G = user.l_hand

	else if(src == user.l_hand && istype(user.r_hand, /obj/item/grab))
		G = user.r_hand


	//user.visible_message("<span class='warning'>[user] loses [user.p_their()] grip on [strangling]'s neck.</span>",	"<span class='warning'>You lose your grip on [strangling]'s neck.</span>")

		//strangling.garroted_by.Remove(src)
		strangling = null
		update_icon_state()
		STOP_PROCESSING(SSobj, src)

		return

	if(!G.affecting)
		user.visible_message("<span class='warning'>[user] loses [user.p_their()] grip on [strangling]'s neck.</span>", \
				"<span class='warning'>You lose your grip on [strangling]'s neck.</span>")

		//strangling.garroted_by.Remove(src)
		strangling = null
		update_icon_state()
		STOP_PROCESSING(SSobj, src)

		return
*/

	if(improvised)

		strangling.adjustOxyLoss(6) // было 2



	//if(!(src in strangling.garroted_by))
	//	strangling.garroted_by+=src
	else

		strangling.Silence(6 SECONDS) // Non-improvised effects
		strangling.adjustOxyLoss(20) // было 20


/obj/item/garrote/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is wrapping the [src] around [user.p_their()] neck and pulling the handles! It looks like [user.p_theyre()] trying to commit suicide.</span>")
	playsound(src.loc, 'sound/weapons/cablecuff.ogg', 15, 1, -1)
	return OXYLOSS
