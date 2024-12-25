/datum/job/cmo
	custom_spawn_text = "стремитесь поддерживать чистоту в отделе. Следите за наличием лекарств в холодильниках. Оповещайте о угрозе вируса и принимайте соответсвующие решения. Вы - четвёртый в очереди на пост ВрИО капитана"

/datum/job/cmo/New()
	. = ..()
	var/list/extra_access = list(ACCESS_PSYCH)
	var/list/extra_minimal_access = list(ACCESS_PSYCH)
	LAZYADD(access, extra_access)
	LAZYADD(minimal_access, extra_minimal_access)
