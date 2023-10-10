#define CHANGETURF_DEFER_CHANGE		1
#define CHANGETURF_IGNORE_AIR		2 // This flag prevents changeturf from gathering air from nearby turfs to fill the new turf with an approximation of local air
#define CHANGETURF_FORCEOP			4
#define CHANGETURF_SKIP				8 // A flag for PlaceOnTop to just instance the new turf instead of calling ChangeTurf. Used for uninitialized turfs NOTHING ELSE
#define CHANGETURF_INHERIT_AIR 		16 // Inherit air from previous turf. Implies CHANGETURF_IGNORE_AIR
#define CHANGETURF_RECALC_ADJACENT 32 //Immediately recalc adjacent atmos turfs instead of queuing.

/// Returns a list of turfs similar to CORNER_BLOCK but with offsets
#define CORNER_BLOCK_OFFSET(corner, width, height, offset_x, offset_y) ((block(locate(corner.x + offset_x, corner.y + offset_y, corner.z), locate(min(corner.x + (width - 1) + offset_x, world.maxx), min(corner.y + (height - 1) + offset_y, world.maxy), corner.z))))

/// Returns a list of around us
#define TURF_NEIGHBORS(turf) (CORNER_BLOCK_OFFSET(turf, 3, 3, -1, -1) - turf)
