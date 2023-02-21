// The random spawn proc on the antag datum will handle announcing the spawn and whatnot.
/datum/event/random_antag/announce()
	return

/datum/event/random_antag/start()
	var/list/valid_types = list()

	for(var/antag_type in GLOB.all_antag_types_)
		var/datum/antagonist/antag = GLOB.all_antag_types_[antag_type]
		if(antag.flags & ANTAG_RANDSPAWN)
			valid_types |= antag
	if(length(valid_types))
		var/datum/antagonist/antag = pick(valid_types)
		antag.attempt_random_spawn()