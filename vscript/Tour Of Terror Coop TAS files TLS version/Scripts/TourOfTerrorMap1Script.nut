// Squirrel language

/* 
[TAS Kit]
Author: Sw1ft
Version: 1.3.1
Scripted By: DXSamXD
Addons required: TAS Kit
Campaign: Tour of Terror
Map: eu01_residential_b16
*/

/*
Time: 33.167 
*/

SetClientName(Ent("!nick"), "court");
SetClientName(Ent("!rochelle"), "instagib");
SetClientName(Ent("!ellis"), "Qwerty");
SetClientName(Ent("!coach"), "(っ◔◡◔)っDXSamXD");

SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

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



Survivors["nick"] <- // make sure that the character name is in lowercase
{
	health = 100
	origin = Vector(2243.000, -2439.170, 728.031)
	angles = QAngle(0.000, -56.003, 0.000)

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
		cvar("st_mr_force_file", "tot1_nick");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["coach"] <-
{
	health = 100
	origin = Vector(2295.800, -2412.670, 728.031)
	angles = QAngle(0.000, -89.500, 0.000)

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
		cvar("st_mr_force_file", "tot1_coach");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <-
{
	health = 100
	origin = Vector(2371.620, -2469.460, 728.031)
	angles = QAngle(0.000, -121.503, 0.000)

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
		cvar("st_mr_force_file", "tot1_ellis");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 100
	origin = Vector(2400.000, -2512.210, 728.031)
	angles = QAngle(0.0000, -85.876732, 0.000000)

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
		cvar("st_mr_force_file", "tot1_rochelle");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

//Triggers

SpawnTrigger("trigger_area1", Vector(1882.240, -2869.560, 732.031));

SpawnTrigger("trigger_area2", Vector(787.468, 1372.544, -396.728));

SpawnTrigger("trigger_area3", Vector(-133.273, 2722.295, -439.969));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{
			z1();
			z1_2();
		}
		else if (sName == "trigger_area2")
		{
			z2();
			caller.Kill();
		}
		else if (sName == "trigger_area3")
		{
			z2_2();
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
		else if (sName == "trigger_area10")
		{
			
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 1.00);
	
	//kick ellis 21.500
	CreateTimer(21.900, function()
	{ 
		::AutoKick(Ent(4), Ent("!ellis")); //Make sure Ellis Ent is himself
	});
		
	
	//29.300
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 29.000);
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

//Weapon Spawn
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("pain_pills"); RemoveItemByName("defibrillator"); RemoveItemByName("first_aid_kit"); 
RemoveItemByName("vomitjar"); 

SpawnItem("first_aid_kit", Vector(2250.000, -2574.000, 770.750), QAngle(0.000, 104.985, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2237.000, -2583.000, 770.969), QAngle(0.000, 66.973, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2235.125, -2569.000, 773.250), QAngle(87.012, 180.000, 120.015), 1);
SpawnItem("first_aid_kit", Vector(2234.000, -2554.000, 773.250), QAngle(89.473, 0.000, 255.015), 1);

SpawnItem("molotov", Vector(2061.000, -2397.000, 757.000), QAngle(0.000, 27.993, 0.000), 1);
SpawnItem("pipe_bomb", Vector(2064.000, -2413.000, 753.000), QAngle(270.000, 336.006, 0.000), 1);
SpawnItem("pistol", Vector(2530.000, -2411.000, 773.000), QAngle(1.934, 68.027, 90.527), 5);
SpawnItem("fireaxe", Vector(2360.000, -2554.000, 770.000), QAngle(0.000, 13.975, 90.000), 1);
SpawnItem("fireaxe", Vector(2334.000, -2555.000, 772.000), QAngle(0.000, 336.973, 90.000), 1);
SpawnItem("golfclub", Vector(2299.000, -2577.000, 772.000), QAngle(0.000, 169.980, 90.000), 1);
SpawnItem("crowbar", Vector(2267.000, -2558.000, 772.000), QAngle(0.000, 11.514, 90.000), 1);
SpawnItem("molotov", Vector(2982.000, -3200.000, 777.000), QAngle(0.000, 91.494, 0.000), 1);
SpawnItem("propanetank", Vector(2952.875, -3359.781, 727.500), QAngle(83.408, 80.244, 92.417), -1);
SpawnItem("pain_pills", Vector(2990.000, -3323.000, 762.000), QAngle(0.000, 270.000, 0.000), 1);
SpawnItem("adrenaline", Vector(698.000, -3080.000, 728.031), QAngle(313.506, 325.986, 0.000), 1);

SpawnItem("pain_pills", Vector(504.000, 1424.000, -425.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("molotov", Vector(-543.938, 449.188, -437.844), QAngle(320.493, 224.868, 270.176), 1);
SpawnItem("first_aid_kit", Vector(1597.000, 2633.000, -422.000), QAngle(337.720, 81.738, 102.920), 1);
SpawnItem("pistol", Vector(100.000, 3100.000, -384.000), QAngle(1.934, 118.521, 90.527), 5);

//saferoom
SpawnItem("pumpshotgun", Vector(-258.688, 3838.906, -407.219), QAngle(0.000, 344.487, 266.001), 5);
SpawnItem("smg", Vector(-206.844, 3843.094, -407.500), QAngle(0.000, 258.486, 83.013), 5);
SpawnItem("first_aid_kit", Vector(-13.844, 3693.000, -404.125), QAngle(0.000, 2.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-28.750, 3692.250, -401.594), QAngle(90.000, 318.516, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-34.031, 3674.125, -401.594), QAngle(90.000, 39.990, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-17.188, 3677.844, -404.125), QAngle(0.000, 129.507, 0.000), 1);
SpawnItem("ammo", Vector(-22.063, 3720.688, -404.094), QAngle(0.000, 355.518, 0.000), 1);

//============Custom Function=================//
function z1()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(600.000, -2800.000, 738.031), QAngle(0.0, 213.535, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(559.941, -2633.854, 738.031), QAngle(0.0, 155.697, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(656.788, -3061.035, 738.031), QAngle(0.0, 191.697, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(425.000, -2937.500, 738.031), QAngle(0.0, 163.502, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(775.000, -3162.500, 578.031), QAngle(0.0, 28.035, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 132.475, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 271.247, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 185.329, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(675.000, -3162.500, 578.031), QAngle(0.0, 286.299, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(637.500, -3312.500, 494.031), QAngle(0.0, 70.508, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(774.306, -2808.985, 578.031), QAngle(0.0, 82.454, 0.0));
}

function z1_2()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(600.000, -2800.000, 738.031), QAngle(0.0, 213.535, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(113.537, -2898.149, -61.969), QAngle(0.0, 272.181, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(187.500, -3012.500, -161.969), QAngle(0.0, 259.790, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(187.500, -3012.500, -161.969), QAngle(0.0, 168.419, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(262.500, -3012.500, -161.969), QAngle(0.0, 263.114, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(0.000, -2787.500, 578.031), QAngle(0.0, 208.714, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(87.866, -2855.027, 578.031), QAngle(0.0, 176.880, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(357.027, -2880.481, -221.969), QAngle(0.0, 250.400, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(674.910, -3047.299, 738.031), QAngle(0.0, 212.505, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(775.000, -3162.500, 578.031), QAngle(0.0, 245.660, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 294.371, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 216.339, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(850.000, -3287.500, 646.031), QAngle(0.0, 26.040, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(675.000, -3162.500, 578.031), QAngle(0.0, 142.447, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(637.500, -3312.500, 494.031), QAngle(0.0, 129.807, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(711.160, -2883.516, 578.031), QAngle(0.0, 104.810, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(825.000, -2800.000, 578.031), QAngle(0.0, 359.699, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(826.200, -3348.169, 490.031), QAngle(0.0, 68.734, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(819.623, -3223.228, 448.897), QAngle(0.0, 324.797, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(848.878, -3150.000, 418.031), QAngle(0.0, 36.653, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(830.498, -3052.198, 418.031), QAngle(0.0, 3.469, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(704.931, -3071.147, 418.031), QAngle(0.0, 192.980, 0.0));
}

function z2()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(487.862, -2759.938, 738.031), QAngle(0.0, 245.346, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1546.779, 1394.378, -429.969), QAngle(0.0, 217.609, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(912.500, 812.500, -423.060), QAngle(0.0, 182.504, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(275.000, 2560.213, -429.969), QAngle(0.0, 128.798, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1342.761, 2625.000, -429.969), QAngle(0.0, 261.733, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(1330.639, 2625.000, -429.969), QAngle(0.0, 275.327, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(1400.000, 2525.000, -437.969), QAngle(0.0, 313.916, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1312.500, 2587.500, -429.969), QAngle(0.0, 37.837, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1514.306, 2032.245, 242.031), QAngle(0.0, 213.666, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(339.996, 1287.500, -409.833), QAngle(0.0, 158.545, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(775.000, 1612.500, -430.969), QAngle(0.0, 266.319, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(912.500, 512.500, -433.969), QAngle(0.0, 113.395, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(768.750, 1793.750, -414.690), QAngle(0.0, 99.573, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(737.500, 1787.500, -423.197), QAngle(0.0, 182.778, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(781.250, 1806.250, -414.181), QAngle(0.0, 229.161, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(837.500, 512.500, -433.969), QAngle(0.0, 69.283, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(837.500, 512.500, -433.969), QAngle(0.0, 41.986, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1000.000, 400.000, -429.969), QAngle(0.0, 310.445, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1437.500, 1687.500, -433.969), QAngle(0.0, 41.776, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(862.500, 1987.500, -437.969), QAngle(0.0, 177.513, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(862.500, 1987.500, -437.969), QAngle(0.0, 44.072, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1087.500, 337.500, -433.969), QAngle(0.0, 200.246, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1475.000, 1784.172, -429.969), QAngle(0.0, 92.742, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1475.000, 1784.842, -429.969), QAngle(0.0, 232.833, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1332.373, 470.647, -437.969), QAngle(0.0, 35.398, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1437.500, 1887.500, -433.969), QAngle(0.0, 221.880, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1196.557, 469.428, -435.905), QAngle(0.0, 154.428, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1287.500, 1812.500, -437.969), QAngle(0.0, 348.142, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1437.500, 1950.000, -433.969), QAngle(0.0, 264.456, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1437.500, 450.000, -433.969), QAngle(0.0, 358.121, 0.0));
}

function z2_2()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(-537.500, 3225.000, -429.969), QAngle(0.000, 337.406, 0.000));
	SpawnCommon("common_female_tshirt_skirt", Vector(-450.000, 3212.500, -429.969), QAngle(0.000, 242.836, 0.000));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-385.143, 3501.349, -429.969), QAngle(0.000, 64.318, 0.000));
	
	SpawnCommon("charger", Vector(212.500, 2000.000, -429.969), QAngle(0.000, 249.074, 0.000));
	CreateTimer(0.200, function()
	{ 
		SpawnCommon("spitter", Vector(175.000, 1912.312, -432.476), QAngle(0.000, 263.371, 0.000));
	});
}


//Don't mind me!//
function startrecording()
{
	SendToServerConsole("st_mr_record 1");
	sayf("Recording movement...");
}

function stoprecording()
{
	SendToServerConsole("st_mr_stop 1");
	sayf("Recording stopped...");
}

function splitrecording()
{
	SendToServerConsole("st_mr_split 1");
	sayf("Splitting...");
}