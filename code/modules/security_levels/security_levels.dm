GLOBAL_VAR_INIT(security_level, SEC_LEVEL_GREEN)
//SEC_LEVEL_GREEN = code green
//SEC_LEVEL_BLUE = code blue
//SEC_LEVEL_ORANGE = code orange
//SEC_LEVEL_VIOLET = code violet
//SEC_LEVEL_AMBER = code amber
//SEC_LEVEL_RED = code red
//SEC_LEVEL_LAMBDA = code lambda
//SEC_LEVEL_EPSILON = code epsilon
//SEC_LEVEL_DELTA = code delta

/proc/get_security_level()
	switch(GLOB.security_level)
		if(SEC_LEVEL_GREEN)
			return "ЗЕЛЁНЫЙ"
		if(SEC_LEVEL_BLUE)
			return "СИНИЙ"
		if(SEC_LEVEL_ORANGE)
			return "ОРАНЖЕВЫЙ"
		if(SEC_LEVEL_VIOLET)
			return "ФИОЛЕТОВЫЙ"
		if(SEC_LEVEL_AMBER)
			return "ЯНТАРНЫЙ"
		if(SEC_LEVEL_RED)
			return "КРАСНЫЙ"
		if(SEC_LEVEL_LAMBDA)
			return "ЛЯМБДА"
		if(SEC_LEVEL_EPSILON)
			return "ЭПСИЛОН"
		if(SEC_LEVEL_DELTA)
			return "ДЕЛЬТА"

/*
  * All security levels, per ascending alert. Nothing too fancy, really.
  * Their positions should also match their numerical values.
  */
GLOBAL_LIST_INIT(all_security_levels, list("green", "blue", "orange", "violet", "amber", "red", "lambda", "epsilon", "delta"))

//config.alert_desc_blue_downto

/proc/set_security_level(level)
	SSsecurity_level.set_level(level)
