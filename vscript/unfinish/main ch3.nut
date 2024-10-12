// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
//SetClientName(Ent("!ellis"), "");
//SetClientName(Ent("!nick"), "");

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

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(6324.065, 7857.360, -191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.867, 116.137, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(6217.123, 8014.132, -191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.237, 93.983, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 93
	buffer = 2.193 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 72
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = true
			clip = 30
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(6332.136, 7897.313, -191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(13.641, 94.309, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(6224.531, 7895.230, -191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 89.088, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_chrome"
			clip = 8
			ammo = 67
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = true
			clip = 30
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}


SpawnItem("grenade_launcher", Vector(2521.188, 6661.469, 974.438), QAngle(0.088, 47.769, 270.483), 1, 3.0);
SpawnItem("grenade_launcher", Vector(2511.344, 6672.625, 974.563), QAngle(360.000, 43.550, 269.297), 1, 3.0);
//SpawnItem("grenade_launcher", Vector(-2864.719, 5584.844, 2066.563), QAngle(360.000, 44.077, 270.044), 1);

SpawnItem("pain_pills", Vector(6363.563, 7912.219, -163.469), QAngle(1.802, 193.799, 5.889), 1, 3.0);
SpawnItem("vomitjar", Vector(6361.000, 7966.000, -159.036), QAngle(0.000, 315.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(6363.000, 7922.906, -127.005), QAngle(0.000, 37.002, 0.000), 1, 3.0);
SpawnItem("defibrillator", Vector(6362.000, 7884.000, -163.000), QAngle(0.000, 284.985, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-2844.000, 5528.000, 2065.280), QAngle(0.000, 92.988, 0.000), 1, 3.0);

SpawnItem("vomitjar", Vector(2805.813, 6590.906, 754.228), QAngle(0.000, 305.991, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(-2853.469, 5549.813, 2070.228), QAngle(0.000, 305.991, 0.000), 1, 3.0);

SpawnItem("pipe_bomb", Vector(-6344.000, 1316.000, 1629.167), QAngle(0.000, 234.009, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-6352.000, 1304.000, 1625.280), QAngle(0.000, 305.991, 0.000), 1, 3.0);

//SpawnTrigger("zdump", Vector(6067.593, 7804.554, 393.031));
//SpawnTrigger("zdump1", Vector(4982.202, 7358.979, 484.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "zdump" && activator == Ent("!nick"))
		{
SpawnCommon("common_male_tshirt_cargos", Vector(5482.163, 7348.936, 405.051), QAngle(0.0, 29.226, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(5047.060, 7224.182, 413.475), QAngle(0.0, 23.549, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(5086.091, 7229.861, 413.929), QAngle(0.0, 23.549, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(5904.598, 7433.521, 396.147), QAngle(0.0, 63.919, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(5937.272, 7544.775, 383.474), QAngle(0.0, 54.536, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(3029.280, 6492.380, 750.000), QAngle(0.0, 78.000, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(5827.401, 7487.055, 389.773), QAngle(0.0, 40.896, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(5688.083, 7390.076, 391.546), QAngle(0.0, 38.372, 0.0));
 
		}
		else if (sName == "zdump" && activator == Ent("!ellis"))
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
	cvar("host_timescale", 0.25);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"callvote changedifficulty Easy\");", 2.033);
    EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_voteall\");", 3.533);

 //EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 52.000);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 0.033);
 
 //EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 52.000);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 0.033);
 
 //EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 52.000);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 0.033);
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
