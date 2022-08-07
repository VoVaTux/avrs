//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"   ", "~/scpt/dwmblocks/lay.sh ]",	         	1,		0},
	{" ", "~/scpt/dwmblocks/stock btc-usd ]",		1,		0},
	{" ", "~/scpt/dwmblocks/pack ]",			60,		0},
	{" ", "~/scpt/dwmblocks/disk ]",			1,		0},
	{"", "~/scpt/dwmblocks/ram ]",				1,		0},
	{"  ", "~/scpt/dwmblocks/sound",			1,		0},
	{"", "~/scpt/dwmblocks/time.sh",			5,		0},
	{"", "~/scpt/dwmblocks/bat.sh",				5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
