// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(74.367); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
//SetClientName(Ent("!ellis"), "");
//SetClientName(Ent("!nick"), "");

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
	
};

Survivors <- {}; // characters customization

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(6769.150, -1413.406, 24.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(3.627, 115.765, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 82
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
		slot4 = "pain_pills" // pills/adrenaline
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
	origin = Vector(6801.938, -1505.969, 24.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(11.669, -64.844, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
	buffer = 14.398 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 28
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "molotov" // throwable
		slot3 = "upgradepack_explosive" // medkit/defib
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

SpawnItem("adrenaline", Vector(6592.031, -2624.000, 32.594), QAngle(357.671, 359.912, 358.989), 1, 3.0);
SpawnItem("pipe_bomb", Vector(6942.000, -1808.813, 75.074), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(6886.781, -1843.344, 74.839), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(6802.313, -1898.156, 24.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(7147.500, -2132.906, 24.491), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("first_aid_kit", Vector(-494.375, -5154.219, 280.500), QAngle(1.450, 359.736, 4.702), 1, 3.0);

SpawnItem("shotgun_spas", Vector(825.844, -2101.563, 281.000), QAngle(0.000, 14.985, 270.000), 5, 3.0);

SpawnTrigger("ci", Vector(906.519, -5325.108, 536.031));
SpawnTrigger("cb", Vector(1199.704, -5292.970, 280.031));
SpawnTrigger("tank", Vector(65.877, -5485.218, 280.031));
SpawnTrigger("taank", Vector(-594.391, -4400.547, 280.031));
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "ci")
		{
SpawnCommon("common_male_tankTop_jeans", Vector(1179.161, -5495.869, 536.031), QAngle(0.0, 175.380, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1572.545, -5217.566, 440.031), QAngle(0.0, 165.208, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1528.882, -5170.047, 440.031), QAngle(0.0, 175.459, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1492.129, -5287.925, 440.031), QAngle(0.0, 154.406, 0.0));
		}
		else if (sName == "cb")
		{
SpawnCommonForCB(Vector(929.710, -5482.022, 280.031), QAngle(0.000, -1.336, 0.000));
//SpawnZombie("spitter", Vector(571.161, -5499.003, 280.031));
//SpawnZombie("boomer", Vector(420.221, -5429.386, 280.031));
		}
		else if (sName == "tank")
		{
SpawnZombie("tank", Vector(-1062.500, -3725.000, 536.031)); //sam
SpawnCommon("common_female_tankTop_jeans", Vector(-69.392, -5266.099, 280.031), QAngle(0.0, 277.849, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-111.790, -5292.190, 280.031), QAngle(0.0, 290.859, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-597.638, -5063.983, 280.031), QAngle(0.0, 312.858, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-494.938, -5204.014, 280.031), QAngle(0.0, 316.248, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-514.359, -4956.631, 294.206), QAngle(0.0, 301.030, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-480.232, -5087.818, 280.031), QAngle(0.0, 303.238, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-232.714, -4850.698, 280.031), QAngle(0.0, 251.119, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-453.732, -4797.167, 280.031), QAngle(0.0, 279.820, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-31.970, -3938.341, 280.031), QAngle(0.0, 248.755, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-73.027, -4020.459, 280.031), QAngle(0.0, 249.701, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-113.130, -4311.756, 280.031), QAngle(0.0, 234.168, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-101.508, -4215.731, 280.031), QAngle(0.0, 242.447, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-211.043, -4080.070, 280.031), QAngle(0.0, 264.130, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-564.614, -3887.746, 280.031), QAngle(0.0, 300.085, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-576.051, -4014.127, 280.031), QAngle(0.0, 307.970, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-545.999, -4113.411, 280.031), QAngle(0.0, 312.858, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-1050.469, -4517.603, 280.031), QAngle(0.0, 5.687, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1163.226, -4634.878, 280.031), QAngle(0.0, 12.310, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-483.510, -3962.817, 536.031), QAngle(0.0, 211.065, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-540.393, -4029.656, 536.031), QAngle(0.0, 207.202, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-510.429, -3905.100, 536.031), QAngle(0.0, 218.241, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-464.066, -4477.694, 536.031), QAngle(0.0, 149.801, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-91.472, -4453.369, 536.031), QAngle(0.0, 163.993, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-559.423, -4378.841, 536.031), QAngle(0.0, 155.399, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-1533.876, -4737.071, 591.693), QAngle(0.0, 39.650, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-1051.897, -4709.139, 536.031), QAngle(0.0, 73.712, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-870.417, -4693.598, 536.031), QAngle(0.0, 94.607, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-887.940, -4565.300, 536.031), QAngle(0.0, 93.424, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-400.263, -4643.993, 536.031), QAngle(0.0, 140.102, 0.0));
//SpawnZombie("tank", Vector(-1000.000, -3787.500, 536.031));
//SpawnCommonForCB(Vector(-1103.769, -3868.449, 536.031), QAngle(0.000, 327.701, 0.000));
		}
		else if (sName == "taank")
		{
			//SpawnZombie("tank",Vector(-1020.929, -3795.036, 536.031));
			//SpawnCommonForCB(Vector(-1103.769, -3868.449, 536.031), QAngle(0.000, 327.701, 0.000));
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
	cvar("host_timescale", 0.25); OpenSafeRoomDoor();

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 8.100);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 8.200);
	//AddScriptedTankSpawn(Vector(-1000.000, -3787.500, 536.031));
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
