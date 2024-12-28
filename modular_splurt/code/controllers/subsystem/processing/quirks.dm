//BLUEMOON DELETE из-за нужды в переводе это всё в основе проке
// Add incompatible quirks.
// Inspired from LeDrascol's code. Thank you.
/*
/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	. = ..()

	// Prevent incompatible quirks.
	LAZYADD(quirk_blacklist, list(
		// BLOCKED: Thematic, mechanic.
		// Hallowed is a direct foil to Cursed Blood.
		// Causes a conflict with Holy Water effects.
		list("Hallowed","Cursed Blood"),

		// BLOCKED: Thematic, mechanic, game lore.
		// Bloodsuckers cannot interact with Hallowed users.
		list("Hallowed","Bloodsucker Fledgling"),

		// BLOCKED: Thematic, mechanic.
		// Explains itself∼!
		list("Buns of Steel","Buns of Thunder"),

		// BLOCKED: Mechanic
		// Bloodsuckers have NO_THIRST trait.
		list("Thirsty","Bloodsucker Fledgling"),

		// BLOCKED: Duplicate, mechanic
		// This is a lite version of the same quirk.
		list("Sanguine Metabolism","Bloodsucker Fledgling"),

		// BLOCKED: Mechanic
		// Bloodsuckers have NO_THIRST trait.
		list("Sanguine Metabolism","Thirsty"),

		// BLOCKED: Thematic, mechanic, game lore.
		// Bloodsuckers cannot interact with Hallowed users.
		list("Sanguine Metabolism","Hallowed")
		))
*/
