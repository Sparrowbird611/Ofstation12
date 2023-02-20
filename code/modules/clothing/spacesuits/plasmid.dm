/obj/item/clothing/suit/space/plasmid
	name = "Phoron Restructurant containment suit"
	icon = 'icons/obj/clothing/species/plasmid/obj_suit_plasmid.dmi'
	icon_state = "phorosiansuit"
	item_state = "phorosiansuit"
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_PHORONGUARD
	allowed = list(/obj/item/tank)
	desc = "A special containment suit designed to protect a Plasmid in oxygen-rich environments."
	species_restricted = list(SPECIES_PLASMID)
	sprite_sheets = list(
		SPECIES_PLASMID = 'icons/mob/species/plasmid/onmob_suit_plasmid.dmi'
		)
	can_breach = 1
	breach_threshold = 12
	resilience = 0.08
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_SHIELDED,
		bomb = ARMOR_BOMB_PADDED,
		bio =  ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)


/obj/item/clothing/head/helmet/space/plasmid
	name = "Plasmid helmet"
	desc = "A helmet made to help Plasmids survive in oxygen-rich environments. Has a plasma-glass visor."
	icon = 'icons/obj/clothing/species/plasmid/obj_head_plasmid.dmi'
	icon_state = "phorosian_helmet0"
	item_state = "phorosian_helmet0"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT | ITEM_FLAG_PHORONGUARD
	species_restricted = list(SPECIES_PLASMID)
	light_overlay = "helmet_light"
	sprite_sheets = list(
		SPECIES_PLASMID = 'icons/mob/species/plasmid/onmob_head_plasmid.dmi'
		)
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_SHIELDED,
		bomb = ARMOR_BOMB_PADDED,
		bio =  ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_SHIELDED
	)