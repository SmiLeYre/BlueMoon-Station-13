/obj/item/card/id/syndicate
	var/stationed = FALSE //убираем у "дружелюбных сотрудников синдиката из профессий на станции" возможность копировать доступ

/obj/item/card/id/syndicate/no_access_copy
	stationed = TRUE
