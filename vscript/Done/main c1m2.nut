// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(8.667); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!ellis"), "so-so");
SetClientName(Ent("!nick"), "おかゆさん");

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

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(2295.522, 5128.530, 448.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(4.810, -61.774, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "vomitjar" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
		
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c1m2_ellis");
	    cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(2349.875, 4997.672, 448.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(12.773, -115.804, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "c1m2_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}
SpawnItem("propanetank", Vector(-3380.094, 2275.969, 139.156), QAngle(0.439, 254.927, 0.352), -1, 3.0);
SpawnItem("pain_pills", Vector(-3597.000, 2186.000, 128.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(-3597.000, 2165.000, 132.933), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("upgradepack_explosive", Vector(-3676.000, 2164.000, 135.439), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(-3676.000, 2192.000, 191.980), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-3676.000, 2264.000, 161.584), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("grenade_launcher", Vector(-3675.000, 2248.000, 137.326), QAngle(0.000, 75.015, 0.000), 1, 3.0);


SpawnTrigger("cb", Vector(-8706.208, -1053.948, 384.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb" && activator == Ent("!ellis"))
		{
//SpawnCommonForCB(Vector(-8667.421, -2927.569, 384.031), QAngle(0.000, 78.052, 0.000));
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
	cvar("host_timescale", 0.5);OpenSafeRoomDoor();
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"callvote changedifficulty Easy\");", 3.300);
    EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_voteall\");", 3.333);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 4.033);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 8.833);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 14.400);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 20.533);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 37.733);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 44.833);
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 44.863);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 51.467);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 53.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 53.100);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 53.133);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 59.233);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 59.533);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 65.600);

	SpawnCommon("common_male_tankTop_jeans", Vector(2329.664, 4254.183, 503.675), QAngle(0.0, 98.823, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(2249.618, 4111.557, 517.011), QAngle(0.0, 88.888, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2279.340, 4335.344, 490.462), QAngle(0.0, 92.910, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(2414.535, 4577.226, 452.409), QAngle(0.0, 114.514, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1986.567, 4742.768, 448.031), QAngle(0.0, 15.244, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(2062.370, 4781.040, 448.031), QAngle(0.0, 11.223, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(2119.989, 4909.366, 448.031), QAngle(0.0, 335.741, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(2055.645, 4500.150, 459.391), QAngle(0.0, 52.855, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1615.187, 4733.985, 448.031), QAngle(0.0, 11.696, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1689.001, 4717.291, 448.031), QAngle(0.0, 16.033, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1839.802, 4788.242, 448.031), QAngle(0.0, 9.961, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1773.765, 4834.526, 448.031), QAngle(0.0, 359.474, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1688.055, 4063.635, 533.448), QAngle(0.0, 35.902, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1260.743, 4148.174, 489.618), QAngle(0.0, 15.796, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1331.428, 4208.021, 482.259), QAngle(0.0, 13.194, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1833.671, 3376.386, 572.493), QAngle(0.0, 72.645, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1688.582, 3464.520, 592.415), QAngle(0.0, 63.578, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1913.576, 3620.777, 548.054), QAngle(0.0, 72.882, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(995.461, 2604.790, 568.422), QAngle(0.0, 84.473, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1019.894, 2651.923, 570.474), QAngle(0.0, 87.627, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(358.434, 2823.796, 503.128), QAngle(0.0, 15.481, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(665.432, 3157.777, 543.634), QAngle(0.0, 338.343, 0.0));

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
