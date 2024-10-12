// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined
EnableAutoBileBreaker();

//WE DON'T GO TO RAVENHOLM MAP 1

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!nick"), "instagib");
SetClientName(Ent("!rochelle"), "(っ◔◡◔)っDXSamXD");
SetClientName(Ent("!ellis"), "kisetsu");
SetClientName(Ent("!coach"), "ICHNA");

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
	origin = Vector(4350.000, -2371.090, -3775.969)// position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 123.997, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		Convars.SetValue("st_mr_force_file", "ravenholm1_coach");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 100
	origin = Vector(4349.480, -2328.010, -3775.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 127.996, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	
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
		Convars.SetValue("st_mr_force_file", "ravenholm1_ellis");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 100
	origin = Vector(4316.000, -2406.840, -3775.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 92.999, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	
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
		Convars.SetValue("st_mr_force_file", "ravenholm1_nick");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 100
	origin = Vector(4279.660, -2368.320, -3775.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 71.999, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	
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
		Convars.SetValue("st_mr_force_file", "ravenholm1_rochelle");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

//triggers

SpawnTrigger("trigger_area1", Vector(3933.625, -1151.839, -3823.969));
SpawnTrigger("trigger_area2", Vector(3162.776, -1595.238, -3783.969));
SpawnTrigger("trigger_area3", Vector(1356.181, -141.114, -2947.969));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{
			//ci2
			SpawnCommon("common_male_tankTop_jeans", Vector(3723.979, -1250.000, -3813.969), QAngle(0.0, 105.817, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(3777.891, -1250.000, -3813.969), QAngle(0.0, 332.967, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(3818.918, -1250.000, -3813.969), QAngle(0.0, 307.372, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(3771.027, -1374.676, -3813.969), QAngle(0.0, 266.551, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(3562.500, -1400.000, -3813.969), QAngle(0.0, 354.935, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(3300.000, -1421.897, -3797.969), QAngle(0.0, 191.649, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2987.500, -1762.500, -3773.969), QAngle(0.0, 238.547, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(2996.191, -1381.047, -3773.969), QAngle(0.0, 244.134, 0.0));
			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{
			//ci3
			SpawnCommon("common_male_tankTop_jeans", Vector(2549.239, -1211.344, -3765.969), QAngle(0.0, 11.566, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(2548.714, -1252.657, -3765.969), QAngle(0.0, 126.982, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(2550.000, -1040.422, -3799.969), QAngle(0.0, 86.163, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(2550.000, -1057.118, -3791.969), QAngle(0.0, 355.722, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(2725.000, -1428.716, -3829.969), QAngle(0.0, 36.839, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(2987.500, -1762.500, -3773.969), QAngle(0.0, 187.306, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(2997.009, -1378.677, -3773.969), QAngle(0.0, 343.430, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2581.689, -940.671, -3829.969), QAngle(0.0, 236.688, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2663.137, -1428.625, -3829.969), QAngle(0.0, 242.632, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2669.207, -1476.968, -3829.969), QAngle(0.0, 183.573, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2600.000, -1375.000, -3829.969), QAngle(0.0, 177.840, 0.0));
			SpawnCommon("common_male_ceda", Vector(2600.000, -1375.000, -3829.969), QAngle(0.0, 29.151, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(2892.821, -1481.162, -3829.969), QAngle(0.0, 274.009, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(2888.407, -1478.444, -3829.969), QAngle(0.0, 37.780, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(2879.664, -1491.253, -3829.969), QAngle(0.0, 18.744, 0.0));
			caller.Kill();
		}
		else if (sName == "trigger_area3")
		{
			//ci3
			CreateTimer(0.8, function()
			{ 
			SpawnCommon("common_female_tankTop_jeans", Vector(1137.122, 47.152, -3637.969), QAngle(0.0, 331.577, 0.0));
			SpawnCommon("common_male_ceda", Vector(1137.127, -19.083, -3637.969), QAngle(0.0, 71.831, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(1087.500, -37.500, -3640.721), QAngle(0.0, 203.975, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(1129.126, 125.000, -3637.969), QAngle(0.0, 209.936, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1141.713, 125.000, -3637.969), QAngle(0.0, 210.889, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(1187.500, 187.500, -3637.969), QAngle(0.0, 134.363, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1087.500, -62.500, -3642.110), QAngle(0.0, 190.327, 0.0));
			SpawnCommon("common_female_tshirt_skirt", Vector(1187.500, 212.500, -3637.969), QAngle(0.0, 290.471, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(1162.500, 200.000, -3637.969), QAngle(0.0, 89.304, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(1125.000, 162.500, -3637.969), QAngle(0.0, 129.573, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1212.500, 275.000, -3637.969), QAngle(0.0, 350.268, 0.0));
			SpawnCommon("common_female_tankTop_jeans", Vector(1212.500, 275.000, -3637.969), QAngle(0.0, 345.042, 0.0));
			SpawnCommon("common_male_tankTop_jeans", Vector(1350.000, 300.000, -3637.969), QAngle(0.0, 145.383, 0.0));
			SpawnCommon("common_male_tshirt_cargos", Vector(1350.000, 300.000, -3637.969), QAngle(0.0, 330.910, 0.0));
			SpawnCommon("common_male_dressShirt_jeans", Vector(1287.500, 350.000, -3637.969), QAngle(0.0, 91.315, 0.0));
			});
			
			caller.Kill();
		}
		else if (sName == "trigger_area4")
		{
			
		}
		else if (sName == "trigger_area5")
		{
			
		}
		else if (sName == "trigger_area6")
		{
			
		}
		else if (sName == "trigger_area7")
		{
			
		}
		else if (sName == "trigger_area8")
		{
			
		}
		else if (sName == "trigger_area9")
		{
			
		}
	}
}

//items spawns

SpawnItem("ammo_l4d", Vector(3864.000, -984.000, -3784.000), QAngle(0.000, 29.487, 0.000), 1, 500);
SpawnItem("pumpshotgun", Vector(3872.000, -1023.000, -3782.656), QAngle(0.088, 231.504, 89.473), 4);
SpawnItem("smg", Vector(3871.938, -1054.906, -3782.531), QAngle(357.935, 244.116, 84.858), 4);
SpawnItem("crowbar", Vector(3676.000, -991.063, -3782.844), QAngle(359.253, 270.132, 88.066), 1);
SpawnItem("first_aid_kit", Vector(3892.000, -988.000, -3784.000), QAngle(0.000, 162.993, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3902.000, -988.000, -3784.000), QAngle(0.000, 162.993, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3914.000, -988.000, -3784.000), QAngle(0.000, 162.993, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3924.000, -988.000, -3784.000), QAngle(0.000, 162.993, 0.000), 1);

SpawnItem("gascan", Vector(3090.156, -1572.063, -3773.125), QAngle(0.923, 345.059, 359.956), -1, 500);
SpawnItem("oxygentank", Vector(3203.750, -1770.625, -3779.313), QAngle(304.629, 19.775, 90.000), -1);
SpawnItem("propanetank", Vector(4190.031, -1008.063, -3828.750), QAngle(0.220, 359.868, 0.220), -1, 200);
SpawnItem("gascan", Vector(2565.938, -1635.313, -3832.344), QAngle(359.385, 348.047, 90.220), -1, 200);

SpawnItem("ammo", Vector(1041.969, 128.031, -3647.438), QAngle(0.044, 21.753, 359.736), 1, 500);
SpawnItem("smg_silenced", Vector(1018.938, 129.969, -3646.250), QAngle(0.000, 117.686, 90.923), 4);
SpawnItem("shotgun_chrome", Vector(1016.000, 112.000, -3646.719), QAngle(0.044, 161.455, 90.747), 4);
SpawnItem("pistol", Vector(1051.531, 102.313, -3646.875), QAngle(360.000, 239.502, 90.000), 5);

SpawnItem("adrenaline", Vector(928.000, -864.000, -3711.510), QAngle(0.000, 0.000, 0.000), 1, 500);
SpawnItem("adrenaline", Vector(950.219, -848.406, -3711.510), QAngle(0.000, 0.000, 0.000), 1);

//safehouse
SpawnItem("pumpshotgun", Vector(158.875, 339.031, -3286.688), QAngle(359.341, 250.049, 92.637), 4, 500);
SpawnItem("first_aid_kit", Vector(156.906, 293.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 299.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 305.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("first_aid_kit", Vector(156.906, 311.000, -3288.000), QAngle(0.000, 250.005, 0.000), 1);
SpawnItem("smg", Vector(164.125, 372.938, -3286.500), QAngle(358.154, 232.954, 84.946), 5);
SpawnItem("ammo", Vector(151.906, 442.000, -3292.000), QAngle(0.000, 0.000, 0.000), 1);


function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 1.0); ci1();
	
	//17.7 tp on time
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 17.500);
	CreateTimer(17.500, function()
	{ 
		::AutoKick(Ent(2), Ent("!nick")); //nick should be 2
		
		CreateTimer(5.000, function()
		{ 
		SendToServerConsole("kick instagib; sm_fake");
		
			CreateTimer(0.017, function()
			{ 
				SetClientName(Ent(2), "instagib");
			});
			
		});
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

function ci1()
{
		CreateTimer(0.000, function()
	{ 
		SpawnCommon("common_female_tankTop_jeans", Vector(3987.500, -1162.500, -3813.969), QAngle(0.0, 194.270, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(3962.500, -1137.500, -3813.969), QAngle(0.0, 107.444, 0.0));
		SendToServerConsole("sv_infected_ceda_vomitjar_probability 10000");
	});
	
		CreateTimer(2.300, function()
	{ 
		SpawnCommon("common_male_tankTop_jeans", Vector(3812.500, -1012.500, -3813.969), QAngle(0.0, 345.384, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(3812.500, -1012.500, -3813.969), QAngle(0.0, 12.810, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(3755.499, -1075.744, -3813.969), QAngle(0.0, 151.356, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(3708.296, -1147.795, -3813.969), QAngle(0.0, 89.822, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(3756.720, -1137.611, -3813.969), QAngle(0.0, 179.391, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(3612.500, -1125.000, -3813.969), QAngle(0.0, 241.525, 0.0));
		SpawnCommon("common_male_ceda", Vector(3612.500, -1175.000, -3813.969), QAngle(0.0, 51.655, 0.0));
		SendToServerConsole("sv_infected_ceda_vomitjar_probability 0.1");
		SpawnCommon("common_male_dressShirt_jeans", Vector(3612.500, -1175.000, -3813.969), QAngle(0.0, 335.889, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(3612.500, -1175.000, -3813.969), QAngle(0.0, 177.668, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(3587.500, -1250.000, -3813.969), QAngle(0.0, 202.606, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(3587.500, -1250.000, -3813.969), QAngle(0.0, 353.111, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(3803.938, -1250.000, -3813.969), QAngle(0.0, 235.313, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(3817.174, -1352.103, -3813.969), QAngle(0.0, 211.566, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(3962.500, -1137.500, -3813.969), QAngle(0.0, 182.320, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(3746.620, -1140.318, -3813.969), QAngle(0.0, 107.259, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(3812.500, -1075.000, -3813.969), QAngle(0.0, 141.090, 0.0));
	});

}