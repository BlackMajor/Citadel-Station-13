/*
⢀⡴⠑⡄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠸⡇⠀⠿⡀⠀⠀⠀⣀⡴⢿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠑⢄⣠⠾⠁⣀⣄⡈⠙⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⢀⡀⠁⠀⠀⠈⠙⠛⠂⠈⣿⣿⣿⣿⣿⠿⡿⢿⣆⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⢀⡾⣁⣀⠀⠴⠂⠙⣗⡀⠀⢻⣿⣿⠭⢤⣴⣦⣤⣹⠀⠀⠀⢀⢴⣶⣆ 
⠀⠀⢀⣾⣿⣿⣿⣷⣮⣽⣾⣿⣥⣴⣿⣿⡿⢂⠔⢚⡿⢿⣿⣦⣴⣾⠁⠸⣼⡿ 
⠀⢀⡞⠁⠙⠻⠿⠟⠉⠀⠛⢹⣿⣿⣿⣿⣿⣌⢤⣼⣿⣾⣿⡟⠉⠀⠀⠀⠀⠀ 
⠀⣾⣷⣶⠇⠀⠀⣤⣄⣀⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 		WARNING: THE SHITCODE BELOW HAS BEEN HASTILY
⠀⠉⠈⠉⠀⠀⢦⡈⢻⣿⣿⣿⣶⣶⣶⣶⣤⣽⡹⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 		COPY AND PASTED, PORTED FROM AWKWARD PLACES, AND PROBABLY MADE WORSE.
⠀⠀⠀⠀⠀⠀⠀⠉⠲⣽⡻⢿⣿⣿⣿⣿⣿⣿⣷⣜⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣶⣮⣭⣽⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⣀⣀⣈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀ WELCOME TO JT's TG-CODE HALLOWEEN BALL CODEFILE.
⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀ 					ALL OF IT WILL HOPEFULLY BE BELOW.
⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠿⠿⠿⠿⠛⠉
*/
//Also Shrek will crash your dmlang server if you edit him.

//For some reason this file refuses to pull many defines, Here at least. So heres RANGE_TURFS again.
#define RANGE_TURFS(RADIUS, CENTER) \
  block( \
    locate(max(CENTER.x-(RADIUS),1),          max(CENTER.y-(RADIUS),1),          CENTER.z), \
    locate(min(CENTER.x+(RADIUS),world.maxx), min(CENTER.y+(RADIUS),world.maxy), CENTER.z) \
  )

/*
	Basic Grass turf w Flora gen
									*/
/turf/open/floor/grass/spooktimegrass
	name = "grass patch"
	desc = "You can't tell if this is real grass... Ah, who are you kidding, it totally is real grass."
	icon_state = "grass_1"
	icon = '_maps/map_files/Eventstations/iconfile32.dmi' //32x32 iconfile, sry we had different sizes.
	broken_states = list("sand")
	bullet_bounce_sound = null //For some reason we can't actually pull the footstep global lists in here.
	gender = PLURAL //THE GENDER IS PLURAL
	
	baseturfs = /turf/open/floor/grass/spooktimegrass //BENEATH SPOOKTIMEGRASS THERE IS SPOOKTIMEGRASS
	planetary_atmos = TRUE //REVERT TO INITIAL AIR GASMIX OVER TIME WITH LINDA	
	tiled_dirt = FALSE //NO TILESMOOTHING DIRT OR SOME SHIT
	
	//This applies a decent amount of load once, but do you want it pitch black or midnight.
	light_range = 3 //The light range on the baseturf - Basically so its extremely dark but not pitchblack
	light_power = 0.15 //Light power on the - BLACKMAJOR ADJUST THESE AS YOU SEE FIT.
	light_color = "#00111a" //A darker blue, so its not just indoor black.
	//Sorry, no day/night cycle subsystem included since this ball will be at midnight the entire time.
	
	//Holders for what can occur on the turf.
	var/obj/structure/flora/turfGrass
	var/obj/structure/flora/turfDeadtree
	var/obj/structure/flora/turfAusflora
	var/obj/structure/flora/turfRocks
	var/obj/structure/flora/turfDebris


/turf/open/floor/grass/spooktimegrass/Initialize()
	. = ..()
	icon_state = "grass_[rand(1,3)]" //Icon state variation for how many states of grass I got... 3 lul
	//If no fences, machines (soil patches are machines), etc. try to plant grass
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		floraGen() //And off we go riding into hell.
	update_icon()

//FEEL FREE TO FIDDLE WITH THIS BLACKMAJOR/FERMI/ETC. I'm still going to tune it in initially tho. -JTGSZ
//It'll work alongside any trees you place too, so its all gucci man dw.

//This is mostly for flora/doodads. I don't feel like there needs to be lake/cave and animals generation..
//For the halloween map at least, so I used the f13 flora gen and appended to it instead of usin cellular automata.
//Soooo, its just tied to the turf initialize on init right now.

//I have turned what used to be simple into hell.
//We can keep appending stuff here as we go, it basically just spawns it all on turf spooktimegrass on init.
#define GRASS_SPONTANEOUS 		2 //solo grass
#define GRASS_WEIGHT 			4 //controls probability that it spawns, and probability of how much it spreads.
#define DEADTREE_SPONTANEOUS	2 //Solo deadtree
#define DEADTREE_WEIGHT			4
#define AUSFLORA_SPONTANEOUS	2
#define AUSFLORA_WEIGHT			4
#define ROCKS_SPONTANEOUS		2 //Technically this can be moved to the desolate spawn list tied to grass.
#define ROCKS_WEIGHT			1 //Lower weight cause rock clusters were too common.
#define DEBRIS_SPONTANEOUS		2
#define DEBRIS_WEIGHT			2

//Enjoy the horizontals. These are basically what can spawn in the lists, the number is the weight.
//The weight dictates how likely it is to spawn over other things in the lists. If it is to spawn.
#define LUSH_GRASS_SPAWN_LIST list(/obj/structure/flora/grass/spookytime = 10)
#define DEAD_TREE_SPAWN_LIST list(/obj/structure/flora/tree/spookytime = 8, /obj/structure/flora/tree/spookytimexl = 2)
#define AUSFLORA_SPAWN_LIST list(/obj/structure/flora/ausbushes = 1)
#define ROCKS_SPAWN_LIST	list(/obj/structure/flora/spookyrock = 1)
#define DEBRIS_SPAWN_LIST	list(/obj/structure/flora/tree/spookybranch = 5, /obj/structure/flora/tree/spookylog = 1)

//Lists that occur when the cluster doesn't happen but probability dictates it tries.
#define DESOLATE_SPAWN_LIST list(/obj/structure/flora/grass/spookytime = 1)

//I just kinda made it worse... Like a lot worse. Ngl man.
/turf/open/floor/grass/spooktimegrass/proc/floraGen()	
	var/grassWeight = 0 //grassWeight holders for each individual layer
	var/deadtreeWeight = 0
	var/ausfloraWeight = 0
	var/rocksWeight = 0
	var/debrisWeight = 0
	
	var/randGrass = null //The random plant picked
	var/randDeadtree = null //The random deadtree picked
	var/randAusflora = null //The random Ausflora picked
	var/randRocks = null //The random rock picked
	var/randDebris = null //The random wood debris picked

	//spontaneously spawn the objects based on probability from the define.
	//Ngl, a lot of this is going to be have to generate in certain orders later in this proc.
	if(prob(GRASS_SPONTANEOUS))
		randGrass = pickweight(LUSH_GRASS_SPAWN_LIST) //Create a new grass object at this location, and assign var
		turfGrass = new randGrass(src) //The var on the turf now has a new randgrass from the list.

	if(prob(DEADTREE_SPONTANEOUS))
		randDeadtree = pickweight(DEAD_TREE_SPAWN_LIST)
		turfDeadtree = new randDeadtree(src)

	if(prob(AUSFLORA_SPONTANEOUS))
		randAusflora = pickweight(AUSFLORA_SPAWN_LIST)
		turfAusflora = new randAusflora(src)

	if(prob(ROCKS_SPONTANEOUS))
		randRocks = pickweight(ROCKS_SPAWN_LIST)
		turfRocks = new randRocks(src)
	
	if(prob(DEBRIS_SPONTANEOUS))
		randDebris = pickweight(DEBRIS_SPAWN_LIST)
		turfDebris = new randDebris(src)

	
	//loop through neighbouring turfs, if they have grass, then increase weight, cluster prep.
	for(var/turf/open/floor/grass/spooktimegrass/T in RANGE_TURFS(3, src))
		if(T.turfGrass) //We check what is around our turf
			grassWeight += GRASS_WEIGHT //The weight is increased by grass weight per every grass we find
		if(T.turfDeadtree)
			deadtreeWeight += DEADTREE_WEIGHT
		if(T.turfAusflora)
			ausfloraWeight += AUSFLORA_WEIGHT
		if(T.turfRocks)
			rocksWeight += ROCKS_WEIGHT
		if(T.turfDebris)
			debrisWeight += DEBRIS_WEIGHT
	

	//Below is where we handle clusters really.
	//use weight to try to spawn grass
	if(prob(grassWeight)) //Basically after the earlier calc, we now roll probability.
		//If surrounded on 5+ sides, pick from lush
		if(grassWeight == (5 * GRASS_WEIGHT)) //If the grassweight is equivalent to 5 times GRASSWEIGHT which is 4
			randGrass = pickweight(LUSH_GRASS_SPAWN_LIST) //We pick from the lush list, aka boys that can be together.
		else //Else.
			randGrass = pickweight(DESOLATE_SPAWN_LIST) //We pick from boys that are fine being alone.
		turfGrass = new randGrass(src) //And at the end we set the turfgrass to this object.
	
	if(prob(deadtreeWeight)) //We can technically redirect individuals down here too, but lets just focus on clumps.
		randDeadtree = pickweight(DEAD_TREE_SPAWN_LIST)
		turfDeadtree = new randDeadtree(src)
	
	if(prob(ausfloraWeight))
		randAusflora = pickweight(AUSFLORA_SPAWN_LIST)
		turfAusflora = new randAusflora(src)

	if(prob(rocksWeight))
		randRocks = pickweight(ROCKS_SPAWN_LIST)
		turfRocks = new randRocks(src)

	if(prob(debrisWeight))
		randDebris = pickweight(DEBRIS_SPAWN_LIST)
		turfDebris = new randDebris(src)

//Make sure we delete the objects if we ever change turfs
/turf/open/floor/grass/spooktimegrass/ChangeTurf()
	if(turfGrass)
		qdel(turfGrass)
	if(turfDeadtree)
		qdel(turfDeadtree)
	if(turfAusflora)
		qdel(turfAusflora)
	if(turfRocks)
		qdel(turfRocks)
	if(turfDebris)
		qdel(turfDebris)
	. =  ..()

//Grass baseturf helper, more than likely completely unneeded since its set on the original turf too.
/obj/effect/baseturf_helper/spooktimegrass
	name = "grass baseturf helper" //Basically just changes the baseturf into grass
	baseturf = /turf/open/floor/grass/spooktimegrass //Wherever it is at.

/* so we can't break this */
/turf/open/floor/grass/spooktimegrass/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return //No replacing it

/turf/open/floor/grass/spooktimegrass/burn_tile()
	return //No burning it

/turf/open/floor/grass/spooktimegrass/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return //No slippery

/turf/open/floor/grass/spooktimegrass/MakeDry()
	return //No making it dry.

/*
	The Flora that is generated onto the basic grassturf, or can be placed for tone building.
																								*/

//For ease of use, I'm appending ausflora variations here too.
//Stripped the other segments out, people don't need hay and interactions right now you know man?
/obj/structure/flora/grass/spookytime
	icon = '_maps/map_files/Eventstations/iconfile32.dmi' //32x32 iconfile
	desc = "Some dry, virtually dead grass, cause its fall and not a wasteland this time."
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/spookytime/New()
	..()
	icon_state = "tall_grass_[rand(1,8)]" //We have 8 states.

/obj/structure/flora/tree/spookytime
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = '_maps/map_files/Eventstations/iconfile64.dmi' //64x64 iconfile
	icon_state = "deadtree_1"
	log_amount = 3
	obj_integrity = 100
	max_integrity = 100

/obj/structure/flora/tree/spookytime/New()
	icon_state = "deadtree_[rand(1,6)]" //We have 6 states
	..()

/obj/structure/flora/tree/spookytimexl
	name = "tall dead tree"
	desc = "It's a tree. Useful for combustion and/or construction. This ones quite tall"
	icon = '_maps/map_files/Eventstations/talltree128.dmi'
	icon_state = "tree_1"
	log_amount = 12
	obj_integrity = 200
	max_integrity = 200

/obj/structure/flora/tree/spookytimexl/New()
	icon_state = "tree_[rand(1,3)]" //We have 3 states.
	..()

/obj/structure/flora/tree/spookybranch
	name = "fallen branch"
	desc = "A branch from a tree"
	icon = '_maps/map_files/Eventstations/iconfile32.dmi'
	icon_state = "branch_1"
	log_amount = 1
	obj_integrity = 30
	max_integrity = 30

/obj/structure/flora/tree/spookybranch/New()
	icon_state = "branch_[rand(1,4)]"
	..()

/obj/structure/flora/tree/spookylog
	name = "fallen tree"
	desc = "A tree, that turned horizontal after it died"
	icon = '_maps/map_files/Eventstations/iconfile32.dmi'
	icon_state = "timber"
	log_amount = 5
	obj_integrity = 100
	max_integrity = 100 //only got one state man.

/obj/structure/flora/spookyrock
	name = "rock"
	desc = "Its a rock man. Hard as shit, and for you quite impassible."
	icon = '_maps/map_files/Eventstations/iconfile32.dmi'
	icon_state = "rock_1"
	density = 1

/obj/structure/flora/spookyrock/New()
	icon_state = "rock_[rand(1,3)]"
	..()