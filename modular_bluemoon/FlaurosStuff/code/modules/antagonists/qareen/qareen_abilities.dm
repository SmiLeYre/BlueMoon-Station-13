// Essentially the ability to cryo - Flauros
/mob/living/simple_animal/qareen/verb/qareen_ghostize()
	set name = "Reliquinsh Form"
	set desc = "Allows you to exit the physical realm and despawn, freeing up your ghost role slot."
	set category = "Qareen"

	if(alert("Would you like to relinquish your body and disappear? This action will delete your character and free your role slot.",,"Yes","No")!="Yes")
		return

    // We only want the slot back when we use the verb, not if we die from other causes
    // It's a bit hacky but oh well
	var/obj/effect/mob_spawn/qareen/spawner = locate(/obj/effect/mob_spawn/qareen)
	spawner.uses += 1
	qdel(src)

	return
