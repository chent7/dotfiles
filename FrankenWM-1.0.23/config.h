#ifndef CONFIG_H
#define CONFIG_H

/* DEFINITIONS MUST BE PRESENT EVEN WHEN UNUSED, DO NOT REMOVE */
// SHELL
#define SHCMD(cmd)          {.com = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

// KEY DEFINITIONS
#define MOD1                Mod1Mask
#define MOD4                Mod4Mask
#define CONTROL             ControlMask
#define SHIFT               ShiftMask

// WM CONFIGURATIONS
#define DESKTOPS            10
#define DEFAULT_DESKTOP     0
#define GLOBALGAPS          True
#define USELESSGAP          12
#define DEFAULT_MODE        TILE
#define MASTER_SIZE         0.55
#define ATTACH_ASIDE        True
#define FOLLOW_MOUSE        True
#define FOLLOW_WINDOW       False
#define CLICK_TO_FOCUS      False
#define MINWSZ              50
#define INVERT              False
#define AUTOCENTER          True
#define OUTPUT_TITLE        False

// BAR
#define SHOW_PANEL          False
#define TOP_PANEL           True
#define PANEL_HEIGHT        18
#define EWMH_TASKBAR        True

// WINDOW DECORATION
#define MONOCLE_BORDERS     True
#define BORDER_WIDTH        2
#define SCRATCH_WIDTH       2
#define FOCUS               "#cccccc"
#define UNFOCUS             "#121212"
#define SCRATCH             "#cc0000"

// SCRATCHPAD
#define USE_SCRATCHPAD      True
#define CLOSE_SCRATCHPAD    True
#define SCRPDNAME           "scratchpad"

// APPLICATION RULES
static const AppRule rules[] = { \
    // TITLE REGEX     DESKTOP FOLLOW FLOAT BORDER_WIDTH
    { "Pavucontrol",        -1, True, True, -1 },
};

// PROGRAM VARIABLES
static const char *scrpcmd[] = { "kitty", "-T", "scratchpad", NULL };
static const char *termcmd[] = { "kitty", NULL };
static const char *menucmd[] = { "dmenu_run", NULL };
static const char *roficmd[] = { "rofi", "-show", "drun", NULL };
static const char *lockcmd[] = { "i3lock", "-e", "-B", "4", NULL };
static const char *scrnshotcmd[] = { "flameshot", "gui", NULL };

/* KEYBINDS */
// NOT ALL AVAILABLE KEYBINDS ARE USED
//      MODIFIERS           KEY             FUNCTION            ARGS
#define DESKTOPCHANGE(K,N) \
    { MOD1,                 K,              change_desktop,     {.i = N} }, \
    { MOD1|ShiftMask,       K,              client_to_desktop,  {.i = N} },

// MOUSE
static Button buttons[] = {
    { MOD1,                 Button1,        mousemotion,        {.i = MOVE} },
    { MOD1,                 Button3,        mousemotion,        {.i = RESIZE} },
};

static key keys[] = {
    // DEFINED PROGRAMS
    { MOD1,                 XK_Return,      spawn,              {.com = termcmd} },
    { MOD1,                 XK_p,           spawn,              {.com = menucmd} },
    { MOD1,                 XK_d,           spawn,              {.com = roficmd} },
    { MOD4,                 XK_l,           spawn,              {.com = lockcmd} },
    { MOD4|SHIFT,           XK_s,           spawn,              {.com = scrnshotcmd} },

    // WINDOW MANAGER CONTROL
    { MOD1|SHIFT,           XK_q,           killclient,         {NULL} },
    { MOD1|CONTROL,         XK_q,           quit,               {.i = 0} },
    { MOD1|SHIFT,           XK_Tab,         next_win,           {NULL} },
    { MOD1,                 XK_e,           minimize,           {NULL} },
    { MOD1|SHIFT,           XK_e,           restore,            {NULL} },
    { MOD1,                 XK_t,           tilemize,           {NULL} },
    { MOD1,                 XK_f,           maximize,           {NULL} },
    { MOD1,                 XK_s,           togglescratchpad,   {NULL} },

    // MASTER AND STACK CONTROL
    { MOD1|SHIFT,           XK_Return,      swap_master,        {NULL} },
    { MOD1,                 XK_minus,       resize_master,      {.i = -10} },
    { MOD1,                 XK_equal,       resize_master,      {.i = +10} },

    // WORKSPACES
    { MOD1,                 XK_Tab,         rotate,             {.i = +1} },
      DESKTOPCHANGE(        XK_1,                               0       )
      DESKTOPCHANGE(        XK_2,                               1       )
      DESKTOPCHANGE(        XK_3,                               2       )
      DESKTOPCHANGE(        XK_4,                               3       )
      DESKTOPCHANGE(        XK_5,                               4       )
      DESKTOPCHANGE(        XK_6,                               5       )
      DESKTOPCHANGE(        XK_7,                               6       )
      DESKTOPCHANGE(        XK_8,                               7       )
      DESKTOPCHANGE(        XK_9,                               8       )
      DESKTOPCHANGE(        XK_0,                               9       )
};
#endif

