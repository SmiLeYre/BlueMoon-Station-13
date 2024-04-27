/proc/detongueify(message) //for the half gag speech impediment function of deprivation helmets. could also be used for a standalone ring gag item.

	if(message[1] != "*")
		// Английский вариант замен
		var/static/regex/tongueless_lower_1 = new("\[tdpsfjz]+", "g")
		var/static/regex/tongueless_upper_1 = new("\[TDPSFJZ]+", "g")
		var/static/regex/tongueless_lower_2 = new("\[wlvb]+", "g")
		var/static/regex/tongueless_upper_2 = new("\[WLVB]+", "g")
		var/static/regex/tongueless_lower_3 = new("\[m]+", "g")
		var/static/regex/tongueless_upper_3 = new("\[M]+", "g")
		// Русский вариант замен
		var/static/regex/tongueless_lower_4 = new("\[тдпсфжз]+", "g")
		var/static/regex/tongueless_upper_4 = new("\[ТДПСФЖЗ]+", "g")
		var/static/regex/tongueless_lower_5 = new("\[влб]+", "g")
		var/static/regex/tongueless_upper_5 = new("\[ВЛБ]+", "g")
		var/static/regex/tongueless_lower_6 = new("\[м]+", "g")
		var/static/regex/tongueless_upper_6 = new("\[М]+", "g")

		message = tongueless_lower_1.Replace(message, pick("h", "hh"))
		message = tongueless_upper_1.Replace(message, pick("H", "HH"))
		message = tongueless_lower_2.Replace(message, pick("ooh", "uuh"))
		message = tongueless_upper_2.Replace(message, pick("OOH", "UUH"))
		message = tongueless_lower_3.Replace(message, pick("nn"))
		message = tongueless_upper_3.Replace(message, pick("NN"))

		message = tongueless_lower_4.Replace(message, pick("х", "хх"))
		message = tongueless_upper_4.Replace(message, pick("Х", "ХХ"))
		message = tongueless_lower_5.Replace(message, pick("оох", "уух"))
		message = tongueless_upper_5.Replace(message, pick("ООХ", "УУХ"))
		message = tongueless_lower_6.Replace(message, pick("нн"))
		message = tongueless_upper_6.Replace(message, pick("НН"))

	return message
