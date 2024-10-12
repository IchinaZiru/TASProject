// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "ICHINA");
SetClientName(Ent("!rochelle"), "おかゆさん");

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
	st_edgebug = 1
	st_idle_anytime = 1
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(2938.237, -1144.105, -295.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(7.412, 61.110, 0.000)// camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "c6m2Coach");
	    cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}


Survivors["rochelle"] <-
{
	origin = Vector(3081.399, -1196.260, -295.969)// position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(5.992, 158.326, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "molotov" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c6m2Rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("pain_pills", Vector(430.344, 3590.313, 168.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("shotgun_spas", Vector(1630.000, 5079.000, -118.688), QAngle(0.000, 45.000, 270.000), 5, 3.0);
SpawnItem("adrenaline", Vector(1984.063, 5501.250, -137.509), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(1948.313, 5500.750, -132.772), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("upgradepack_explosive", Vector(1514.125, 4518.875, -367.311), QAngle(0.000, 0.000, 0.000), 1.3.0);
SpawnItem("adrenaline", Vector(1547.781, 4523.906, -367.009), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(341.281, 2790.563, -151.720), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(1188.000, 1100.000, 19.655), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(1184.625, 1135.500, 24.603), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("autoshotgun", Vector(2237.000, 4467.000, -342.500), QAngle(0.000, 30.015, 90.000), 5, 3.0);
SpawnItem("pain_pills", Vector(9677.531, 5504.375, -1166.750), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(9691.125, 5476.531, -1166.750), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnTrigger("cb", Vector(5181.899, 6235.659, -1071.969));
SpawnTrigger("zdump1", Vector(1898.532, 490.760, -38.807));
SpawnTrigger("zdump2", Vector(2480.197, 4609.255, -301.046));
SpawnTrigger("zdump3", Vector(438.754, 4955.055, -343.969));
SpawnTrigger("zdump4", Vector(343.782, 3570.308, 169.031));
SpawnTrigger("charger", Vector(596.390, 5118.470, -773.969));
//SpawnTrigger("spitter", Vector(2221.483, 5656.469, -1063.969));

//SpawnTrigger("trigger_area1", Vector(428.311, 3580.138, 169.031));
//SpawnTrigger("trigger_area2", Vector(1550.124, 4516.798, -366.434));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "spitter" && activator == Ent("!rochelle"))
		{
        SpawnZombie("spitter", Vector(2859.202, 5930.898, -1199.969));
		}
		else if (sName == "cb" && activator == Ent("!coach"))
		{
         SpawnCommonForCB(Vector(6006.968, 5826.238, -1199.969), QAngle(0.000, 136.414, 0.000));
		 SpawnCommon("common_male_fallen_survivor", Vector(6855.516, 5517.530, -1199.969), QAngle(0.000, 172.309, 0.000));
		}
		else if (sName == "zdump1" && activator == Ent("!coach"))
		{
			SpawnCommon("common_female_tankTop_jeans", Vector(1588.453, 1615.581, -187.655), QAngle(0.0, 249.203, 0.0));
            SpawnCommon("common_male_tankTop_jeans", Vector(1384.515, 1537.163, -190.097), QAngle(0.0, 304.712, 0.0));
            SpawnCommon("common_female_tankTop_jeans", Vector(1426.436, 1691.621, -186.706), QAngle(0.0, 282.556, 0.0));
            SpawnCommon("common_male_biker", Vector(786.901, 1489.314, -183.976), QAngle(0.0, 350.838, 0.0));
            SpawnCommon("common_male_biker", Vector(946.687, 1430.413, -179.605), QAngle(0.0, 354.228, 0.0));
		}
		else if (sName == "zdump2" && activator == Ent("!coach"))
		{
			SpawnCommon("common_male_biker", Vector(2100.206, 4536.675, -343.969), QAngle(-0.000, 339.543, 0.000));
            SpawnCommon("common_male_tankTop_jeans", Vector(2180.202, 4578.811, -359.969), QAngle(349.889, 290.815, 0.000));
		}
		else if (sName == "zdump3" && activator == Ent("!coach"))
		{
			
			SpawnCommon("common_female_tankTop_jeans", Vector(811.551, 5211.477, -535.969), QAngle(0.0, 222.729, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(692.236, 5211.357, -559.542), QAngle(0.0, 234.241, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(643.020, 5195.984, -592.353), QAngle(0.0, 323.103, 0.0));
			SpawnCommon("common_male_biker", Vector(817.934, 5070.372, -727.969), QAngle(0.0, 165.584, 0.0));
			SpawnCommon("common_male_biker", Vector(787.745, 5061.508, -727.969), QAngle(0.0, 159.749, 0.0));
			SpawnCommon("common_male_biker", Vector(542.704, 5112.280, -815.969), QAngle(332.481, 24.880, 0.000));
			SpawnCommon("common_male_biker", Vector(534.332, 5066.646, -815.969), QAngle(333.694, 46.090, 0.000));
		}
		else if (sName == "zdump4" && activator == Ent("!coach"))
		{
			SpawnCommon("common_male_biker", Vector(1098.674, 3808.705, -161.282), QAngle(0.0, 187.210, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(603.640, 3900.463, -161.459), QAngle(0.0, 308.636, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1076.662, 3991.147, -161.815), QAngle(0.0, 212.994, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1008.144, 4404.834, -158.969), QAngle(0.0, 272.051, 0.0));
			SpawnCommon("common_male_biker", Vector(898.018, 4310.998, -159.219), QAngle(0.0, 307.138, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1087.524, 3878.161, -97.169), QAngle(0.0, 185.811, 0.0));
			SpawnCommon("common_male_biker", Vector(244.031, 3830.956, -160.706), QAngle(0.0, 2.352, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1838.986, 4208.985, -160.657), QAngle(0.0, 200.162, 0.0));
			SpawnCommon("common_male_biker", Vector(1712.750, 4169.149, -161.931), QAngle(0.0, 200.556, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1599.075, 3704.283, -159.969), QAngle(0.0, 167.992, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(864.751, 4237.948, -161.261), QAngle(0.0, 272.386, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1500.143, 4231.138, -160.118), QAngle(0.0, 211.121, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1751.764, 3818.357, -161.012), QAngle(0.0, 177.453, 0.0));
		}
		else if (sName == "charger" && activator == Ent("!coach"))
		{
			SpawnZombie("charger", Vector(396.683, 4789.757, -1199.969));
		}
		else if (sName == "trigger_area1" && activator == Ent("!coach"))
		{
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"Give pain_pills\");", 0.0);
		}
		else if (sName == "trigger_area2" && activator == Ent("!coach"))
		{
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"Give adrenaline\");", 0.0);
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);OpenSafeRoomDoor();
	 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 6.000);
     EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 10.734); //or11.300
	 SpawnCommon("common_male_fallen_survivor", Vector(2905.227, -970.539, -299.257), QAngle(0.000, 91.601, 0.000));
	 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 50.000);
	 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 55.333);
	 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 69.000);
	
	 
     
	 //SpawnZombie("spitter", Vector(2882.178, 6011.188, -1199.969), 56.000);
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
