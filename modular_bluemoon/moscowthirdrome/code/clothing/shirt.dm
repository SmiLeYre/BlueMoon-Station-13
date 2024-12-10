//Copypaste from clothing/suit/toggle but for underwear.

/obj/item/clothing/underwear/shirt/toggle //it should allow us to use togglename(questionmark)
    icon = 'icons/obj/clothing/suits.dmi'
    name = "This item should never be used. Ahelp if you somehow found this."
    var/togglename = null
    var/suittoggled = FALSE

/obj/item/clothing/underwear/shirt/toggle/AltClick(mob/user)
    . = ..()
    if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
        return
    suit_toggle(user)
    return TRUE

/obj/item/clothing/underwear/shirt/toggle/proc/on_toggle(mob/user) // override this, not suit_toggle, which does checks
    to_chat(usr, "<span class='notice'>You toggle [src]'s [togglename].</span>")

/obj/item/clothing/underwear/shirt/toggle/ui_action_click()
    suit_toggle()

/obj/item/clothing/underwear/shirt/toggle/proc/suit_toggle()
    set src in usr

    if(!can_use(usr))
        return FALSE

    on_toggle(usr)
    if(src.suittoggled)
        src.icon_state = "[initial(icon_state)]"
        src.suittoggled = FALSE
    else if(!src.suittoggled)
        src.icon_state = "[initial(icon_state)]_t"
        src.suittoggled = TRUE
    usr.update_inv_wear_suit()
    for(var/X in actions)
        var/datum/action/A = X
        A.UpdateButtons()

/obj/item/clothing/underwear/shirt/toggle/examine(mob/user)
    . = ..()
    . += "Alt-click on [src] to toggle the [togglename]."

//Copypaste ends

/obj/item/clothing/underwear/shirt/toggle/savannah_sleepwear
    name = "sleepwear"
    desc = "A sleepshirt. Fancy?"
    icon = 'modular_bluemoon/moscowthirdrome/icons/clothing/obj/sleepwear.dmi'
    mob_overlay_icon = 'modular_bluemoon/moscowthirdrome/icons/clothing/mob/sleepwear.dmi'
    icon_state = "sleepwear"
    item_state = "sleepwear"
    togglename = "buttons"
    body_parts_covered = CHEST | ARMS
