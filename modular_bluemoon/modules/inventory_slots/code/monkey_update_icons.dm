//update whether our shoulder item appears on our hud.
/mob/living/carbon/proc/update_hud_shoulders(obj/item/I)
	return

//update whether our shoulder item appears on our hud.
/mob/living/carbon/monkey/update_hud_shoulders(obj/item/I)
	if(client && hud_used && hud_used.hud_shown)
		I.screen_loc = ui_monkey_shoulders
		client.screen += I
