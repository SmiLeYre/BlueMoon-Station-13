/datum/bounty/item/medical/heart
	name = "Heart"
	description = "Commander Johnson is in critical condition after suffering yet another heart attack. Doctors say he needs a new heart fast. Ship one, pronto!"
	reward = 3000
	wanted_types = list(/obj/item/organ/heart)

/datum/bounty/item/medical/lung
	name = "Lungs"
	description = "A recent explosion at Central Command has left multiple staff with punctured lungs. Ship spare lungs to be rewarded."
	reward = 7000
	required_count = 3
	wanted_types = list(/obj/item/organ/lungs)

/datum/bounty/item/medical/appendix
	name = "Appendix"
	description = "Chef Gibb of Central Command wants to prepare a meal using a very special delicacy: an appendix. If you ship one, he'll pay."
	reward = 4500 //there are no synthetic appendixes
	wanted_types = list(/obj/item/organ/appendix)

/datum/bounty/item/medical/ears
	name = "Ears"
	description = "Multiple staff at Station 12 have been left deaf due to unauthorized clowning. Ship them new ears."
	reward = 8000
	required_count = 3
	wanted_types = list(/obj/item/organ/ears)

/datum/bounty/item/medical/liver
	name = "Livers"
	description = "Multiple high-ranking CentCom diplomats have been hospitalized with liver failure after a recent meeting with Third Soviet Union ambassadors. Help us out, will you?"
	reward = 8500
	required_count = 3
	wanted_types = list(/obj/item/organ/liver)

/datum/bounty/item/medical/eye
	name = "Organic Eyes"
	description = "Station 5's Research Director Willem is requesting a few pairs of non-robotic eyes. Don't ask questions, just ship them."
	reward = 6000
	required_count = 3
	wanted_types = list(/obj/item/organ/eyes)
	exclude_types = list(/obj/item/organ/eyes/robotic)

/datum/bounty/item/medical/tongue
	name = "Tongues"
	description = "A recent attack by Mime extremists has left staff at Station 23 speechless. Ship some spare tongues."
	reward = 6500
	required_count = 3
	wanted_types = list(/obj/item/organ/tongue)

/datum/bounty/item/medical/lizard_tail
	name = "Lizard Tail"
	description = "The Wizard Federation has made off with Nanotrasen's supply of lizard tails. While CentCom is dealing with the wizards, can the station spare a tail of their own?"
	reward = 6000
	wanted_types = list(/obj/item/organ/tail/lizard)

/datum/bounty/item/medical/cat_tail
	name = "Cat Tail"
	description = "Central Command has run out of heavy duty pipe cleaners. Can you ship over a cat tail to help us out?"
	reward = 6000
	wanted_types = list(/obj/item/organ/tail/cat)

/datum/bounty/reagent/blood
	name = "Generic Blood"
	description = "Nanotrasen's annual blood drive is back up to full speed, following the garlic incident. Good blood in good volumes accepted for Credit returns."
	reward = 4500
	required_volume = 600
	wanted_reagent = /datum/reagent/blood

/* If anyone wants to try and fix/work, go for it
/datum/bounty/item/medical/medibot // Mob so this dosn't work yet*
	name = "Medibot"
	description = "A sister station is dealing with um problem, they need a medibot to help treat their wounded..."
	reward = 3000
	wanted_types = list(/mob/living/simple_animal/bot/medbot)

/datum/bounty/item/medical/bloodl //Dosnt work do to how blood is yet*
	name = "L-type Blood"
	description = "After a small scuffle, a few of our lizard employees need another blood transfusion."
	reward = 4000
	required_count = 200
	wanted_types = (L,/datum/reagent/blood)
	if(istype(L,/datum/reagent/blood))
	wanted_types += L

/datum/bounty/item/medical/bloodu //Dosnt work do to how blood is yet*
	name = "U-Type Blood"
	description = "After dealing with a small revolt in a local penal colony, the colony's anemic CMO needs blood, urgently. With his compromised immune system, only the best blood can be used."
	reward = 5500 // Rarer blood
	required_count = 200
	wanted_types = (U,/datum/reagent/blood)
	if(istype(U,/datum/reagent/blood))
	wanted_types += U

*/

/datum/bounty/item/medical/surgery
	name = "Surgery tool implants"
	description = "Our medical interns keep dropping their Shambler's Juice while they're performing open heart surgery. One of them even had the audacity to say he only had two hands!"
	reward = 9500
	required_count = 3
	wanted_types = list(/obj/item/organ/cyberimp/arm/surgery)

/datum/bounty/item/medical/chemmaker
	name = "Portable Chem Dispenser"
	description = "After a new chemist mixed up some water and a banana, we lost our only chem dispenser. Please send us a replacement and you will be compensated."
	reward = 5000
	wanted_types = list(/obj/machinery/chem_dispenser)

/datum/bounty/item/medical/advhealthscaner
	name = "Advanced Health Analyzer"
	description = "A ERT Medical unit needs the new 'advanced health analyzer', for a mission at a Station 4. Can you send some?."
	reward = 6700
	required_count = 5
	wanted_types = list(/obj/item/healthanalyzer/advanced)

/datum/bounty/item/medical/wallmounts
	name = "Defibrillator wall mounts"
	description = "New Space OSHA regulation state that are new cloning medical wing needs a few 'Easy to access defibrillartors'. Can you send a few before we get a lawsuit?"
	reward = 3600
	required_count = 3
	wanted_types = list(/obj/machinery/defibrillator_mount)

/datum/bounty/item/medical/defibrillator
	name = "New defibillators"
	description = "After years of storage our defibrillation units have worn out. Please send us some new ones."
	reward = 6800
	required_count = 5
	wanted_types = list(/obj/item/defibrillator)

/datum/bounty/item/medical/chainsaw
	name = "Chainsaw"
	description = "A CMO at CentCom is having trouble operating on golems. She requests one chainsaw, please."
	reward = 15500
	wanted_types = list(/obj/item/chainsaw)

/datum/bounty/item/medical/tail_whip //Like the cat tail bounties, with more processing.
	name = "Nine Tails whip"
	description = "Commander Jackson is looking for a fine addition to her exotic weapons collection. She will reward you handsomely for either a Cat or Liz o' Nine Tails."
	reward = 4000
	wanted_types = list(/obj/item/melee/chainofcommand/tailwhip)
