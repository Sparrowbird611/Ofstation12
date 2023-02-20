//INTERNAL ORGANS
/obj/item/organ/internal/lungs/plasmid
	name = "phoronized lungs"
	//icon_state = "lungs-plasma"
	desc = "A set of lungs seemingly made out of fleshy phoron."
	color = "#7e4ba0"


/obj/item/organ/internal/eyes/plasmid
	name = "crystallized eyeballs"
	desc = "A pair of crystal spheres in the shape of eyes. They give off a faint glow."
	phoron_guard = 1

/obj/item/organ/internal/eyes/plasmid/New()
	..()
	update_colour()

//EXTERNAL ORGANS
//Phoron reinforced bones woo.
/obj/item/organ/external/head/plasmid
	min_broken_damage = 50

/obj/item/organ/external/chest/plasmid
	min_broken_damage = 50

/obj/item/organ/external/groin/plasmid
	min_broken_damage = 50

/obj/item/organ/external/arm/plasmid
	min_broken_damage = 45

/obj/item/organ/external/arm/right/plasmid
	min_broken_damage = 45

/obj/item/organ/external/leg/plasmid
	min_broken_damage = 45

/obj/item/organ/external/leg/right/plasmid
	min_broken_damage = 45

/obj/item/organ/external/foot/plasmid
	min_broken_damage = 30

/obj/item/organ/external/foot/right/plasmid
	min_broken_damage = 30

/obj/item/organ/external/hand/plasmid
	min_broken_damage = 30

/obj/item/organ/external/hand/right/plasmid
	min_broken_damage = 30