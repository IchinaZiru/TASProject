//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//Created By Sw1ft: https://steamcommunity.com/id/alkashproduction

SkipIntro();

SetPreviousSegmentTime(0.0); // put previous map segment time. Ex: 24.833

//========================================================================================================================
//Delete Custom Campaigns's Intros
//========================================================================================================================

/*EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);*/

//========================================================================================================================

EntFire("info_changelevel", "Disable");

Cvars <-
{
	// Game
	mp_gamemode = "Coop"
	z_difficulty = "Easy"
	host_timescale = 1.0
	god = 0
	sv_infinite_ammo = 0
	sv_client_min_interp_ratio = 0

	// AI
	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 1
	z_common_limit = 0

	nb_blind = 0
	nb_stop = 0
	sb_stop = 0

	// ST
	//changelevel_inhibit = 0 // put this on 0 if you're gonna record demo, this just disable the map change out
	st_autocb = 1
	st_edgebug = 1
	st_fastreload = 0
};

/*
SetClientName(Ent("!nick"), "");
SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!coach"), "");
SetClientName(Ent("!ellis"), "");
*/

Survivors <- {}; // characters customization

Survivors["coach"] <-
{
	origin = Vector(-479.640, -192.000, 16.031)
	angles = QAngle(-3.166, 84.151, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "coach");
		//cvar("st_mr_play", Ent("!coach").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["ellis"] <-
{
	origin = Vector(-464.000, -245.520, 16.192)
	angles = QAngle(-3.166, 84.151, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "ellis");
		//cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["nick"] <-
{
	origin = Vector(-509.000, -309.000, 17.169)
	angles = QAngle(-3.166, 84.151, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "nick");
		//cvar("st_mr_play", Ent("!nick").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-521.210, -195.070, 16.031)
	angles = QAngle(-3.166, 84.151, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "rochelle");
		//cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn

	foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove

}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");


	//EnableAutoClimb();
	//DisableAutoClimb();
	//ActivateFillBot_OnAdrenalineUse(Ent("!"));               //activate auto use gascan while adrenaline effect

	CreateTimer(0.000, function()
	{
		OpenSafeRoomDoor(); /*OpenSafeRoomDoor(bool bOpen = false) | CloseSafeRoomDoor(bool bBeginningDoor = true)*/
	});
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{

}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{

}

function z1()
{
	SayMsg("z1() executed!");
}

function z2()
{

}

function z3()
{

}

function z4()
{

}

function Callbacks::OnFinalePause() // called during pause stage of panic event in the finale
{

}

function Callbacks::OnLastTankKilled() // called after killing a specified amount of Tanks in the finale (FinaleManager.Settings.MaxTanksInFinale)
{

}

function Callbacks::OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBeginCustomStage(iNum, iType)
{
	local ERROR = -1;
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	local SCRIPTED = 3;

	local PAUSE = 0;

	if (iType == PANIC)
	{
	}
	else if (iType == TANK)
	{
	}
	else if (iType == DELAY)
	{
	}
	else if (iType == PAUSE)
	{
	}
}

/*
//weapon spawn
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();
RemoveItemByName("gascan");
*/

//items


SpawnItem("vomitjar", Vector(-1230.000, 3061.000, 353.228), QAngle(0.000, 90.000, 0.000), 1,3.0);

SpawnItem("grenade_launcher", Vector(-6311.656, 6229.063, 379.813), QAngle(1.802, 90.000, 0.308), 1, 3.0);

SpawnItem("vomitjar", Vector(-303.906, 4277.625, 357.696), QAngle(0.000, 90.000, 0.000), 1,3.0); //ベンチ
SpawnItem("vomitjar", Vector(-1393.219, 889.313, 97.134), QAngle(0.000, 90.000, 0.000) 1, 3.0);//スタート地点近く
SpawnItem("vomitjar", Vector(-1405.219, 885.313, 97.571), QAngle(0.000, 90.000, 0.000),1 3.0);