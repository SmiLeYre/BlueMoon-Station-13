/obj/item/fee_terminal
	name = "Fee Terminal"
	desc = "A small device to collect fees straight to security budget."
	icon = 'icons/obj/device.dmi'
	icon_state = "fee_terminal"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/fee_value = 0
	var/datum/bank_account/linked_account = null
	var/obj/item/radio/security_radio

/obj/item/fee_terminal/Initialize(mapload)
	. = ..()

	// Create new radio
	security_radio = new /obj/item/radio(src)

	// Prevent radio listening
	security_radio.listening = 0

	// Set radio frequency
	security_radio.set_frequency(FREQ_SECURITY)

	// Set default account
	linked_account = SSeconomy.get_dep_account(ACCOUNT_SEC)


/obj/item/fee_terminal/attack_self(mob/user)
	var/obj/item/card/id/user_id = user.get_idcard()
	if(istype(user_id) && (ACCESS_SECURITY in user_id.access))
		fee_value = tgui_input_number(user, "Input fee value", "Fee setup", fee_value, 9999, 1)
		if(QDELETED(src) || !user.canUseTopic(src))
			return
		if(!fee_value)
			playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
			return
		src.say("Сумма штрафа установлена на [fee_value]")
	else
		src.say("Сумма штрафа установлена на [fee_value]")

/obj/item/fee_terminal/attackby(obj/item/item, mob/living/user, params)
	var/obj/item/card/id/id_card = item
	if (!istype(id_card))
		src.say("Вам необходимо провести картой по терминалу")
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return
	if (fee_value<1)
		src.say("Сумма штрафа должна быть положительной")
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return
	var/datum/bank_account/account = id_card.registered_account
	if (!account)
		src.say("К карте не привязан аккаунт")
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return
	if (!(account.account_balance >= fee_value))
		src.say("На карте недостаточно средств")
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, FALSE)
		return
	account.adjust_money(-1 * fee_value, "уплата штрафа")
	linked_account.adjust_money(fee_value, "уплата штрафа")
	playsound(src, 'sound/machines/terminal_prompt_confirm.ogg', 50, FALSE)
	security_radio.talk_into(src, "Штраф в размере [fee_value] кредитов уплачен [account.account_holder]")
	src.say("Штраф в размере [fee_value] кредитов уплачен")
	fee_value = 0
