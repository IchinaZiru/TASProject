// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(23.700); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!nick"), "instagib");
SetClientName(Ent("!rochelle"), "kisetsu");
SetClientName(Ent("!ellis"), "サンスパンチュ");
SetClientName(Ent("!coach"), "Reborn");

Cvars <- // console variables manager; format: cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	director_no_bosses = 0
	director_no_mobs = 0
	director_no_specials = 0

	god = 0
	z_common_limit = 0
	sv_infinite_ammo = 0
	host_timescale = 1.0

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(188.943, 489.710, -3327.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 158.527, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm2_coach");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
		//SendToServerConsole("st_mr_record 1");
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	origin = Vector(195.129, 504.516, -3327.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 87.517, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm2_ellis");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	origin = Vector(160.410, 180.228, -3327.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.00, -59.566399, 0.000000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		OpenSafeRoomDoor();
		Convars.SetValue("st_mr_force_file", "ravenholm2_nick");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(202.795, 248.700, -3327.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.520, 274.142, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm2_rochelle");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
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
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
	}
}
 
RemoveItemByName("oxygentank"); RemoveItemByName("gascan");
SpawnItem("gascan", Vector(235.813, -121.938, -3317.156), QAngle(358.857, 0.044, 359.648), -1, 50);
SpawnItem("oxygentank", Vector(178.781, -188.313, -3325.563), QAngle(25.400, 47.944, 269.912), -1, 50);
SpawnItem("oxygentank", Vector(152.781, -443.750, -3258.969), QAngle(271.406, 121.553, 273.560), -1, 50);
SpawnItem("propanetank", Vector(155.625, -444.906, -3252.813), QAngle(0.352, 359.824, 0.396), -1, 50);

SpawnItem("gascan", Vector(39.563, -518.250, -3253.094), QAngle(359.736, 0.308, 0.176), -1);
SpawnItem("gascan", Vector(63.531, -518.188, -3253.063), QAngle(359.692, 0.000, 359.912), -1);

SpawnItem("oxygentank", Vector(23.219, -885.750, -3453.531), QAngle(19.731, 288.369, 90.000), -1, 50);
SpawnItem("propanetank", Vector(-407.781, 216.031, -3572.906), QAngle(0.879, 0.352, 0.352), -1, 50);
SpawnItem("propanetank", Vector(-409.813, 279.031, -3572.875), QAngle(0.703, 0.396, 0.264), -1, 50);

//start
SpawnItem("ammo", Vector(151.906, 442.000, -3292.000), QAngle(0.000, 0.000, 0.000), 1, 200);

SpawnItem("first_aid_kit", Vector(156.906, 293.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 299.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 305.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 311.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);

SpawnItem("first_aid_kit", Vector(-5084.000, 1983.688, -3164.125), QAngle(0.000, 0.000, 0.000), 1, 100);
SpawnItem("rifle_ak47", Vector(-5088.031, 1884.031, -3166.375), QAngle(0.044, 62.930, 90.791), 4);
SpawnItem("shotgun_spas", Vector(-5087.969, 1936.000, -3166.531), QAngle(0.044, 251.016, 270.439), 4);
SpawnItem("first_aid_kit", Vector(-5088.000, 1968.688, -3164.125), QAngle(0.000, 127.002, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5105.000, 1965.688, -3161.594), QAngle(90.000, 37.485, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5098.938, 1983.594, -3161.594), QAngle(90.000, 316.011, 0.000), 1);
SpawnItem("ammo", Vector(-5092.719, 2004.000, -3164.125), QAngle(0.000, 76.992, 0.000), 1);

SpawnItem("pumpshotgun", Vector(158.875, 339.031, -3286.688), QAngle(359.341, 250.049, 92.637), 4);
SpawnItem("smg", Vector(164.125, 372.938, -3286.500), QAngle(358.154, 232.954, 84.946), 5);

//weapon
SpawnItem("fireaxe", Vector(158.000, -306.406, -3262.688), QAngle(0.000, 165.015, 270.132), 1, 50);

//saferoom

SpawnItem("upgradepack_explosive", Vector(-5402.531, 2085.031, -3142.469), QAngle(359.165, 357.935, 0.000), 1, 50);

function respawnthrowable()
{
SpawnItem("pipe_bomb", Vector(-5392.000, 1904.000, -3159.130), QAngle(0.000, 0.000, 0.000), 1, 50);
SpawnItem("molotov", Vector(-5390.000, 1928.000, -3160.987), QAngle(318.999, 0.000, 266.001), 1);
}

respawnthrowable();

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 1.0); z1();
	
	//3.4
	CreateTimer(3.400, function()
	{ 
		RemoveItemByName("pipe_bomb");
		Ent("!nick").GiveItem("pipe_bomb");
		
		RemoveItemByName("molotov");
		Ent("!coach").GiveItem("molotov");
			
		respawnthrowable();
	});
	
	//10
	CreateTimer(9.500, function()
	{ 
		::AutoKick(Ent(2), Ent("!nick"));
	});
	
	CreateTimer(13.000, function()
	{ 
		SendToServerConsole("z_common_limit 30");
	});
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{

}

function Callbacks::OnFinalePause() // called during pause stage of panic event in the finale
{
	
}

function Callbacks::OnLastTankKilled() // called after killing a specified amount of Tanks in the finale (FinaleManager.Settings.MaxTanksInFinale)
{

}

function Callbacks::OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBeginCustomStage(iNum, iType)
{
	local ERROR = -1;
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	local SCRIPTED = 3;

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

::__SpawnZombie <- function(sName, vecPos = null, idle = false)
{
	local hTable =
	{
		infected = ZOMBIE_NORMAL
		mob = ZSPAWN_MOB
		tank = ZOMBIE_TANK
		witch = ZOMBIE_WITCH
		witch_bride = ZSPAWN_WITCHBRIDE
		hunter = ZOMBIE_HUNTER
		smoker = ZOMBIE_SMOKER
		boomer = ZOMBIE_BOOMER
		jockey = ZOMBIE_JOCKEY
		charger = ZOMBIE_CHARGER
		spitter = ZOMBIE_SPITTER
	}
	if (hTable.rawin(sName))
	{
		local sClass = sName;
		if (["infected", "witch", "witch_bride"].find(sName) == null) sClass = "player";
		else if (sName == "witch_bride")
		{
			sClass = "witch";
			Entities.First().PrecacheModel("models/infected/witch_bride.mdl");
		}
		local entList = [];
		local hEntity = null;
		while ((hEntity = Entities.FindByClassname(hEntity, sClass)) != null) entList.append(hEntity);
		ZSpawn({type = hTable.rawget(sName), pos = vecPos});
		while ((hEntity = Entities.FindByClassname(hEntity, sClass)) != null)
		{
			if (entList.find(hEntity) == null)
			{
				if (idle)
				{
					if (hEntity.IsPlayer()) hEntity.SetSenseFlags(BOT_CANT_FEEL | BOT_CANT_HEAR | BOT_CANT_SEE);
					else ReapplyInfectedFlags(INFECTED_FLAG_CANT_SEE_SURVIVORS | INFECTED_FLAG_CANT_HEAR_SURVIVORS | INFECTED_FLAG_CANT_FEEL_SURVIVORS, hEntity);
				}
				return hEntity;
			}
		}
		return null;
	}
	return error(format("[SpawnZombie] Invalid name '%s' specified.\n", sName));
}

::__SpawnCommon <- function(sName = null, vecPos = null, vecAng = null, flags = 1)
{
	const FALLEN_VJAR_OR_MOLOTOV = 1;
	const FALLEN_PIPE = 2;
	const FALLEN_PILLS = 4;
	const FALLEN_MEDKIT = 8;
	local cvar1 = Convars.GetFloat("z_forcezombiemodel"), cvar2 = Convars.GetFloat("z_fallen_max_count"), cvar3 = Convars.GetStr("z_forcezombiemodelname");
	Convars.SetValue("z_forcezombiemodel", 1);
	Convars.SetValue("z_fallen_max_count", 30);
	if (type(sName) == "string") Convars.SetValue("z_forcezombiemodelname", sName);
	else Convars.SetValue("z_forcezombiemodelname", sName ? "common_male_fallen_survivor" : "common_male_ceda");
	if (vecAng == null) vecAng = Vector(0, RandomInt(0, 360), 0);
	local hEntity = __SpawnZombie("infected");
	if (hEntity)
	{
		if (vecPos) hEntity.SetOrigin(vecPos);
		hEntity.SetAngles(QAngle(0, vecAng.y, 0));
		NetProps.SetPropInt(hEntity, "m_nFallenFlags", flags);
	}
	else error("Unable to spawn common infected due to limit.\n");
	Convars.SetValue("z_forcezombiemodel", cvar1.tointeger());
	Convars.SetValue("z_fallen_max_count", cvar2.tointeger());
	Convars.SetValue("z_forcezombiemodelname", cvar3);
	return hEntity;
}


function z1()
{
	CreateTimer(1.00, function()
	{ 
		__SpawnCommon( "common_male_fallen_survivor", Vector(87.500, -287.500, -3253.969), QAngle(0.0, 294.796, 0.0), 1 | 2 | 4| 8);
	});
	
	CreateTimer(2.00, function()
	{ 
		SpawnCommon("common_female_tshirt_skirt", Vector(-100.000, -368.648, -3251.969), QAngle(0.0, 85.762, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(12.500, -512.500, -3253.969), QAngle(0.0, 313.808, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-82.428, -512.500, -3247.384), QAngle(0.0, 214.528, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-62.500, -150.000, -3251.969), QAngle(0.0, 117.178, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-62.500, -150.000, -3251.969), QAngle(0.0, 52.052, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-82.999, -543.203, -3247.955), QAngle(0.0, 76.511, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-87.500, -112.500, -3251.969), QAngle(0.0, 299.051, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-80.743, -573.258, -3253.969), QAngle(0.0, 162.485, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-125.000, -467.252, -3457.052), QAngle(0.0, 91.082, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-178.065, -443.203, -3463.064), QAngle(0.0, 273.648, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-177.235, -433.827, -3465.408), QAngle(0.0, 33.652, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-137.500, -312.500, -3495.740), QAngle(0.0, 190.334, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-187.500, -537.500, -3447.417), QAngle(0.0, 166.201, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-187.500, -537.500, -3447.417), QAngle(0.0, 31.254, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-112.500, -300.000, -3498.865), QAngle(0.0, 0.718, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-25.000, -115.235, -3252.969), QAngle(0.0, 142.942, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-137.500, -587.500, -3445.902), QAngle(0.0, 186.956, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-50.000, -654.693, -3445.969), QAngle(0.0, 72.210, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-287.500, -287.500, -3317.969), QAngle(0.0, 252.854, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-25.000, -62.500, -3252.969), QAngle(0.0, 205.509, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-62.500, -37.500, -3567.667), QAngle(0.0, 169.789, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-62.500, -37.500, -3567.667), QAngle(0.0, 118.836, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-73.273, -756.767, -3445.752), QAngle(0.0, 147.099, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(12.500, 37.500, -3253.969), QAngle(0.0, 144.811, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-37.500, -12.500, -3573.969), QAngle(0.0, 144.563, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-237.500, -762.500, -3445.969), QAngle(0.0, 40.998, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-237.500, -762.500, -3445.969), QAngle(0.0, 91.187, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(0.000, -753.233, -3445.969), QAngle(0.0, 253.794, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-120.114, 50.000, -3573.969), QAngle(0.0, 91.831, 0.0));
	});
}
