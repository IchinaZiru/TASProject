// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "EunwooCC=ez lol why mad?");
SetClientName(Ent("!rochelle"), "ICHINA");
SetClientName(Ent("!ellis"), "月白瞳美は俺の妻");
SetClientName(Ent("!nick"), "Kyubi ツ");

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
	st_edgebug = 0
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
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
		cvar("st_mr_force_file", "rip1_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
		//"f" = "setang_exact -20.196831 117.991219 0.000000"
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
		cvar("st_mr_force_file", "rip1_ellis");
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
		cvar("st_mr_force_file", "rip1_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
		//"f" = "setang_exact -15.530352 -65.089188 0.000000"

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
		cvar("st_mr_force_file", "rip1_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "zdump1"  && activator == Ent("!rochelle"))
		{
SpawnCommon("common_male_dressShirt_jeans", Vector(-8456.544, -7868.013, 1.031), QAngle(0.0, 339.541, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-7947.170, -7860.289, 1.031), QAngle(0.0, 278.276, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-7948.498, -7911.271, 1.031), QAngle(0.0, 281.351, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8234.126, -8148.972, -37.014), QAngle(0.0, 14.077, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8369.951, -8605.580, 1.031), QAngle(0.0, 49.795, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-7983.375, -8582.033, 1.031), QAngle(0.0, 82.596, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-7962.442, -8399.603, 1.031), QAngle(0.0, 82.123, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8046.742, -8240.588, 1.031), QAngle(0.0, 52.791, 0.0));
SpawnCommon("common_male_fallen_survivor", Vector(-8665.427, -8147.491, 1.031), QAngle(0.0, 5.955, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8817.466, -8029.118, 1.031), QAngle(0.0, 357.440, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8629.981, -8278.809, 1.031), QAngle(0.0, 16.363, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8848.425, -8645.671, 1.031), QAngle(0.0, 31.739, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8250.296, -7846.239, 1.031), QAngle(0.0, 326.216, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8179.577, -7864.326, 1.031), QAngle(0.0, 322.037, 0.0))
		}
		else if (sName == "trigger_area2"  && activator == Ent("!francis"))
		{
			
		}
		else if (sName == "trigger_area2"  && activator == Ent("!francis"))
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

SpawnItem("vomitjar", Vector(-5766.688, -10629.094, 32.165), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-5731.063, -10634.594, 27.428), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-5749.594, -10624.594, 27.218), QAngle(0.000, 0.000, 0.000), 1, 3.0); //出口から遠いい方の机の上

SpawnItem("vomitjar", Vector(-6191.219, -10742.406, 33.946), QAngle(0.000, 0.000, 0.000), 1, 3.0); //出口から近い机の上
SpawnItem("vomitjar", Vector(-6372.500, -10732.906, 5.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);  //出口から最短のドアの前
SpawnItem("adrenaline", Vector(-6382.344, -10714.906, 0.491), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("vomitjar", Vector(-5995.188, -11142.594, 46.228), QAngle(0.000, 0.000, 0.000), 1, 3.0); //厨房
SpawnItem("pain_pills", Vector(-5772.625, -11400.313, 40.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-5774.000, -11433.000, 40.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-5769.000, -11416.000, 40.491), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("upgradepack_explosive", Vector(-5835.500, -11197.688, 47.283), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("vomitjar", Vector(-5465.313, -10398.750, -4.875), QAngle(358.506, 217.837, 90.088), 1, 3.0);
SpawnItem("pumpshotgun", Vector(-6008.000, -10349.000, 201.000), QAngle(0.000, 8.481, 270.000), 5, 3.0);

SpawnItem("pipe_bomb", Vector(-9501.531, -7775.344, 45.933), QAngle(0.000, 0.000, 0.000), 1, 3.0);


SpawnTrigger("zdump1", Vector(-7034.661, -9071.400, 137.031));

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);

SpawnZombie("witch", Vector(-9437.500, -7237.500, 1.031), QAngle(0.000, 149.959, 0.000));

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 11.200);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 17.333);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 27.855);
  EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 33.977);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 11.133);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 15.933);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 18.877);
  EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 25.033);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 8.877);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 15.033);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 16.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 17.350);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 19.000);
  EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 25.033);
   EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 27.855);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 33.977);
 

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 15.044);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 17.350);

 SpawnCommon("common_male_dressShirt_jeans", Vector(-6784.094, -10816.363, -6.969), QAngle(0.0, 59.238, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6726.665, -10752.753, -6.969), QAngle(0.0, 61.998, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6861.970, -10146.807, -6.969), QAngle(0.0, 315.159, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6819.437, -10299.368, -6.969), QAngle(0.0, 330.534, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6669.941, -9746.133, -6.969), QAngle(0.0, 278.731, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6737.329, -9962.486, -6.969), QAngle(0.0, 8.617, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6362.672, -9680.215, -6.969), QAngle(0.0, 319.811, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6298.351, -9661.781, -6.969), QAngle(0.0, 319.811, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6243.712, -9916.230, 1.531), QAngle(0.0, 51.747, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5673.185, -10222.451, -6.969), QAngle(0.0, 130.437, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5849.972, -10034.150, -0.609), QAngle(0.0, 128.624, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5714.201, -9974.841, 1.031), QAngle(0.0, 146.995, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5289.825, -10118.628, -6.969), QAngle(0.0, 154.092, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5507.019, -9663.848, -6.969), QAngle(0.0, 186.183, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5754.867, -9726.877, -5.996), QAngle(0.0, 180.112, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-5795.840, -9728.696, -6.907), QAngle(0.0, 179.796, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5589.910, -9851.268, -6.969), QAngle(0.0, 166.234, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-5988.635, -9606.941, 1.031), QAngle(0.0, 228.603, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6197.865, -9643.530, 1.031), QAngle(0.0, 320.776, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6244.922, -9780.704, -6.446), QAngle(0.0, 19.518, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6023.346, -9887.925, 1.031), QAngle(0.0, 114.057, 0.0));
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
