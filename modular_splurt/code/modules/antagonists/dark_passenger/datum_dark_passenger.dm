/datum/antagonist/dark_passenger
	name = "Dark Passenger"
	job_rank = ROLE_TRAITOR

/datum/antagonist/dark_passenger/greet()
	to_chat(owner, span_warning("Вы чувствуете, как навязчивые мысли овладевают вашим сознанием..."))
	owner.announce_objectives()
	antag_memory += "Я просто знаю, что во мне есть что-то темное. Я скрываю это. Я не говорю об этом. Но оно есть. Всегда. Этот тёмный пассажир моего сознания... и когда он за рулем, я чувствую себя... живым существом. Полубольным существом от ощущения полной неправильности. Я не борюсь с ним. Я не хочу. Мне всё нравится."

/datum/antagonist/dark_passenger/farewell()
	to_chat(owner, span_warning("Навязчивые мысли начинают исчезать..."))

