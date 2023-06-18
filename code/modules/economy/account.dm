#define DUMPTIME 3000

/datum/bank_account
	var/account_holder = "Rusty Venture"
	var/account_balance = 0
	var/datum/job/account_job
	var/list/bank_cards = list()
	var/add_to_accounts = TRUE
	var/transferable = TRUE
	var/account_id
	var/being_dumped = FALSE //pink levels are rising
	var/withdrawDelay = 0
	var/datum/bounty/civilian_bounty
	var/list/datum/bounty/bounties
	COOLDOWN_DECLARE(bounty_timer)
	///List with a transaction history for NT pay app
	var/list/transaction_history = list()

/datum/bank_account/New(newname, job)
	if(add_to_accounts)
		if(!SSeconomy)
			log_world("Wack")
		SSeconomy.bank_accounts += src
	account_holder = newname
	account_job = job
	account_id = rand(111111,999999)

/datum/bank_account/Destroy()
	if(add_to_accounts)
		SSeconomy.bank_accounts -= src
	return ..()

/**
 * Proc guarantees the account_id possesses a unique number.
 * If it doesn't, it tries to find a unique alternative.
 * It then adds it to the `SSeconomy.bank_accounts_by_id` global list.
 */
/datum/bank_account/proc/setup_unique_account_id()
	if (!add_to_accounts)
		return
	if(account_id && !SSeconomy.bank_accounts_by_id["[account_id]"])
		SSeconomy.bank_accounts_by_id["[account_id]"] = src
		return //Already unique
	for(var/i in 1 to 1000)
		account_id = rand(111111, 999999)
		if(!SSeconomy.bank_accounts_by_id["[account_id]"])
			break
	if(SSeconomy.bank_accounts_by_id["[account_id]"])
		stack_trace("Unable to find a unique account ID, substituting currently existing account of id [account_id].")
	SSeconomy.bank_accounts_by_id["[account_id]"] = src

/datum/bank_account/vv_edit_var(var_name, var_value) // just so you don't have to do it manually
	var/old_id = account_id
	var/old_balance = account_balance
	. = ..()
	switch(var_name)
		if(NAMEOF(src, account_id))
			if(add_to_accounts)
				SSeconomy.bank_accounts_by_id -= "[old_id]"
				setup_unique_account_id()
		if(NAMEOF(src, add_to_accounts))
			if(add_to_accounts)
				setup_unique_account_id()
			else
				SSeconomy.bank_accounts_by_id -= "[account_id]"
		if(NAMEOF(src, account_balance))
			add_log_to_history(var_value - old_balance, "Nanotrasen: Moderator Action")

/datum/bank_account/proc/dumpeet()
	being_dumped = TRUE
	withdrawDelay = world.time + DUMPTIME

/**
 * Performs the math component of adjusting a bank account balance.
 * Arguments:
 * * amount - the quantity of credits that will be written off if the value is negative, or added if it is positive.
 */
/datum/bank_account/proc/_adjust_money(amount)
	account_balance += amount
	if(account_balance < 0)
		account_balance = 0

/datum/bank_account/proc/adjust_money(amount, reason)
	if((amount < 0 && has_money(-amount)) || amount > 0)
		_adjust_money(amount)
		if(reason)
			add_log_to_history(amount, reason)
		return TRUE
	return FALSE

/datum/bank_account/proc/has_money(amt)
	return account_balance >= amt

/datum/bank_account/proc/transfer_money(datum/bank_account/from, amount)
	if(!from.transferable || !from.has_money(amount))
		return FALSE
	adjust_money(amount)
	from.adjust_money(-amount)
	return TRUE

/datum/bank_account/proc/payday(amount_of_paychecks, free = FALSE)
	if(!account_job)
		return
	var/money_to_transfer = round(account_job.paycheck * amount_of_paychecks)
	if(amount_of_paychecks == 1)
		money_to_transfer = clamp(money_to_transfer, 0, PAYCHECK_EASY) //We want to limit single, passive paychecks to regular crew income.
	if(free)
		adjust_money(money_to_transfer, "Nanotrasen: Shift Payment")
		SSblackbox.record_feedback("amount", "free_income", money_to_transfer)
		SSeconomy.station_target += money_to_transfer
		log_econ("[money_to_transfer] кредит[get_num_string(money_to_transfer)] выдано на аккаунт [src.account_holder] из дохода.")
		return TRUE
	else
		var/datum/bank_account/department_account = SSeconomy.get_dep_account(account_job.paycheck_department)
		if(department_account)
			if(!transfer_money(department_account, money_to_transfer))
				bank_card_talk("ERROR: Зарплата отменена. Недостаточно средстве на счету отдела.")
				return FALSE
			else
				bank_card_talk("Зарплата выдана, текущий баланс: [account_balance] кр.")
				return TRUE
	bank_card_talk("ERROR: Зарплата не выдана. Невозможно связаться с аккаунтом отдела.")
	return FALSE

/datum/bank_account/proc/bank_card_talk(message, force)
	if(!message || !bank_cards.len)
		return
	for(var/obj/A in bank_cards)
		var/icon_source = A
		/*
		if(istype(A, /obj/item/card/id))
			var/obj/item/card/id/id_card = A
			if(id_card.uses_overlays)
				icon_source = id_card.get_cached_flat_icon()
		*/
		var/mob/card_holder = recursive_loc_check(A, /mob)
		if(ismob(card_holder)) //If on a mob
			if(!card_holder.client || (!(card_holder.client.prefs.chat_toggles & CHAT_BANKCARD) && !force))
				return

			card_holder.playsound_local(get_turf(card_holder), 'sound/machines/twobeep.ogg', 50, TRUE)
			if(card_holder.can_hear())
				to_chat(card_holder, "[icon2html(icon_source, card_holder)] <span class='notice'>[message]</span>")
		else if(isturf(A.loc)) //If on the ground
			for(var/mob/M in hearers(1,get_turf(A)))
				if(M.client && !(M.client.prefs.chat_toggles & CHAT_BANKCARD) && !force)
					return
				playsound(A, 'sound/machines/twobeep.ogg', 50, TRUE)
				A.audible_message("[icon2html(icon_source, hearers(A))] <span class='notice'>[message]</span>", null, 1)
				break
		else
			for(var/mob/M in A.loc) //If inside a container with other mobs (e.g. locker)
				if(!M.client || (!(M.client.prefs.chat_toggles & CHAT_BANKCARD) && !force))
					return
				M.playsound_local(get_turf(M), 'sound/machines/twobeep.ogg', 50, TRUE)
				if(M.can_hear())
					to_chat(M, "[icon2html(icon_source, M)] <span class='notice'>[message]</span>")

/**
  * Returns a string with the civilian bounty's description on it.
  */
/datum/bank_account/proc/bounty_text()
	if(!civilian_bounty)
		return FALSE
	if(istype(civilian_bounty, /datum/bounty/item))
		var/datum/bounty/item/item = civilian_bounty
		return item.description
	if(istype(civilian_bounty, /datum/bounty/reagent))
		var/datum/bounty/reagent/chemical = civilian_bounty
		return chemical.description

/**
  * Returns the required item count, or required chemical units required to submit a bounty.
  */
/datum/bank_account/proc/bounty_num()
	if(!civilian_bounty)
		return FALSE
	if(istype(civilian_bounty, /datum/bounty/item))
		var/datum/bounty/item/item = civilian_bounty
		return "[item.shipped_count]/[item.required_count]"
	if(istype(civilian_bounty, /datum/bounty/reagent))
		var/datum/bounty/reagent/chemical = civilian_bounty
		return "[chemical.shipped_volume]/[chemical.required_volume] u"

/**
  * Produces the value of the account's civilian bounty reward, if able.
  */
/datum/bank_account/proc/bounty_value()
	if(!civilian_bounty)
		return FALSE
	return civilian_bounty.reward

/**
  * Performs house-cleaning on variables when a civilian bounty is replaced, or, when a bounty is claimed.
  */
/datum/bank_account/proc/reset_bounty()
	civilian_bounty = null
	COOLDOWN_RESET(src, bounty_timer)

/datum/bank_account/department
	account_holder = "Guild Credit Agency"
	var/department_id = "REPLACE_ME"
	add_to_accounts = FALSE

/datum/bank_account/department/New(dep_id, budget)
	department_id = dep_id
	account_balance = budget
	account_holder = SSeconomy.department_accounts[dep_id]
	SSeconomy.generated_accounts += src

/datum/bank_account/remote // Bank account not belonging to the local station
	add_to_accounts = FALSE

/datum/bank_account/remote/non_transferable
	transferable = FALSE

/**
 * Add log to transactions history. Deletes the oldest log when the history has more than 20 entries.
 * Main format: Category: Reason in Reason. Example: Vending: Machinery Using
 * Arguments:
 * * adjusted_money - How much was added, negative values removing cash.
 * * reason - The reason of interact with balance, for example, "Bought chips" or "Payday".
 */
/datum/bank_account/proc/add_log_to_history(adjusted_money, reason)
	if(transaction_history.len >= 20)
		transaction_history.Cut(1,2)

	transaction_history += list(list(
		"adjusted_money" = adjusted_money,
		"reason" = reason,
	))

#undef DUMPTIME
