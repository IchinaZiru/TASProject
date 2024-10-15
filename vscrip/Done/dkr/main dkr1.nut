// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Juxar");
SetClientName(Ent("!rochelle"), "ICHINA");
SetClientName(Ent("!ellis"), "おかゆさん");
SetClientName(Ent("!nick"), "Azure");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Impossible"

	director_no_bosses = 0
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
		cvar("st_mr_force_file", "dkr1coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
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
		cvar("st_mr_force_file", "dkr1ellis");
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
		cvar("st_mr_force_file", "dkr1nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
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
		cvar("st_mr_force_file", "dkr1rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
RemoveItemByName("gascan");RemoveItemByName("propanetank");

SpawnItem("molotov", Vector(7246.188, -4875.813, -666.583), QAngle(0.000, 0.000, 0.000), 1, 3.0); //最初のばんのなか
SpawnItem("vomitjar", Vector(5209.406, -4587.469, -698.804), QAngle(0.000, 0.000, 0.000), 1, 3.0);//家の中
SpawnItem("molotov", Vector(3164.844, -214.031, -931.583), QAngle(0.000, 0.000, 0.000), 1, 3.0);//途中の弾薬の近く
SpawnItem("vomitjar", Vector(5209.406, -4587.469, -698.804), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(3597.313, 481.094, -1002.804), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(5177.750, -4597.969, -703.751), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(-2118.813, -736.813, -1200.741), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("gascan_scavenge", Vector(7183.969, -4828.938, -666.875), QAngle(276.416, 241.611, 121.025), -1, 3.0);
SpawnItem("adrenaline", Vector(3164.188, 7.188, -936.259), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(3668.781, -3744.406, -1002.804), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnTrigger("cb", Vector(9955.063, -4517.462, -514.219));
SpawnTrigger("cb2", Vector(9188.521, -4553.958, -531.192));
SpawnTrigger("vote1", Vector(3085.015, -456.505, -967.969));
SpawnTrigger("vote2", Vector(-2114.872, -676.615, -1203.283));
SpawnTrigger("tank", Vector(951.287, 1304.136, -807.969));
SpawnTrigger("spitter", Vector(-5532.264, -135.199, -1120.848));

SpawnTrigger("trigger_area1", Vector(9765.436, -4233.233, -524.185));
SpawnTrigger("dump", Vector(4227.338, -4820.049, -754.097));
SpawnTrigger("dump1", Vector(-532.085, -769.589, -975.969));
SpawnTrigger("dumpfirst", Vector(9863.420, -4524.661, -514.754));
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb"  && activator == Ent("!ellis"))
		{
			SpawnCommonForCB(Vector(8456.075, -4735.150, -579.507), QAngle(0.000, 42.962, 0.000));
			//SpawnCommonForCB(Vector(7352.267, -5052.558, -693.161),  QAngle(0.000, 4.012, 0.000));
			//SpawnCommonForCB(Vector(7911.767, -4805.897, -640.977), QAngle(0.000, 41.076, 0.000));
			//SpawnCommonForCB(Vector(8341.472, -4692.988, -580.545), QAngle(0.000, -1.991, 0.000));
		}
		else if (sName == "cb2"  && activator == Ent("!ellis"))
		{
			SpawnCommonForCB(Vector(6957.404, -5052.441, -717.617),  QAngle(0.000, 324.068, 0.000));
		}
		else if (sName == "vote1"  && activator == Ent("!ellis"))
		{
			SendToServerConsole("callvote changedifficulty Easy");
 				SendToServerConsole("sm_voteall");
				 SendToServerConsole("z_allow_ai_to_use_abilities 0");
				//SpawnZombie("tank", Vector(-1537.500, -850.000, -1008.349));
		}
		else if (sName == "vote2" && activator == Ent("!nick"))
		{
		SendToServerConsole("callvote changedifficulty Impossible");	
		SendToServerConsole("sm_voteall");
		}
		else if (sName == "tank")
		{
			
			//SpawnZombie("tank", Vector(-1980.554, -564.625, -1130.174));
			SpawnZombie("tank", Vector(-2035.413, -513.541, -1160.167));
		}
		else if (sName == "spitter")
		{
			//SpawnZombie("spitter",Vector(-4336.571, -548.079, -1711.853));
			SpawnCommonForCB(Vector(-6581.221, -318.543, -1007.106), QAngle(0.000, 2.987, 0.000));
			SpawnZombie("boomer", Vector(-7335.283, 345.971, -1007.883));
			SpawnCommon("common_female_tshirt_skirt", Vector(-6323.343, -896.891, -1008.101), QAngle(0.0, 79.664, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-6629.065, -709.251, -1007.182), QAngle(0.0, 359.634, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6571.188, -718.925, -1007.420), QAngle(0.0, 1.526, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-6899.304, 1108.287, -868.853), QAngle(0.0, 103.469, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6969.936, -629.948, -1007.317), QAngle(0.0, 33.321, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-5612.500, 787.500, -1042.741), QAngle(0.0, 191.346, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-5575.000, 769.386, -1062.592), QAngle(0.0, 217.954, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6734.190, 1471.184, -997.714), QAngle(0.0, 251.328, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-7062.500, 1600.000, -911.034), QAngle(0.0, 3.023, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-8175.000, -162.500, -997.790), QAngle(0.0, 185.072, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8100.000, 187.500, -997.813), QAngle(0.0, 246.551, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-6531.327, 423.455, -1007.695), QAngle(0.0, 304.932, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-6592.000, 621.885, -1008.170), QAngle(0.0, 294.839, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-6616.352, 178.224, -1007.301), QAngle(0.0, 32.453, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-6512.503, 235.231, -1007.518), QAngle(0.0, 37.184, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-6519.804, 314.471, -1007.689), QAngle(0.0, 343.883, 0.0));
		}
		else if (sName == "dump" && activator == Ent("!ellis"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(4275.000, -3886.931, -916.558), QAngle(0.0, 111.018, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(4229.569, -3873.853, -937.160), QAngle(0.0, -23.294, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(4134.327, -3903.819, -939.971), QAngle(0.0, 415.219, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(4078.876, -3982.630, -929.416), QAngle(0.0, -63.287, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(4195.913, -3533.056, -961.467), QAngle(0.0, 334.665, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(4437.500, -3506.489, -900.954), QAngle(0.0, 45.509, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(4098.983, -3268.775, -995.742), QAngle(0.0, -14.659, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(3166.054, -3375.076, -989.609), QAngle(0.0, 399.165, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(4743.732, -3509.080, -903.152), QAngle(0.0, -47.764, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(2725.000, -4675.000, -693.969), QAngle(0.0, 247.439, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(3448.116, -4591.614, -693.969), QAngle(0.0, 74.057, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(2725.000, -4675.000, -693.969), QAngle(0.0, 337.239, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(3416.039, -4545.798, -693.969), QAngle(0.0, 183.273, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(9776.870, -5277.508, -504.348), QAngle(0.0, 240.315, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(9780.362, -5311.025, -504.575), QAngle(0.0, 270.430, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(9782.114, -5325.155, -504.668), QAngle(0.0, 22.264, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(9799.143, -5422.530, -505.251), QAngle(0.0, 158.374, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(9774.574, -5395.205, -505.224), QAngle(0.0, 170.149, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(9757.527, -5294.740, -504.569), QAngle(0.0, 77.614, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(9769.378, -5343.510, -504.874), QAngle(0.0, 142.397, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(9766.494, -5276.939, -504.392), QAngle(0.0, 352.681, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(9788.980, -5268.615, -504.228), QAngle(0.0, 183.277, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(9762.302, -5333.897, -504.842), QAngle(0.0, 353.628, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(9779.141, -5267.857, -504.267), QAngle(0.0, 113.699, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(9772.701, -5312.022, -504.622), QAngle(0.0, 350.899, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(9790.146, -5313.012, -504.538), QAngle(0.0, 353.977, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(9768.088, -5410.774, -505.383), QAngle(0.0, 98.072, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2725.000, -4675.000, -693.969), QAngle(0.0, 1.231, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(3588.073, -4423.674, -693.969), QAngle(0.0, 280.109, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(2725.000, -4675.000, -693.969), QAngle(0.0, 152.936, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(3443.252, -4406.045, -693.969), QAngle(0.0, 198.680, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(3294.099, -3699.792, -1005.029), QAngle(0.0, 305.778, 0.0));
		}
		else if (sName == "dump1" && activator == Ent("!nick"))
		{
			SpawnCommon("common_female_tshirt_skirt", Vector(-2575.000, -702.958, -1474.381), QAngle(0.0, 154.069, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-2712.500, -675.000, -1458.508), QAngle(0.0, 231.477, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2643.571, -558.982, -1523.685), QAngle(0.0, 321.777, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-2541.899, -100.000, -1459.233), QAngle(0.0, 324.465, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1462.500, 112.500, -998.350), QAngle(0.0, 329.575, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2073.271, 331.671, -1174.807), QAngle(0.0, 202.102, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-2574.806, -43.904, -1483.773), QAngle(0.0, 192.240, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2477.268, -150.000, -1424.714), QAngle(0.0, 87.477, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-2434.510, 25.000, -1403.147), QAngle(0.0, 216.231, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-2412.938, -150.000, -1389.296), QAngle(0.0, 131.450, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-1363.730, 396.391, -998.310), QAngle(0.0, 24.969, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-2800.000, -234.249, -1565.470), QAngle(0.0, 55.046, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-2492.343, 529.931, -1436.708), QAngle(0.0, 166.794, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-2950.000, -270.010, -1650.521), QAngle(0.0, 79.356, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(10015.296, -5522.884, -467.599), QAngle(0.0, 189.029, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9987.875, -5507.092, -467.599), QAngle(0.0, 277.203, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9988.019, -5534.276, -467.599), QAngle(0.0, 351.718, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9992.967, -5538.702, -467.599), QAngle(0.0, 20.640, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9982.822, -5503.264, -467.599), QAngle(0.0, 72.804, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9785.414, -5367.271, -504.952), QAngle(0.0, 232.007, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9770.508, -5367.210, -505.043), QAngle(0.0, 111.486, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9799.993, -5264.988, -504.153), QAngle(0.0, 27.968, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9768.021, -5375.259, -505.118), QAngle(0.0, 265.311, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9766.545, -5392.215, -505.255), QAngle(0.0, 346.020, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9794.934, -5376.748, -504.960), QAngle(0.0, 291.844, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9761.090, -5341.800, -504.908), QAngle(0.0, 161.953, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9793.325, -5272.199, -504.234), QAngle(0.0, 350.775, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9768.593, -5304.555, -504.588), QAngle(0.0, 242.826, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9750.222, -5318.054, -504.786), QAngle(0.0, 125.045, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9753.658, -5303.007, -504.652), QAngle(0.0, 27.511, 0.0));
		}
		else if (sName == "dumpfirst" && activator == Ent("!ellis"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(9886.143, -5089.717, -552.271), QAngle(0.0, 97.008, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9005.006, -4271.455, -542.815), QAngle(0.0, 84.891, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(8500.658, -4853.065, -622.532), QAngle(0.0, 303.988, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(8297.497, -5070.812, -618.678), QAngle(0.0, 64.231, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(8101.633, -4356.317, -585.474), QAngle(0.0, 253.754, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(8087.500, -4257.519, -546.356), QAngle(0.0, 133.113, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(8212.500, -5112.500, -609.813), QAngle(0.0, 209.933, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(8275.000, -5299.686, -574.884), QAngle(0.0, 99.182, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(7960.746, -3925.000, -640.238), QAngle(0.0, 176.527, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(7862.500, -4215.801, -557.917), QAngle(0.0, 252.707, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(7737.500, -4912.500, -664.010), QAngle(0.0, 127.121, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(7700.000, -4900.000, -666.631), QAngle(0.0, 149.676, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(7637.500, -4225.000, -614.484), QAngle(0.0, 170.588, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(7887.500, -3975.000, -641.621), QAngle(0.0, 123.307, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(7912.500, -3962.500, -640.921), QAngle(0.0, 152.578, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(8937.500, -4912.500, -605.372), QAngle(0.0, 209.298, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(8725.974, -5012.177, -616.266), QAngle(0.0, 351.312, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(8912.500, -5562.500, -535.797), QAngle(0.0, 80.449, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9662.152, -5262.233, -507.270), QAngle(0.0, 330.258, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9644.182, -5248.812, -507.555), QAngle(0.0, 265.591, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9883.073, -5518.115, -467.599), QAngle(0.0, 25.621, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9795.896, -5407.265, -505.168), QAngle(0.0, 12.817, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9888.579, -5526.117, -467.599), QAngle(0.0, 312.300, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(9794.611, -5417.405, -505.247), QAngle(0.0, 308.827, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(9877.071, -5549.542, -467.599), QAngle(0.0, 33.151, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9784.924, -5313.131, -504.566), QAngle(0.0, 252.712, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9881.084, -5503.688, -467.599), QAngle(0.0, 159.792, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9768.262, -5311.092, -504.638), QAngle(0.0, 226.316, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9883.652, -5542.473, -467.599), QAngle(0.0, 31.027, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(9774.945, -5402.052, -505.272), QAngle(0.0, 70.821, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9891.426, -5535.797, -467.599), QAngle(0.0, 253.393, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9793.274, -5405.823, -505.175), QAngle(0.0, 78.295, 0.0));
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
	cvar("host_timescale", 0.5);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 24.877);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 25.333);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 19.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 25.133);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 19.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 25.133);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 42.133);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 42.133);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 41.877);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 49.333);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 49.333);
 

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
