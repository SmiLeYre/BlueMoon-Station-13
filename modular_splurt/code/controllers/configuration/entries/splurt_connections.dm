/datum/config_entry/flag/need_discord_to_join

/datum/config_entry/flag/kick_vpn

/datum/config_entry/multi_keyed_flag/vpn_bypass
	postload_required = TRUE

/datum/config_entry/multi_keyed_flag/vpn_bypass/OnPostload()
	var/list/new_entries = list()
	for(var/key in default)
		new_entries[ckey(key)] = world.realtime
	default = new_entries

/datum/config_entry/multi_keyed_flag/vpn_bypass/proc/add_bypass(ckeytobypass)
	if(IsAdminAdvancedProcCall())
		return
	default |= ckey(ckeytobypass)
	default[ckey(ckeytobypass)] = world.realtime

/datum/config_entry/multi_keyed_flag/vpn_bypass/proc/rev_bypass(ckeytobypass)
	if(IsAdminAdvancedProcCall())
		return
	default -= ckey(ckeytobypass)
