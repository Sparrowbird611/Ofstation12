/datum/species/plasmid
	name = SPECIES_PLASMID
	name_plural = "Plasmid"
	description = "Large and imposing, plasmids require phoron and specialized equipment to survive, lest they burn up in oxygenated environments."
	icon_template = 'icons/mob/human_races/species/template.dmi'
	icobase = 'icons/mob/human_races/species/plasmid/body.dmi'
	deform = 'icons/mob/human_races/species/plasmid/deformed_body.dmi'
	husk_icon = 'icons/mob/human_races/species/plasmid/husk.dmi'
	preview_icon = 'icons/mob/human_races/species/plasmid/preview.dmi'
	bandages_icon = 'icons/mob/bandage.dmi'
	health_hud_intensity = 3
	thirst_factor = 0.01
	brute_mod = 0.9
	burn_mod = 1.2
	breath_pressure = 10
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/punch)
	breath_type = GAS_PHORON
	exhale_type = GAS_HYDROGEN

	descriptors = list(
		/datum/mob_descriptor/height = 1,
		/datum/mob_descriptor/build = 1
		)

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_NO_FBP_CONSTRUCTION | SPECIES_NO_FBP_CHARGEN | SPECIES_NO_ROBOTIC_INTERNAL_ORGANS
	appearance_flags = SPECIES_APPEARANCE_HAS_EYE_COLOR

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/plasmid),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/plasmid),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/plasmid),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/plasmid),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/plasmid),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/plasmid),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/plasmid),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/plasmid),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/plasmid),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/plasmid),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/plasmid)
	)


	has_organ = list(
		BP_LUNGS =    /obj/item/organ/internal/lungs/plasmid,
		BP_EYES =     /obj/item/organ/internal/eyes/plasmid,
	)


/mob/living/carbon/human/plasmid/pl_effects() //you're made of the stuff why would it hurt you?
	return

/mob/living/carbon/human/plasmid/vomit(toxvomit = 0, timevomit = 1, level = 3) //nothing to really vomit out, considering they don't eat
	return

/mob/living/carbon/human/plasmid/get_breath_volume()
	return 2 //gives them more time between tank refills

/datum/species/plasmid/get_blood_name()
	return "phoronic plasma"

/datum/species/plasmid/equip_survival_gear(var/mob/living/carbon/human/H, extendedtank)
	. = ..()
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space/plasmid(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/space/plasmid(H), slot_wear_suit)

	if(H.get_equipped_item(slot_s_store))
		H.equip_to_slot_or_del(new /obj/item/tank/phoron_big(H), slot_r_hand)
		H.set_internals(H.r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/tank/phoron_big(H), slot_s_store)
		H.set_internals(H.s_store)

	if(istype(H.get_equipped_item(slot_back), /obj/item/storage/backpack))
		H.equip_to_slot_or_del(new /obj/item/storage/box/phoron(H.back), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/storage/box/phoron(H.back), slot_l_hand)

/datum/species/plasmid/handle_environment_special(var/mob/living/carbon/human/H)
	//Should they get exposed to oxygen, things get heated.
	if(H.stat != DEAD && H.get_pressure_weakness() > 0.6) //If air gets in, then well there's a problem.
		var/datum/gas_mixture/environment = H.loc.return_air()
		if(environment && environment.gas[GAS_OXYGEN] && environment.gas[GAS_OXYGEN] >= 0.5) //Phorosians so long as there's enough oxygen (0.5 moles, same as it takes to burn gaseous phoron).
			H.fire_stacks = max(H.fire_stacks,10)
			if(!H.on_fire)
				if(H.get_pressure_weakness() !=1)
					H.visible_message(
						"<span class='warning'>The internal seals on [H]'s suit break open! </span>",
						"<span class='warning'>The internal seals on your suit break open!</span>"
					)
				H.visible_message(
					"<span class='warning'>[H]'s body reacts with the atmosphere and starts to sizzle and burn!</span>",
					"<span class='warning'>Your body reacts with the atmosphere and starts to sizzle and burn!</span>"
				)
				H.IgniteMob()
			H.burn_skin(H.get_pressure_weakness())
			H.updatehealth()
