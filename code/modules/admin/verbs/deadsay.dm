/client/proc/dsay(msg as text)
	set category = "Special Verbs"
	set name = "Dsay" //Gave this shit a shorter name so you only have to time out "dsay" rather than "dead say" to use it --NeoFite
	set hidden = 1

	if(!src.holder)
		to_chat(src, "Only administrators may use this command.")
		return

	sanitize_and_communicate(/singleton/communication_channel/dsay, src, msg, /singleton/dsay_communication/admin)