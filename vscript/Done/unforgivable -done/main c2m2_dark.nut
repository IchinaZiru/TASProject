// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "XDSamXD");
SetClientName(Ent("!rochelle"), "Kyubiツ");
SetClientName(Ent("!ellis"), "ICHINA");
SetClientName(Ent("!nick"), "boo");

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
	st_edgebug = 0
	st_idle_anytime = 1
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(771.703, 11386.607, -162.292) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(6.229, -148.622, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 94
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
			ammo = 71
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c2m2_dark_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(736.396, 11388.391, -162.292) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(46.284, -106.956, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 81
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
			ammo = 71
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c2m2_dark_ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(724.959, 11520.762, -162.292) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(51.882, -87.160, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "c2m2_dark_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(740.082, 11441.356, -162.292) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(10.802, -108.946, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 94
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 65
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c2m2_dark_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
RemoveItemByName("chainsaw");

SpawnItem("adrenaline", Vector(759.000, 11514.000, -161.813), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pistol_magnum", Vector(625.000, 11539.000, -119.313), QAngle(0.000, 24.521, 91.494), 5, 3.0);

SpawnItem("grenade_launcher", Vector(1251.344, 2477.250, -264.438), QAngle(360.000, 1.187, 269.780), 1, 3.0);
SpawnItem("vomitjar", Vector(1408.344, 3258.000, -219.804), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(1408.125, 3130.406, -258.720), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pistol_magnum", Vector(1473.406, 3146.781, -213.813), QAngle(359.736, 315.000, 87.451), 4, 3.0);

SpawnTrigger("trigger_area1", Vector(-1577.770, 6961.285, -135.969));
SpawnTrigger("hunter", Vector(-1391.842, 6824.004, -104.885));
SpawnTrigger("tank", Vector(-511.869, 6444.243, -66.108));
SpawnTrigger("remove", Vector(636.139, -7057.110, -264.969));
SpawnTrigger("trigger_area2", Vector(535.730, 2616.092, -260.606));

SpawnTrigger("dump", Vector(575.110, 9384.340, -181.969));
SpawnTrigger("dump2", Vector(-1499.874, 7556.293, -262.920));
SpawnTrigger("dump3", Vector(352.262, -2083.316, -243.322));
SpawnTrigger("dump4", Vector(492.603, -7428.974, -264.969));



function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "hunter")
		{
			SpawnZombie("hunter", Vector(-1025.880, 6922.754, -268.463));
			SpawnZombie("boomer", Vector(-724.144, 5705.291, -61.438));
		}
		else if (sName == "tank" && activator == Ent("!ellis"))
		{
			//SpawnZombie("tank", Vector(-218.113, 5349.865, -113.967)); //本来のやつ
			//SpawnZombie("tank", Vector(-240.640, 5349.865, -106.034)); // 2回目のやつまあまあいい
			SpawnZombie("tank", Vector(-237.819, 5349.865, -107.027));
			SendToServerConsole("z_allow_ai_to_use_abilities 0");
			SendToServerConsole("callvote changedifficulty Easy");
                    SendToServerConsole("sm_voteall");
		}
		else if (sName == "trigger_area1")
		{
			SendToServerConsole("z_allow_ai_to_use_abilities 1");
		}
		else if (sName == "remove")
		{
			SendToServerConsole("ent_remove_all infected 1");
		}
		else if (sName == "trigger_area2" && activator == Ent("!rochelle"))
		{
			SendToServerConsole("callvote changedifficulty Impossible");
			SendToServerConsole("sm_voteall");
SpawnCommon("common_male_tshirt_cargos", Vector(719.168, 1001.094, -269.503), QAngle(0.0, 234.721, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(267.305, -35.156, -266.969), QAngle(0.0, 50.217, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(269.000, 97.554, -266.969), QAngle(0.0, 32.870, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(292.813, 214.215, -266.969), QAngle(0.0, 9.531, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(370.074, 60.860, -266.969), QAngle(0.0, 54.554, 0.0));

		}
		else if (sName == "dump" && activator == Ent("!nick"))
		{
SpawnCommon("common_male_dressShirt_jeans", Vector(-799.547, 8605.192, -89.745), QAngle(0.0, 331.052, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-815.020, 8548.519, -89.745), QAngle(0.0, 338.700, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-588.263, 8652.758, -89.745), QAngle(0.0, 303.613, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-521.384, 8614.200, -89.745), QAngle(0.0, 295.570, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-376.425, 8632.170, -89.745), QAngle(0.0, 218.851, 0.0));
		}
		else if (sName == "dump2" && activator == Ent("!nick"))
		{
SpawnCommon("common_male_tankTop_jeans", Vector(-900.844, 5930.362, -88.589), QAngle(0.0, 84.436, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-752.892, 6026.647, -9.124), QAngle(0.0, 95.948, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-741.996, 6331.634, -64.808), QAngle(0.0, 102.177, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-782.416, 6425.954, -74.836), QAngle(0.0, 98.314, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-912.580, 6277.158, -89.745), QAngle(0.0, 78.601, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-858.882, 6483.482, -85.082), QAngle(0.0, 81.519, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-918.527, 6646.620, -89.745), QAngle(0.0, 35.629, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-855.105, 6868.240, -82.857), QAngle(0.0, 281.221, 0.0));
		}
		else if (sName == "dump3" && activator == Ent("!ellis"))
		{
SpawnCommon("common_male_dressShirt_jeans", Vector(378.787, -4147.738, -222.433), QAngle(335.311, 53.076, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(386.294, -5010.505, -264.969), QAngle(340.809, 78.307, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(439.009, -5624.817, -221.760), QAngle(351.694, 54.633, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(481.422, -5750.136, -264.969), QAngle(347.203, 72.926, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(624.662, -7465.641, -264.969), QAngle(353.946, 110.851, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(256.031, -7725.310, -263.969), QAngle(0.694, 318.281, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(256.031, -7918.277, -263.969), QAngle(0.172, 58.260, 0.000));
		}
		else if (sName == "dump4" && activator == Ent("!ellis"))
		{
SpawnCommon("common_female_tankTop_jeans", Vector(983.044, -10056.242, -265.969), QAngle(358.324, 217.690, 0.000));
SpawnCommon("common_male_tankTop_jeans", Vector(933.343, -10074.213, -265.969), QAngle(357.845, 223.052, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(987.554, -10306.759, -265.969), QAngle(349.096, 333.971, 0.000));
SpawnCommon("common_male_tankTop_jeans", Vector(704.170, -9594.163, -265.969), QAngle(1.435, 140.242, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(382.615, -9507.298, -264.969), QAngle(346.998, 332.217, 0.000));
SpawnCommon("common_male_tankTop_jeans", Vector(381.278, -9314.794, -264.969), QAngle(351.486, 305.251, 0.000));
SpawnCommon("common_male_dressShirt_jeans", Vector(581.651, -10327.157, -264.969), QAngle(-0.000, 71.981, 0.000));
SpawnCommon("common_male_dressShirt_jeans", Vector(739.344, -10285.779, -265.969), QAngle(359.605, 138.529, 0.000));
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);OpenSafeRoomDoor(); 

	SpawnCommon("common_male_tshirt_cargos", Vector(539.025, 10311.136, -154.272), QAngle(0.0, 62.911, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(572.377, 10197.512, -137.696), QAngle(0.0, 71.269, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(485.902, 10419.565, -175.898), QAngle(0.0, 49.191, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(833.781, 9232.824, -176.182), QAngle(0.0, 87.748, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(991.460, 9625.933, -173.818), QAngle(0.0, 112.507, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(976.406, 9496.736, -181.969), QAngle(0.0, 104.543, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(824.820, 9600.852, -152.457), QAngle(0.0, 83.806, 0.0));

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 9.500);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 9.500);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 10.133);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 10.133);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 3.900);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 10.033);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 14.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 14.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 20.133);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 20.133);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 19.877);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 20.333);
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 29.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 29.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 35.633);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 35.633);

	
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
