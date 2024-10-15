// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(78.667); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!louis"), "小鼻鼻");
SetClientName(Ent("!zoey"), "Reimu");
SetClientName(Ent("!bill"), "おかゆさん");
SetClientName(Ent("!francis"), "so-so");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

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
    
	st_fastreload = 1
	st_edgebug = 1
	
};

Survivors <- {}; // characters customization

Survivors["bill"] <- // make sure that the character name is in lowercase
{
	origin = Vector(7045.709, 148.368, 64.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -159.694, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 88
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
		slot2 = "molotov" // throwable
		slot3 = "defibrillator" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_3bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

Survivors["francis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(7068.799, 149.396, 64.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(4.100, -160.795, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
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
		cvar("st_mr_force_file", "p84_3francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
	}
}

Survivors["louis"] <-
{
	origin = Vector(7010.083, 215.906, 64.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(-1.814, -175.034, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 99
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot5"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 29
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_3louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["zoey"] <-
{
	origin = Vector(7088.869, 47.384, 64.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(6.544, 157.494, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
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
		cvar("st_mr_force_file", "p84_3zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
	}
}

SpawnItem("grenade_launcher", Vector(4413.000, 1853.000, 71.000), QAngle(2.021, 167.432, 90.483), 1, 3.0);
SpawnItem("vomitjar", Vector(6189.563, -824.031, 37.276), QAngle(359.473, 59.985, 359.121), 1, 3.0);
SpawnItem("pipe_bomb", Vector(6849.000, -74.000, 69.000), QAngle(270.527, 316.494, 0.000), 1, 3.0);

SpawnItem("pain_pills", Vector(6630.000, -840.000, 33.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(1070.000, 1939.000, -7.068), QAngle(359.473, 59.985, 359.121), 1, 3.0);
SpawnItem("vomitjar", Vector(-504.969, 2832.625, 117.276), QAngle(359.473, 59.985, 359.121), 1, 3.0);

SpawnItem("gascan", Vector(2329.844, 1669.063, -104.469), QAngle(358.066, 58.711, 355.430), -1, 3.0);
SpawnItem("gascan", Vector(4726.250, 2345.156, 46.906), QAngle(0.879, 59.678, 0.000), -1, 3.0);
SpawnItem("gascan", Vector(2882.813, 1014.375, 90.969), QAngle(0.220, 59.678, 0.000), -1, 3.0);
SpawnItem("pain_pills", Vector(2330.625, 1669.063, -115.084), QAngle(359.473, 59.985, 359.121), 1, 3.0);
SpawnItem("vomitjar", Vector(314.125, 1450.000, -126.613), QAngle(359.473, 59.985, 359.121), 1, 3.0);

SpawnTrigger("ci", Vector(5418.935, 1969.317, 32.031));
SpawnTrigger("si", Vector(-1218.359, 2286.250, 467.597));
SpawnTrigger("cb", Vector(-3401.969, 1584.872, -138.725));
SpawnTrigger("vote", Vector(-7069.345, 1086.531, -141.969));

SpawnTrigger("clear", Vector(-7659.584, 481.963, 90.031));
SpawnTrigger("a", Vector(-7809.142, 668.128, 158.031));
SpawnTrigger("b", Vector(-6423.136, 1345.538, -141.969));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "ci" && activator == Ent("!francis"))
		{
SpawnCommon("common_male_dressShirt_jeans", Vector(2923.933, 1829.758, -58.508), QAngle(0.000, 352.903, 0.000));
		}
		else if (sName == "si" && activator == Ent("!zoey"))
		{	
SpawnZombie("boomer", Vector(-1311.698, 2338.820, 112.031));
		}
		else if (sName == "cb")
		{
SpawnCommonForCB(Vector(-4115.460, 1603.349, -139.755), QAngle(359.470, 1.090, 0.000));
//SpawnCommonForCB(Vector(-4892.509, 1546.867, -138.655), QAngle(0.000, 8.116, 0.000));
//SpawnCommonForCB(Vector(-4764.227, 1550.488, -138.645), QAngle(0.000, 8.116, 0.000));
		}
		else if (sName == "vote" && activator == Ent("!zoey"))
		{
			SendToServerConsole("callvote changedifficulty Impossible");
             SendToServerConsole("sm_voteall");
		}
		else if (sName == "clear")
		{
			SendToServerConsole("ent_remove_all infected");
		}
		else if (sName == "a")
		{
			SendToServerConsole("ent_remove_all infected");
		}
		else if (sName == "b")
		{
			SpawnZombie("witch", Vector(-7085.973, 1307.507, -130.000), QAngle(0.000, 290.353, 0.000));
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
	cvar("host_timescale", 0.5);OpenSafeRoomDoor();

	SpawnCommon("common_female_tshirt_skirt", Vector(6373.158, -322.386, 32.486), QAngle(0.0, 40.336, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6266.424, -375.451, 29.944), QAngle(358.829, 44.975, 0.000));
SpawnCommon("common_female_tankTop_jeans", Vector(6293.203, -423.631, 30.474), QAngle(359.165, 63.110, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(6312.942, -261.671, 31.993), QAngle(0.0, 27.326, 0.0));

	
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 5.967);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 15.367);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 15.067);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 15.400);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!francis\"), \"sm_idle\");", 4.167);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!francis\")), true)", 15.333);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 26.167);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 31.033);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 35.109);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 35.167);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!francis\"), \"sm_idle\");", 49.033);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!francis\")), true)", 55.533);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 55.300);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 55.400);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 55.300);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 55.400);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 63.500);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 69.600);
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 63.500);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 69.600);
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
