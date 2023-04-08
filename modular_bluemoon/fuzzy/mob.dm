/mob/living/Topic(href, href_list)
	if(href_list["toggle_fuzzy"])
		fuzzy = !fuzzy
		return
