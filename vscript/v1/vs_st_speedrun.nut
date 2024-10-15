//============================================================
//					Speedrunner Tools user script.
//
//	Game:		Left 4 Dead 2
//	Language: 	Squirrel (VM: v3.0.4)
//	API:			https://developer.valvesoftware.com/wiki/List_of_L4D2_Script_Functions
//	ST API:		https://steamcommunity.com/sharedfiles/filedetails/?id=1455798758
//	Purpose: 	Recreating different speedrun scenarios.
//	Author: 		noa1mbot	
//
//	Executable by the Speedrunner Tools script file, called automatically on the round start
//	within g_STLib.Funcs scope, so the identifier can be skipped. Uses includes from "../vscripts/st_scripts/include" folder.
//	Type in the chat !rst in case if the script got stuck and dropped errors.
//============================================================

//general Director options (default)
Convars.SetValue("mp_gamemode", "coop");
Convars.SetValue("z_difficulty", "Easy");
Convars.SetValue("director_no_bosses", 0);
Convars.SetValue("director_no_mobs", 0);
Convars.SetValue("director_no_specials", 0);
Convars.SetValue("z_common_limit", 30);
Convars.SetValue("sb_stop", 0);

//helpers
Convars.SetValue("st_autocb", 0);			//since MR obtained ex-mode, we can disable acb
Convars.SetValue("st_tankboost", 0);
Convars.SetValue("st_fastreload", 0);
Convars.SetValue("st_edgebug", 0);
Convars.SetValue("sv_infinite_ammo", 0);
Convars.SetValue("nb_blind", 0);				//useful to check SI spawns
Convars.SetValue("god", 0);
//DebugItems();							//check all spawns
DirectorStop();							//stop Director activities during scripting
//EntFire("info_changelevel", "Disable");		//lock saferoom (useful if your map is fully scripted and you don't want level end)

//============================================================
//	Called at the end of countdown, but on the next frame.
//	Current event value you may get from "g_ST.event" variable (cmd: !dbg st).
//	To set the new global event data, use "!dbg event <data>" command.
//
//	Useful to load different speedrun variants.
//============================================================

function Event()
{
	if (g_ST.event == "0") return;
	DirectorStop();
	ST_MRStop();
	Convars.SetValue("host_timescale", 0.5);
	Convars.SetValue("sv_infinite_ammo", 1);
	Convars.SetValue("nb_blind", 1);
	if (g_ST.event == "1")
	{
		//	Put here e.g. AutoFire + TeleportEntity functions to check the boost
		//	on a specific location (say: "!dbg event 1" to activate this custom event).
	}
	else if (g_ST.event == "2")
	{
	}
}

//============================================================
//	Called at the end of countdown.
//============================================================

function Inventory()
{
	ZDump();							//dump near-saferoom zombies' pos/ang functions in "...left4dead2\ems\st_config\zdump.txt".
	DebugItems();						//dump current in-map item spawn functions in "...left4dead2\ems\st_config\items_dump.txt".
	Convars.SetValue("host_timescale", 0.5);	//scale of time
	
	local hPlayer = null;
	if ((hPlayer = Ent("!nick")) != null)
	{
		SetClientName(hPlayer, "Bittersweet Tragedy");
		hPlayer.GiveItem("pistol");hPlayer.GiveItem("grenade_launcher");
		hPlayer.SetHealth(50);
		TeleportEntity(hPlayer, null, Vector(0.000, 90.0, 0.000));
		ST_MR(hPlayer, true, "nick");
		/*
			============== ST_MR usage ==============
			1st arg:		hPlayer		– player's handle;
			
			2nd arg:		0			– start recording;
						1 			– playback recorded movement for this player;
						2 			– playback from "default" file (use this argument for tests only, and if you haven't yet named a file);
						3 			– split movement (don't use it here; best usage in OnEntityOutput if you need precise split in a certain place,
									but usually better to split manually via bind (bind "x" "st_mr_split 1") everytime.
			
			3rd arg:		"m1_nick"	– movement file name. Specify slash symbol like "c1/m1_nick" to read from your custom folder.
									Movements location: Path_SM/plugins/disabled/movements/default.txt
			
			4th arg:		bool			– do not teleport player at the start of the movement?
		*/
	}
	if ((hPlayer = Ent("!rochelle")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(50);
		//ST_MR(hPlayer, 0, "m1_nick");
	}
	if ((hPlayer = Ent("!coach")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(50);
		//ST_MR(hPlayer, 0, "m1_nick");
	}
	if ((hPlayer = Ent("!ellis")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(50);
		//ST_MR(hPlayer, 0, "m1_nick");
	}
}

//============================================================
//	Called when the player touched trigger entities, that created via SpawnTrigger.
//============================================================

::OnEntityOutput <- function()
{
	if (g_ST.restart || activator == null || !activator.IsSurvivor()) return;
	local client = activator.GetEntityIndex();
	if (caller.GetName() == "trigger_area1")
	{
		
	}
	else if (caller.GetName() == "trigger_area2")
	{
		
	}
}

//============================================================
//	Called from the SourceMod plugin (https://forums.alliedmods.net/showthread.php?t=309141),
//	when movement playback was fully ended.
//
//	Parameters:
//	hPlayer 		– player, who completed his movement;
//	sFileName	 – file name.
//============================================================

::OnPlayEnd <- function(hPlayer, sFileName)
{
	if (sFileName == "default")
	{
		
	}
	else if (sFileName == "default2")
	{
		
	}
}

//============================================================
//	Called from the SourceMod plugin (https://forums.alliedmods.net/showthread.php?t=309141) on each movement file line.
//
//	Parameters:
//	hPlayer 		– player, who performs his movement;
//	sFileName	– file name;
//	tick 			– current file line;
//	buttons 		– pressed buttons.
//============================================================

::OnPlayLine <- function(hPlayer, sFileName, tick, buttons)
{
	if (sFileName == "default" && tick == 4)
	{
		
	}
	else if (sFileName == "default2" && tick == 4)
	{
		
	}
}

//============================================================
//	Event for AutoFire* functions, when scripted player commits auto-fire.
//============================================================

::OnAutoFired <- function(hPlayer, data)
{
	if (data == 0)
	{
		
	}
	else if (data == 1)
	{
		
	}
}

//============================================================
//	Called after a player has received a boost.
//
//	Parameters:
//	hPlayer 	– booster player;
//	hClient 	– player, who get boosted;
//	data 	– user-defined data at the function execution.
//============================================================

::OnAutoFired_Post <- function(hPlayer, hClient, data)
{
	if (data == 0)
	{
		
	}
	else if (data == 1)
	{
		
	}
}

//============================================================
//	Called from the SourceMod plugin (https://forums.alliedmods.net/showthread.php?t=302498)
//	in case a player used an auto-commonboost jump.
//
//	Parameters:
//	hPlayer 	– player, who get boosted;
//	sName 	– zombie targetname.
//============================================================

::OnAutoCB <- function(hPlayer, sName)
{
	
}

//============================================================
//	Called when the Survivor entered the saferoom.
//============================================================

::OnSafe <- function(hPlayer)
{
	
}

//============================================================
//	Called on restarting the speedrun (it's not equal "round_end" event, our function will be executed a bit late).
//============================================================

::OnRestart <- function()
{
	
}

//============================================================
//	Called on specified event. Place here your event callbacks with a unique name to get responce.
//	List of L4D2 events: https://wiki.alliedmods.net/Left_4_dead_2_events
//============================================================

function OnGameEvent_weapon_fire(event)
{
	local hPlayer = GetPlayerFromUserID(event.userid);
	printl("weapon fire by :" + hPlayer);
	ClearEvent();	//clear current event
}

function OnGameEvent_player_jump_apex(event)
{
	local hPlayer = GetPlayerFromUserID(event.userid);
	printl("jump apex by :" + hPlayer);
	ClearEvent();
}

//============================================================
//	Called on each HUD timer update (similar to OnGameFrame).
//============================================================

function OnGameEvent_scriptedmode_reloadhud(...)
{
	local time = g_STLib.Vars.HUD.Fields.timer_sec.dataval; 	//current HUD timer value.
	local tick = g_STLib.Vars.tick; 							//current speedrun tick
	
	if (tick == 10)
	{
		//do sth...
		printl(tick + " tick >> time: " + time);
	}
	else if (tick == 20)
	{
		printl(tick + " tick >> time: " + time);
	}
}

//========================================================================================================================
//ScMp
//========================================================================================================================

Timer();				//countdown, that can be changed via !timer (don't remove this function!!! also, it must be always below event callbacks in order to register)
HUDLoad(0.0);		//initial HUD timer value (a time from previous segment can be set)
//SetTeam("Coach");	//create fakeclient team and play as Coach (need at least 1 bot with sb_add to execute it properly)

//put here below triggers, items and other map-related scripts...