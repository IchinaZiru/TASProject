// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Kyubi ツ");
SetClientName(Ent("!rochelle"), "jux");
SetClientName(Ent("!ellis"), "so-so");
SetClientName(Ent("!nick"), "月白瞳美は俺の妻");

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
	origin = Vector(3132.258, 9418.276, -1499.161) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -118.147, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "ch2coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(3112.363, 9326.912, -1496.069) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.079, -59.013, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = "pumpshotgun"
			clip = 8
			ammo = 72
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch2ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(3087.713, 9400.822, -1499.161) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(1.814, -121.701, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "ch2nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(3026.704, 9295.822, -1496.069) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -146.530, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			ammo = 72
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch2rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("vomitjar", Vector(4973.906, 8113.063, -1466.781), QAngle(358.813, 360.000, 359.297), 1, 3.0);
SpawnItem("vomitjar", Vector(4979.938, 8126.969, -1466.781), QAngle(359.385, 0.000, 0.264), 1, 3.0);

SpawnItem("molotov", Vector(-916.031, -2111.969, -30.688), QAngle(0.088, 34.980, 359.209), 1, 3.0);
SpawnItem("defibrillator", Vector(-914.063, -2071.844, -35.531), QAngle(359.473, 322.998, 1.187), 1, 3.0);

SpawnItem("adrenaline", Vector(-2113.719, -828.375, -405.438), QAngle(356.792, 311.133, 359.033), 1, 3.0);
SpawnItem("adrenaline", Vector(-2095.438, -835.750, -405.438), QAngle(356.836, 109.116, 359.033), 1, 3.0);

SpawnItem("vomitjar", Vector(-5909.000, 594.906, -270.710), QAngle(0.000, 37.002, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-5908.438, 584.219, -307.469), QAngle(1.670, 193.755, 5.361), 1, 3.0);
SpawnItem("vomitjar", Vector(-5911.000, 638.000, -302.741), QAngle(0.000, 315.000, 0.000), 1, 3.0);

SpawnTrigger("cb1", Vector(6164.903, 2029.184, -1051.315));
SpawnTrigger("zdump", Vector(4966.172, 1527.915, -725.811));
SpawnTrigger("zdump1", Vector(4145.003, 976.250, -374.209));
SpawnTrigger("zdump2", Vector(1041.766, 195.657, -59.969));
SpawnTrigger("clear", Vector(-922.099, -2008.271, -35.969));
SpawnTrigger("clear2", Vector(7787.189, 5191.127, -1466.728));
SpawnTrigger("trigger_area1", Vector(4247.968, 7982.635, -1480.587));
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb1")
		{
//SpawnCommonForCB(Vector(5849.084, 1697.153, -1066.399), QAngle(5.066, 80.847, 0.000));
SpawnCommonForCB(Vector(5846.622, 1676.620, -1063.758), QAngle(0.000, 78.711, 0.000));
		}
		else if (sName == "zdump")
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(4436.305, 379.586, -572.560), QAngle(0.0, 96.390, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(4532.747, 447.940, -563.745), QAngle(0.0, 102.462, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(4206.013, 336.273, -467.128), QAngle(0.0, 82.434, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(4333.456, 1573.371, -417.677), QAngle(0.0, 266.051, 0.0));
		}
		else if (sName == "zdump1")
		{
SpawnCommon("common_female_tankTop_jeans", Vector(3404.515, 325.783, -153.560), QAngle(0.0, 346.240, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(3549.719, -475.492, -129.968), QAngle(0.0, 139.836, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(3510.049, -461.503, -133.686), QAngle(0.0, 139.836, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(3642.106, -1011.185, -127.969), QAngle(0.0, 115.235, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(2862.209, -1120.686, -95.860), QAngle(0.0, 62.091, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(2807.299, -1423.729, -92.178), QAngle(0.0, 65.955, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(2858.123, -1331.433, -95.586), QAngle(0.0, 66.349, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(3140.593, -940.053, -114.529), QAngle(0.0, 73.525, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(2792.712, -861.233, -91.200), QAngle(0.0, 50.501, 0.0));
		}
		else if (sName == "zdump2")
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(699.147, 9.266, -59.969), QAngle(0.0, 48.215, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(49.031, -164.138, -59.969), QAngle(0.0, 11.156, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(49.031, -199.600, -59.969), QAngle(0.0, 11.156, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(471.386, -554.226, -11.969), QAngle(0.0, 99.466, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(510.309, -381.036, -11.969), QAngle(0.0, 117.128, 0.0));
		}
		else if (sName == "clear")
		{
			SendToServerConsole("ent_remove_all infected");
		}
		else if (sName == "trigger_area1"&& activator == Ent("!nick"))
		{
		    SpawnCommon("common_male_tshirt_cargos", Vector(7534.016, 8180.583, -1489.330), QAngle(0.0, 205.615, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(8046.610, 7748.861, -1509.247), QAngle(0.0, 153.339, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(8013.964, 7765.985, -1515.063), QAngle(0.0, 154.522, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(7992.689, 7962.169, -1497.420), QAngle(0.0, 172.972, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(7803.235, 8158.049, -1477.072), QAngle(0.0, 204.117, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(7697.940, 8086.318, -1492.691), QAngle(0.0, 197.888, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(7822.661, 8030.685, -1502.131), QAngle(0.0, 181.409, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(7711.824, 8290.527, -1455.861), QAngle(0.0, 231.793, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(7682.598, 8208.422, -1468.803), QAngle(0.0, 225.643, 0.0));	
		}
		else if (sName == "clear2")
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

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 59.433);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 69.767);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 69.667);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 50.167);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 59.633);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 57.233);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 69.433);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 68.567);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 77.233);
  EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 83.133);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 65.233);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 65.267);
 //EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 69.533);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 68.600);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 69.800);

 //EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 67.833);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 67.467);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 69.800);
	
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
