/datum/ert/firesquad // Пожиратели огня
	roles = list(/datum/antagonist/ert/firesquad)
	leader_role = /datum/antagonist/ert/firesquad/leader
	enforce_human = TRUE
	rename_team = "NT Flametroopers Squad"
	code = "Red"
	mission = "Экипаж станции не справляется с активной биологической угрозой. Окажите соответствующую поддержку."
	polldesc = "an elite Nanotrasen Fire Team"
	ertphrase = "modular_bluemoon/kovac_shitcode/sound/ert/ert_firesquad_send.ogg"

/datum/ert/heavysquad // Удар молота
	roles = list(/datum/antagonist/ert/heavysquad, /datum/antagonist/ert/heavysquad/machinegun)
	leader_role = /datum/antagonist/ert/heavysquad/leader
	rename_team = "NT Heavy Weapons Squad"
	code = "Delta"
	mission = "По имеющимся разведанным на станции присутствует особо опасный и тяжеловооруженный противник. Корпорация заинтересована в сохранении своих активов. Разберитесь с проблемой."
	polldesc = "an elite Nanotrasen Heavy Team"
	ertphrase = "modular_bluemoon/kovac_shitcode/sound/ert/ert_heavysquad_send.ogg"

/datum/ert/russian_ert // НРИ
	roles = list(/datum/antagonist/ert/russian_ert)
	leader_role = /datum/antagonist/ert/russian_ert/leader
	rename_team = "Novaya Rossiyskaya Imperiya Spetsnaz Squad"
	code = "Delta"
	mission = "От одной из близлежащих космических станций получен сигнал о помощи. Мы связались с НТ и получили добро на вмешательство. Окажите поддержку."
	polldesc = "an Novaya Rossiyskaya Imperiya Spetsnaz Squad"
	ertphrase = "modular_bluemoon/kovac_shitcode/sound/ert/nri_send.ogg"
