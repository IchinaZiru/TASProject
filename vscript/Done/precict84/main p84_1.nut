// Squirrel timer 10.44

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!louis"), "Kyubi ツ");
SetClientName(Ent("!zoey"), "Juxar");
SetClientName(Ent("!bill"), "夏目貴志");
SetClientName(Ent("!francis"), "IcyFrost");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Impossible"

	director_no_bosses = 1
	director_no_mobs = 0
	director_no_specials = 1

	god = 0
	z_common_limit = 0
	sv_infinite_ammo = 0
	host_timescale = 1.0

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
    
	st_fastreload = 0
	st_edgebug = 1
	
};

Survivors <- {}; // characters customization

Survivors["louis"] <- // make sure that the character name is in lowercase
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_1louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["bill"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_1bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

Survivors["francis"] <-
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_1francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
	}
}

Survivors["zoey"] <-
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_1zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
	}
}

SpawnItem("vomitjar", Vector(5945.000, -1280.000, 536.626), QAngle(358.506, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(6096.656, -1154.531, 565.491), QAngle(0.000, 270.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(6047.000, -709.063, 537.563), QAngle(358.506, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(6326.000, -388.000, 495.491), QAngle(0.000, 270.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(6296.000, -1136.000, 536.218), QAngle(358.506, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(6389.875, -343.094, 495.280), QAngle(0.000, 270.000, 0.000), 1, 3.0);
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{

		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 9.033);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 15.200);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 14.733);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 15.264);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 14.733);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 15.264);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 24.833);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 30.700);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!francis\"), \"sm_idle\");", 24.833);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!francis\")), true)", 30.967);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 24.833);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 30.767);
}

function OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function OnFinaleStart() // do some stuff when a finale event has been started
{

}

function OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBeginCustomStage(iNum, iType)
{
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	if (iType == PANIC)
	{

	}
	else if (iType == TANK)
	{

	}
	else if (iType == DELAY)
	{

	}
}
