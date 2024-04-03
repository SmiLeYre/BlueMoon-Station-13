//HUD styles.  Index order defines how they are cycled in F12.
#define HUD_STYLE_STANDARD 1 //Standard hud
#define HUD_STYLE_REDUCED 2 //Reduced hud (just hands and intent switcher)
#define HUD_STYLE_NOHUD 3 //No hud (for screenshots)

#define HUD_VERSIONS 3	//Used in show_hud(); Please ensure this is the same as the maximum index.

#define ui_borg_pda_send "CENTER+5:21,SOUTH:5" // To the right of the alert panel
#define ui_borg_pda_log "CENTER+6:21,SOUTH:5"

// Plane group keys, used to group swaths of plane masters that need to appear in subwindows
/// The primary group, holds everything on the main window
#define PLANE_GROUP_MAIN "main"
/// A secondary group, used when a client views a generic window
#define PLANE_GROUP_POPUP_WINDOW(screen) "popup-[REF(screen)]"
/// The filter name for the hover outline
#define HOVER_OUTLINE_FILTER "hover_outline"
