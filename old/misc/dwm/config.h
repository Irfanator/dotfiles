/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
	"Tewi:size=9"
};
static const char dmenufont[]       = "Tewi:size=9";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#101608";
static const char normfgcolor[]     = "#c7c7c7";
static const char selbordercolor[]  = "#ff8484";
static const char selbgcolor[]      = "#101608";
static const char selfgcolor[]      = "#79e513";
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* gaps */
static const unsigned int gappx = 5;

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "feh",      NULL,       NULL,       0,            1,           -1 },
	{ "xine",     NULL,       NULL,       1 << 3,       0,           -1 },
	{ "Audacious",NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       2,            0,           -1 },
	{ "Firefox",  "Places",   "Library",  2,            1,           -1 },
	{ "Geeqie",   NULL,       NULL,       1 << 2,       1,           -1 },
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Lxappearance",NULL,    NULL,       0,            1,           -1 },
	{ "Nitrogen", NULL,       NULL,       0,            1,           -1 },
	{ "Pavucontrol",NULL,     NULL,       0,            1,           -1 },
	{ "Thunar",   NULL,       NULL,       1 << 2,       0,           -1 },
	{ "Smplayer", NULL,       NULL,       1 << 3,       0,           -1 },
	{ "VLC",      NULL,       NULL,       0,            1,           -1 },
	{ "Xarchiver",NULL,       NULL,       1 << 2,       1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 2;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *browsercmd[]  = { "firefox", NULL };
static const char *filemancmd[]  = { "thunar", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *xtermcmd[]  = { "xterm", NULL };
static const char *mpdcmd[]  = { "mpd", NULL };
static const char *mpcrand[]  = { "mpc", "random", NULL };
static const char *mpcsingl[]  = { "mpc", "single", NULL };
static const char *mpctoggle[]  = { "mpc", "toggle", NULL };
static const char *mpcnext[]  = { "mpc", "next", NULL };
static const char *mpcprev[]  = { "mpc", "prev", NULL };
static const char *mpcvolup[]  = { "mpc", "volume", "+3", NULL };
static const char *mpcvoldown[]  = { "mpc", "volume", "-3", NULL };
static const char *amixervolup[]  = { "amixer", "set", "Master", "2%+", NULL };
static const char *amixervoldown[]  = { "amixer", "set", "Master", "2%-", NULL };


#include "movestack.c"
#include "nextprevtag.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_u,      spawn,          {.v = xtermcmd } },
	{ MODKEY,                       XK_i,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = filemancmd } },
	{ ALTKEY,                       XK_a,      spawn,          {.v = mpdcmd } },
	{ ALTKEY,                       XK_z,      spawn,          {.v = mpcrand } },
	{ ALTKEY,                       XK_y,      spawn,          {.v = mpcsingl } },
	{ ALTKEY,                       XK_s,      spawn,          {.v = mpctoggle } },
	{ ALTKEY,                       0xff52,    spawn,          {.v = mpcvolup } },
	{ ALTKEY,                       0xff54,    spawn,          {.v = mpcvoldown } },
	{ ALTKEY,                       0xff51,    spawn,          {.v = mpcprev } },
	{ ALTKEY,                       0xff53,    spawn,          {.v = mpcnext } },
	{ ALTKEY|ShiftMask,             0xff52,    spawn,          {.v = amixervolup } },
	{ ALTKEY|ShiftMask,             0xff54,    spawn,          {.v = amixervoldown } },
	{ 0,                            0x1008ff41,killclient,     {0} },
	{ 0,                            0x1008ff27,view_adjacent,  { .i = +1 } },
	{ 0,                            0x1008ff26,view_adjacent,  { .i = -1 } },
	{ 0,                            0x1008ff16,spawn,          {.v = mpcprev } },
	{ 0,                            0x1008ff17,spawn,          {.v = mpcnext } },
	{ 0,                            0x1008ff15,spawn,          {.v = mpcvolup } },
	{ 0,                            0x1008ff14,spawn,          {.v = mpcvoldown } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       0xff53,    movestack,      {.i = +1 } },
	{ MODKEY,                       0xff51,    movestack,      {.i = -1 } },
	{ MODKEY,                       XK_period, incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_comma,  incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

