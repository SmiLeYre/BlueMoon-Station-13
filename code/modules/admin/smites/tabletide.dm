/// Tableslam the target
/datum/smite/tabletide
	name = "Table Tideslam"

/datum/smite/tabletide/effect(client/user, mob/living/target)
	. = ..()
	priority_announce(html_decode("[target] навлёк на себя гнев Богов и теперь размазывается по столам всей станции. Пожалуйста, будьте готовы."), null, 'sound/misc/announce.ogg', "Центральное Командование")
	var/list/areas = list()
	for(var/area/A in world)
		if(A.z == SSmapping.station_start)
			areas += A
	SEND_SOUND(target, sound('modular_splurt/sound/misc/slamofthenorthstar.ogg',volume=60))
	for(var/area/A in areas)
		for(var/obj/structure/table/T in A)
			T.tablepush(target, target)
			sleep(1)
