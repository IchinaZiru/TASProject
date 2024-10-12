// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!ellis"), "cute retard");
SetClientName(Ent("!nick"), "Kyubi ツ");

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
    
	st_fastreload = 0
	st_edgebug = 0
	
};

Survivors <- {}; // characters customization



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
			weapon = "null"
			dual = null
			clip = null
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c1m1_ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
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
			weapon = ""
			dual = null
			clip = null
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c1m1_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}


SpawnItem("vomitjar", Vector(924.125, 5274.938, 2690.870), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnTrigger("cb", Vector(346.826, 5660.669, 2656.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb")
		{
				SpawnCommonForCB(Vector(686.977, 5633.120, 2656.031), QAngle(0.000, 168.922, 0.000));
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
	cvar("host_timescale", 0.25);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 2.767);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 7.600);
	SpawnCommon("common_male_tshirt_cargos", Vector(922.163, 5044.643, 2656.031), QAngle(0.0, 222.333, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(812.500, 5137.500, 2656.031), QAngle(0.0, 276.847, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(959.355, 5028.216, 2656.031), QAngle(0.0, -158.419, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(848.473, 5018.803, 2661.031), QAngle(0.0, 227.674, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(895.249, 5035.945, 2656.031), QAngle(0.0, 60.208, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(821.209, 5037.839, 2661.031), QAngle(0.0, 29.247, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(776.882, 5149.959, 2656.031), QAngle(0.0, -113.401, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(745.910, 5155.341, 2656.031), QAngle(0.0, 288.694, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(762.124, 5127.031, 2656.031), QAngle(0.0, 180.000, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(583.193, 5769.361, 2656.934), QAngle(0.0, 264.131, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1242.892, 5600.199, 2656.031), QAngle(0.0, 176.294, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1137.801, 5640.929, 2656.031), QAngle(0.0, 180.631, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(845.333, 5686.121, 2656.031), QAngle(0.0, 197.898, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(997.516, 5606.726, 2656.031), QAngle(0.0, 174.559, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(870.881, 5600.742, 2656.031), QAngle(0.0, 168.961, 0.0));
SpawnCommon("common_male_ceda", Vector(848.137, 6221.563, 2666.031), QAngle(0.0, 136.478, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(899.145, 6211.758, 2666.031), QAngle(0.0, 113.055, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(894.955, 6206.164, 2666.031), QAngle(0.0, 119.251, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(525.000, 5450.000, 2666.031), QAngle(0.0, 111.788, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(525.000, 5450.000, 2666.031), QAngle(0.0, 215.252, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(525.000, 5450.000, 2666.031), QAngle(0.0, 192.494, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(612.500, 5150.000, 2666.031), QAngle(0.0, 143.306, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(612.500, 5150.000, 2666.031), QAngle(0.0, 240.584, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(475.000, 5325.000, 2666.031), QAngle(0.0, 219.996, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(475.000, 5325.000, 2666.031), QAngle(0.0, 0.387, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(426.600, 5171.320, 2666.031), QAngle(0.0, 160.513, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(443.903, 5425.000, 2666.031), QAngle(0.0, 172.010, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(612.500, 5062.500, 2666.031), QAngle(0.0, 119.397, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1025.000, 6212.500, 2666.406), QAngle(0.0, 7.532, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(511.884, 5027.515, 2666.031), QAngle(0.0, 275.769, 0.0));
 
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
