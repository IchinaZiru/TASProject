// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(44.667); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!nick"), "ShamE"); 
SetClientName(Ent("!rochelle"), "Sansupanshuu!");
SetClientName(Ent("!ellis"), "happyskillch");
SetClientName(Ent("!coach"), "DarkNe$$");

Cvars <- // console variables manager; format: cvar_name = value(string or number)
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
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-5397.236, 2024.697, -3191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.574, 94.266, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	health = 50

	Inventory =
	{
		active_slot = "slot3"
		
		slot0 = // primary weapon
		{
			weapon = "smg"
			clip = 50
			ammo = 622
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
		
		slot3 = "upgradepack_explosive" // medkit/defib
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm3_coach");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	origin = Vector(-5218.562, 2012.812, -3191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 94.356, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	health = 100

	Inventory =
	{
		active_slot = "slot1"
		
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 30
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm3_ellis");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	origin = Vector(-5132.196, 1885.461, -3191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 8.580, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	health = 100

	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm3_nick");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-5319.293, 1998.326, -3191.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 328.913, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	health = 50

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
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm3_rochelle");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

SpawnTrigger("ci2", Vector(-6816.810, -1072.912, -4505.357));
SpawnTrigger("si1", Vector(-6416.819, -245.708, -4543.969));
SpawnTrigger("ci3", Vector(-5636.478, 120.428, -5758.699));
SpawnTrigger("si2", Vector(-6448.544, 1540.062, -5495.969));
SpawnTrigger("si2_2", Vector(-8996.279, 1516.753, -4675.401));
SpawnTrigger("ci4", Vector(-7434.351, 1519.599, -5204.124));
SpawnTrigger("ci5", Vector(-11217.826, 1598.758, -4467.969));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "ci2" && activator == Ent("!rochelle"))
		{
			/*SpawnCommon("common_female_tshirt_skirt", Vector(-6812.500, -962.500, -3253.969), QAngle(0.0, 218.577, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-7031.053, -1150.000, -3253.969), QAngle(0.0, 85.130, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-7762.500, -212.500, -4725.973), QAngle(0.0, 229.551, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-7762.500, -212.500, -4725.973), QAngle(0.0, 234.653, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-7850.000, -400.000, -4725.969), QAngle(0.0, 167.209, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-7040.322, -525.000, -3253.969), QAngle(0.0, 66.951, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-6658.361, -860.099, -3253.969), QAngle(0.0, 88.453, 0.0));*/
			SpawnCommon("common_female_tshirt_skirt", Vector(-8062.500, -350.000, -4725.401), QAngle(0.0, 245.928, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-8062.500, -350.000, -4725.401), QAngle(0.0, 97.742, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-8010.231, -308.062, -4725.969), QAngle(0.0, 14.247, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-8062.500, -275.000, -4726.319), QAngle(0.0, 69.837, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-8062.500, -275.000, -4726.319), QAngle(0.0, 42.615, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-6150.000, -238.656, -4706.898), QAngle(0.0, 317.582, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5991.553, -150.000, -4721.490), QAngle(0.0, 100.540, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-6012.500, -300.000, -4720.435), QAngle(0.0, 178.048, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-6662.500, -1150.000, -4715.969), QAngle(0.0, 104.407, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-6662.500, -1150.000, -4715.969), QAngle(0.0, 143.175, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-6637.500, -1262.500, -4714.066), QAngle(0.0, 15.977, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7012.500, -487.500, -4718.977), QAngle(0.0, 151.747, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7212.500, -1312.500, -4429.252), QAngle(0.0, 259.666, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7537.500, -1325.000, -4726.705), QAngle(0.0, 236.136, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7287.500, -1187.500, -4285.969), QAngle(0.0, 129.500, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-7450.000, -1262.500, -4405.969), QAngle(0.0, 38.306, 0.0));
			caller.Kill();
		}
		else if (sName == "si1" && activator == Ent("!rochelle"))
		{
			SpawnZombie("hunter", Vector(-5737.500, -62.449, -4718.226));
			SpawnZombie("boomer", Vector(-5687.500, 262.500, -4716.969));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7173.870, -550.896, -4724.926), QAngle(0.0, 96.287, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7575.000, -412.500, -4725.969), QAngle(0.0, 7.314, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-5625.000, 237.500, -4716.475), QAngle(0.0, 180.267, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-5337.500, 800.000, -4698.766), QAngle(0.0, 98.353, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-7700.296, -243.904, -4725.981), QAngle(0.0, 99.204, 0.0));
			caller.Kill();
		}
		else if (sName == "ci3" && activator == Ent("!rochelle"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(-5212.500, 2300.000, -3269.264), QAngle(0.0, 199.355, 0.0));
			SpawnCommon("common_male_fallen_survivor", Vector(-5312.500, 2300.000, -3283.225), QAngle(0.0, 53.467, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5212.500, 137.500, -5750.506), QAngle(0.0, 41.205, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-5212.500, 137.500, -5750.506), QAngle(0.0, 59.228, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-5145.487, 220.560, -5749.974), QAngle(0.0, 61.197, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-5087.500, 237.500, -5749.978), QAngle(0.0, 251.172, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-5189.025, 350.180, -5749.971), QAngle(0.0, 90.543, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-5237.500, 312.500, -5749.969), QAngle(0.0, 81.338, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-5250.000, 361.600, -5749.969), QAngle(0.0, 153.261, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-5062.500, 387.500, -5732.456), QAngle(0.0, 230.590, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5287.500, 375.000, -5749.969), QAngle(0.0, 17.150, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5199.747, 791.989, -5707.060), QAngle(0.0, 183.172, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-5265.764, 835.250, -5688.749), QAngle(0.0, 75.080, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-5287.500, 975.000, -5640.302), QAngle(0.0, 118.085, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-5262.500, 1037.500, -5620.981), QAngle(0.0, 57.330, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5262.500, 1037.500, -5620.981), QAngle(0.0, 135.528, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-5162.077, 1094.964, -5615.875), QAngle(0.0, 280.244, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5155.774, 1168.538, -5590.313), QAngle(0.0, 114.950, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-5212.500, 1175.000, -5582.754), QAngle(0.0, 260.901, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-5237.500, 1187.500, -5575.453), QAngle(0.0, 76.994, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-5036.821, 1188.653, -5591.713), QAngle(0.0, 344.589, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-5275.000, 1116.853, -5593.690), QAngle(0.0, 125.703, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-5275.000, 1328.442, -5521.440), QAngle(0.0, 319.536, 0.0));
			caller.Kill();
		}
		else if (sName == "si2" && activator == Ent("!rochelle"))
		{
			SpawnZombie("spitter", Vector(-5265.920, 1325.262, -5530.093));
			SpawnZombie("witch", Vector(-8317.938, 1712.500, -4900.627), QAngle(0.000, 310.559, 0.000));
			CreateTimer(0.500, function()
			{ 
				SpawnZombie("jockey", Vector(-8287.500, 1350.000, -4916.630));
			});
			caller.Kill();
		}
		else if (sName == "si2_2" && activator == Ent("!rochelle"))
		{
			SpawnZombie("tank", Vector(-9987.500, 1650.000, -4479.969));
			caller.Kill();
		}
		else if (sName == "ci4" && activator == Ent("!rochelle"))
		{
			SpawnCommon("common_female_tshirt_skirt", Vector(-7562.500, 1412.500, -5159.241), QAngle(0.000, 162.235, 0.000));
			SpawnCommon("common_female_tshirt_skirt", Vector(-7562.500, 1412.500, -5159.241), QAngle(0.000, 162.235, 0.000));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-8287.500, 1350.000, -4916.630), QAngle(0.000, 294.811, 0.000));
			SpawnCommon("common_male_tshirt_cargos", Vector(-8287.500, 1350.000, -4916.630), QAngle(0.000, 281.385, 0.000));
		}
		else if (sName == "ci5" && activator == Ent("!rochelle"))
		{
			SpawnCommon("common_female_tshirt_skirt", Vector(-11975.000, 1125.000, -4437.969), QAngle(0.0, 148.303, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-12037.500, 1137.500, -4437.969), QAngle(0.0, 0.131, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-12037.500, 1137.500, -4437.969), QAngle(0.0, 236.944, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-11776.294, 980.457, -4437.969), QAngle(0.0, 206.221, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-12415.451, 2018.810, -4469.969), QAngle(0.0, 347.279, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-12596.261, 2224.043, -4137.969), QAngle(0.0, 218.302, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-9751.696, 1650.000, -4469.969), QAngle(0.0, 287.426, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-12293.709, 2181.095, -4137.969), QAngle(0.0, 328.374, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-9710.020, 1650.000, -4469.969), QAngle(0.0, 283.837, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-12881.792, 2274.982, -4137.969), QAngle(0.0, 263.725, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-9734.011, 1650.000, -4469.969), QAngle(0.0, 127.103, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-12889.078, 2291.111, -4137.969), QAngle(0.0, 130.571, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-9762.062, 1650.000, -4469.969), QAngle(0.0, 195.948, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-12753.295, 2317.943, -4137.969), QAngle(0.0, 36.714, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-9732.390, 1650.000, -4469.969), QAngle(0.0, 312.980, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-12013.746, 2212.633, -4137.969), QAngle(0.0, 267.137, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-9734.403, 1650.000, -4469.969), QAngle(0.0, 326.462, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-12879.479, 2332.744, -4137.969), QAngle(0.0, 317.532, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-9726.869, 1650.000, -4469.969), QAngle(0.0, 136.136, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-11483.953, 2327.725, -4137.969), QAngle(0.0, 179.535, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-9756.018, 1650.000, -4469.969), QAngle(0.0, 338.856, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(-12727.045, 2264.920, -4137.969), QAngle(0.0, 172.711, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-9701.863, 1650.000, -4469.969), QAngle(0.0, 219.206, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-11781.712, 2178.864, -4137.969), QAngle(0.0, 246.924, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-9711.619, 1650.000, -4469.969), QAngle(0.0, 142.880, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(-12250.579, 2322.841, -4137.969), QAngle(0.0, 350.639, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(-9737.791, 1650.000, -4469.969), QAngle(0.0, 182.294, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(-12241.449, 2301.649, -4137.969), QAngle(0.0, 59.110, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(-9730.527, 1650.000, -4469.969), QAngle(0.0, 110.160, 0.0));
			caller.Kill();
		}
		else if (sName == "ci5")
		{
			
		}
	}
}

//Weapons Spawn

local ent;
while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();

local ent;
while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();
RemoveItemByName("upgrade_laser_sight"); RemoveItemByName("oxygentank"); RemoveItemByName("propanetank"); RemoveItemByName("gascan");
RemoveItemByName("pain_pills"); RemoveItemByName("adrenaline"); RemoveItemByName("defibrillator"); RemoveItemByName("first_aid_kit");
RemoveItemByName("upgradepack_explosive"); RemoveItemByName("upgradepack_incendiary"); RemoveItemByName("vomitjar"); RemoveItemByName("pipe_bomb"); 
RemoveItemByName("molotov");

//Start
SpawnItem("first_aid_kit", Vector(-5088.000, 1968.688, -3156.125), QAngle(0.000, 127.002, 0.000), 1, 100);
SpawnItem("first_aid_kit", Vector(-5105.000, 1965.688, -3153.594), QAngle(90.000, 37.485, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5084.000, 1983.688, -3156.125), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5098.938, 1983.594, -3153.594), QAngle(90.000, 316.011, 0.000), 1);
SpawnItem("ammo", Vector(-5092.719, 2004.000, -3156.125), QAngle(0.000, 76.992, 0.000), 1);
SpawnItem("rifle_ak47", Vector(-5088.031, 1884.031, -3158.375), QAngle(0.044, 62.930, 90.791), 4);
SpawnItem("shotgun_spas", Vector(-5087.969, 1936.000, -3158.531), QAngle(0.044, 251.016, 270.439), 4);

SpawnItem("molotov", Vector(-5390.000, 1928.000, -3153.000), QAngle(318.999, 0.000, 266.001), 1, 100);
SpawnItem("pipe_bomb", Vector(-5392.000, 1904.000, -3151.125), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("upgradepack_explosive", Vector(-5402.531, 2085.031, -3134.469), QAngle(359.165, 357.935, 0.000), 1, 30);


SpawnItem("sniper_military", Vector(-6743.969, -720.125, -3222.594), QAngle(358.813, 71.982, 89.165), 5);
//SpawnItem("defibrillator", Vector(-6744.656, -751.625, -3223.563), QAngle(359.517, 270.220, 1.187), 1);
SpawnItem("grenade_launcher", Vector(-6740.188, -683.469, -3222.094), QAngle(1.714, 270.000, 358.374), 1);
SpawnItem("oxygentank", Vector(-7122.063, -991.563, -3258.969), QAngle(271.318, 112.764, 270.000), -1);
//outside
SpawnItem("propanetank", Vector(-8080.938, -159.781, -3396.906), QAngle(0.483, 359.824, 0.659), -1);
SpawnItem("defibrillator", Vector(-8064.000, 139.188, -3407.531), QAngle(358.770, 0.308, 1.099), 1);
SpawnItem("gascan", Vector(-7778.063, 462.406, -3397.188), QAngle(360.000, 0.132, 359.956), -1);
//near stairs to 2nd elev
SpawnItem("oxygentank", Vector(-6713.469, -669.438, -4731.344), QAngle(306.606, 287.271, 90.000), -1);
//2nd elev
SpawnItem("pipe_bomb", Vector(-5725.969, 850.656, -4738.844), QAngle(0.000, 0.000, 0.176), 1);
//SpawnItem("gascan", Vector(-5706.875, 174.563, -4714.313), QAngle(354.946, 359.517, 7.471), -1);
//weapon rooms
SpawnItem("autoshotgun", Vector(-6784.406, -1150.125, -4690.438), QAngle(359.956, 334.995, 90.308), 5);
SpawnItem("rifle_sg552", Vector(-6769.000, -1122.000, -4690.125), QAngle(359.868, 209.971, 89.604), 5);
//2
SpawnItem("pain_pills", Vector(-7134.656, -1264.719, -4415.500), QAngle(0.659, 359.692, 2.153), 1);
SpawnItem("pistol", Vector(-7332.438, -1190.250, -4414.844), QAngle(0.176, 299.971, 90.264), 5);
//lambda sign 
SpawnItem("pain_pills", Vector(-7701.563, -1202.625, -4736.000), QAngle(0.000, 0.000, 0.000), 1);
//SpawnItem("molotov", Vector(-7809.688, -1145.750, -4765.813), QAngle(38.936, 150.161, 89.824), 1);
SpawnItem("vomitjar", Vector(-7734.969, -1233.875, -4765.875), QAngle(298.213, 330.073, 90.000), 1);
//long upcave

SpawnItem("machete", Vector(-11722.875, 1721.406, -4447.125), QAngle(358.682, 41.484, 269.604), 1);
SpawnItem("machete", Vector(-7740.188, 1622.875, -5114.875), QAngle(2.021, 240.820, 69.521), 1);
SpawnItem("adrenaline", Vector(-7392.750, 1354.156, -5222.563), QAngle(72.861, 299.312, 323.877), 1);
//SpawnItem("molotov", Vector(-6972.750, 1741.688, -5404.188), QAngle(16.479, 262.969, 250.884), 1);
SpawnItem("pumpshotgun", Vector(-6473.000, 1656.031, -5495.469), QAngle(7.646, 188.965, 89.604), 5);
SpawnItem("desert_eagle", Vector(-6525.375, 1652.219, -5501.844), Vector(1.626, 299.927, 87.803), 5);

//warehouse

SpawnItem("adrenaline", Vector(-11699.313, 1043.250, -4446.781), QAngle(273.164, 346.553, 14.546), 1);
//SpawnItem("molotov", Vector(-11697.625, 1021.281, -4442.625), QAngle(0.615, 310.957, 0.483), 1);
SpawnItem("rifle_desert", Vector(-11655.344, 999.844, -4446.656), QAngle(0.308, 103.184, 84.199), 5);
SpawnItem("hunting_rifle", Vector(-11626.000, 1002.000, -4446.906), QAngle(0.659, 99.448, 90.000), 5);
SpawnItem("rifle", Vector(-11632.031, 958.000, -4446.875), QAngle(359.121, 60.029, 82.969), 5);
SpawnItem("upgrade_laser_sight", Vector(-11790.906, 927.094, -4447.944), QAngle(0.000, 0.000, 0.000), 4);
SpawnItem("baseball_bat", Vector(-11871.500, 962.781, -4446.625), QAngle(329.238, 322.339, 270.791), 1);
SpawnItem("machete", Vector(-11816.219, 991.156, -4447.125), QAngle(359.473, 223.945, 90.396), 1);
SpawnItem("fireaxe", Vector(-11958.844, 879.500, -4446.813), QAngle(359.473, 336.973, 270.176), 1);
//SpawnItem("defibrillator", Vector(-11983.969, 888.031, -4447.594), QAngle(359.517, 360.000, 1.274), 1);
SpawnItem("adrenaline", Vector(-12001.969, 907.469, -4447.438), QAngle(356.836, 0.132, 359.033), 1);
SpawnItem("pipe_bomb", Vector(-11985.000, 914.438, -4446.281), QAngle(0.000, 0.000, 90.000), 1);
SpawnItem("fireaxe", Vector(-11937.906, 1012.219, -4446.688), QAngle(0.000, 349.365, 270.088), 1);
SpawnItem("ammo", Vector(-11987.563, 1045.656, -4447.438), QAngle(0.044, 241.436, 0.571), 1);
SpawnItem("pistol_magnum", Vector(-11991.969, 1096.000, -4447.188), QAngle(359.824, 299.795, 87.275), 5);

//pathway to saferoom
SpawnItem("pain_pills", Vector(-11332.594, 4256.000, -4478.094), QAngle(309.199, 19.424, 268.286), 1);

SpawnItem("shotgun_spas", Vector(-8601.125, 4294.031, -4446.531), QAngle(0.000, 285.820, 90.000), 4);
SpawnItem("crowbar", Vector(-8528.375, 4258.094, -4446.906), QAngle(359.736, 101.294, 87.847), 1);
SpawnItem("rifle_desert", Vector(-8584.000, 4316.500, -4446.563), QAngle(0.703, 38.979, 84.155), 4);
SpawnItem("propanetank", Vector(-8489.969, 4336.250, -4436.844), QAngle(0.396, 359.824, 0.483), -1);
SpawnItem("pipe_bomb", Vector(-7137.344, 5209.469, -4442.969), QAngle(1.011, 0.000, 359.604), 1);
SpawnItem("pain_pills", Vector(-7123.500, 5242.188, -4447.500), QAngle(1.230, 359.692, 3.911), 1);

//saferoom

SpawnItem("first_aid_kit", Vector(-4710.000, 5156.000, -4426.000), QAngle(0.000, 299.004, 180.000), 1);
SpawnItem("first_aid_kit", Vector(-4705.000, 5168.000, -4434.000), QAngle(0.000, 52.515, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4715.000, 5172.000, -4431.000), QAngle(90.000, 119.004, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4726.000, 5159.000, -4431.000), QAngle(90.000, 339.521, 0.000), 1);
SpawnItem("ammo", Vector(-4708.000, 5064.000, -4429.000), QAngle(0.000, 199.512, 0.000), 1);
SpawnItem("rifle_desert", Vector(-4720.000, 5086.000, -4427.844), QAngle(359.780, 31.904, 84.199), 4);
SpawnItem("shotgun_spas", Vector(-4722.000, 5105.000, -4427.625), QAngle(0.044, 36.475, 90.615), 4);

function moloback()
{
	SpawnItem("molotov", Vector(-6972.750, 1741.688, -5404.188), QAngle(16.479, 262.969, 250.884), 1);
	SpawnItem("molotov", Vector(-7809.688, -1145.750, -4765.813), QAngle(38.936, 150.161, 89.824), 1);
}

function defibback()
{
	SpawnItem("defibrillator", Vector(-11983.969, 888.031, -4447.594), QAngle(359.517, 360.000, 1.274), 1);
	SpawnItem("defibrillator", Vector(-6744.656, -751.625, -3223.563), QAngle(359.517, 270.220, 1.187), 1);
}

moloback();
defibback();

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	OpenSafeRoomDoor(); IncludeScript("scriptedhp");
	cvar("host_timescale", 1.00); RemoveItemWithin(Vector(-5402.531, 2085.031, -3134.469), 5);
	z1();
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"callvote changedifficulty Impossible\");", 3.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_voteall\");", 3.534);
	
	//10.1
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 4.000);
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 9.900);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 9.900);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 9.900);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"use weapon_grenade_launcher\");", 10.167);
	
	/*CreateTimer(10.167, function()
	{ 
		SendToServerConsole("setang_exact -10.0000 93.715385 0.000000");
	});*/

	//11.5 coach tp +6.1 = 17.6
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 17.400);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 17.400);
	
	CreateTimer(18.533, function()
	{ 
		Ent("!nick").GiveItem("defibrillator");
		RemoveItemByName("defibrillator");
		defibback();
		
		CreateTimer(0.033, function()
		{ 
			Ent("!nick").GiveItem("molotov");
			RemoveItemByName("molotov");
			moloback();
		});
	});
	
	//20.633
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 21.633);
	
	//21.767 roch
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 15.667);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 21.567);
	
	//33.9 for 2nd tp
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 33.700);
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"callvote changedifficulty Easy\");", 39.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_voteall\");", 39.017);
	
	//57.267  .3  58.5
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 52.400);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 52.400);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 52.400);
	
	//106.9
	CreateTimer(67.000, function()
	{ 
		::AutoKick(Ent(1), Ent("!nick"));
	});
	
	//113.700 // 73.700
	CreateTimer(73.700, function()
	{ 
		::AutoKick(Ent(3), Ent("!coach"));
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

function z1()
{
	SpawnCommon("common_male_fallen_survivor", Vector(-5475.000, 2213.772, -3294.258), QAngle(0.0, 275.445, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5250.000, 2293.724, -3277.586), QAngle(0.0, 302.285, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-5287.500, 2287.500, -3285.793), QAngle(0.0, 99.940, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-5272.386, 2350.000, -3271.231), QAngle(0.0, 327.043, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-5385.322, 2306.432, -3286.523), QAngle(0.0, 237.104, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5087.500, 2350.000, -3204.992), QAngle(0.0, 104.242, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5423.661, 2179.917, -3281.182), QAngle(0.0, 190.513, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5370.476, 2163.967, -3273.237), QAngle(0.0, 143.029, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-5788.793, 2228.217, -3331.067), QAngle(0.0, 273.770, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5869.708, 2236.701, -3328.973), QAngle(0.0, 344.492, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-5997.381, 2119.125, -3330.682), QAngle(0.0, 76.233, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6037.500, 2150.000, -3348.840), QAngle(0.0, 149.102, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6112.724, 2350.000, -3307.907), QAngle(0.0, 253.942, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6087.500, 2225.000, -3360.172), QAngle(0.0, 270.838, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6100.000, 2172.852, -3365.358), QAngle(0.0, 195.387, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6137.500, 2137.500, -3363.555), QAngle(0.0, 101.135, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6184.861, 2100.000, -3368.715), QAngle(0.0, 308.574, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6212.500, 2050.000, -3343.546), QAngle(0.0, 38.593, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6271.959, 2149.722, -3379.150), QAngle(0.0, 359.038, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6321.303, 2300.000, -3348.492), QAngle(0.0, 214.047, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6314.429, 2300.000, -3347.913), QAngle(0.0, 113.012, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6314.485, 2224.767, -3367.162), QAngle(0.0, 331.314, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6362.500, 2287.500, -3354.104), QAngle(0.0, 201.942, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6362.500, 2287.500, -3354.104), QAngle(0.0, 198.139, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6387.500, 2175.000, -3381.557), QAngle(0.0, 8.126, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6350.000, 1970.807, -3347.222), QAngle(0.0, 224.556, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-6412.500, 2250.000, -3362.068), QAngle(0.0, 243.857, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6400.000, 1956.618, -3352.458), QAngle(0.0, 148.509, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6491.385, 1994.776, -3369.118), QAngle(0.0, 114.520, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-6491.794, 1995.171, -3369.227), QAngle(0.0, 290.371, 0.0));
}