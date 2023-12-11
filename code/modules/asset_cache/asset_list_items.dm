//DEFINITIONS FOR ASSET DATUMS START HERE.

/// Removes all non-alphanumerics from the text, keep in mind this can lead to id conflicts
/proc/sanitize_css_class_name(name)
	var/static/regex/regex = new(@"[^a-zA-Z0-9]","g")
	return replacetext(name, regex, "")
