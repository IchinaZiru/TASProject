// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "おかゆさん");
SetClientName(Ent("!rochelle"), "Kurokotei");
SetClientName(Ent("!ellis"), "ICHINA");
SetClientName(Ent("!nick"), "MM");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Impossible"

	director_no_bosses = 0
	director_no_mobs = 1
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
	st_idle_anytime = 1
};

Survivors <- {}; // characters customization

Survivors["nick"] <- // make sure that the character name is in lowercase
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
		cvar("st_mr_force_file", "c2m1_dark_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
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
		cvar("st_mr_force_file", "c2m1_dark_ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["coach"] <-
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
		cvar("st_mr_force_file", "c2m1_dark_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
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
		cvar("st_mr_force_file", "c2m1_dark_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("pipe_bomb", Vector(954.000, -1131.000, -656.099), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(900.000, -1131.000, -656.099), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(1095.000, -1132.000, -624.067), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(900.000, -1132.000, -624.067), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(980.000, -1132.000, -628.509), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(930.000, -1132.000, -628.509), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-4198.000, -5438.000, -713.000), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-9298.000, -7338.000, -698.509), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("vomitjar", Vector(-277.000, -3387.000, -674.772), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-697.000, -3372.000, -519.720), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(-486.000, -3638.000, -514.772), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-742.000, -3341.000, -679.509), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(-140.000, -493.000, -662.772), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnTrigger("zdump1", Vector(351.996, -1453.758, -703.969));
SpawnTrigger("trigger_area2", Vector(-22.473, -3156.671, -656.168));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "zdump1" && activator == Ent("!ellis"))
		{
         SpawnCommon("common_male_tankTop_jeans", Vector(184.232, -2633.475, -704.000), QAngle(0.000, 79.876, 0.000));
		 //SpawnCommon("common_female_tankTop_jeans", Vector(159.529, -3134.228, -643.867), QAngle(0.000, 98.242, 0.000));
		 SpawnCommon("common_male_tshirt_cargos",  Vector(171.484, -3103.534, -663.292), QAngle(0.000, 280.295, 0.000));
		 SpawnCommon("common_male_tshirt_cargos", Vector(365.523, -2687.423, -703.969), QAngle(0.0, 145.799, 0.0));
		 SpawnCommon("common_male_tshirt_cargos", Vector(18.122, -2603.077, -703.969), QAngle(0.0, 33.835, 0.0));

		}
		else if (sName == "trigger_area2")
		{
			SendToServerConsole("ent_remove_all infected");
		}
		
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 27.500);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 34.633);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 27.500);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 34.633);
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
