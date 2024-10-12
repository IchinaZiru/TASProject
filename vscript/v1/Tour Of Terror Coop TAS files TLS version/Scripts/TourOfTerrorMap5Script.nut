// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(104.633); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

/* 
[TAS Kit]
Author: Sw1ft
Version: 1.3.1
Scripted By: Star, Sw1ft, DXSamXD
Addons required: TAS Kit
Campaign: Tour of Terror
Map: eu05_train_b16
*/

Say(null, "Type !practice or !help in chat for practice", false);

DisableAutoClimb();

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
	host_timescale = 0.5

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
	
	st_fastreload = 0
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	health = 50
	origin = Vector(-729.811, -2167.049, 72.031)
	angles = QAngle(0.00000, -83.980240, 0.000000)

	Inventory =
	{
		active_slot = "slot0"
		
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 66
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
		OpenSafeRoomDoor();
		cvar("st_mr_force_file", "tot5_coach");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 89
	origin = Vector(-994.746, -2179.613, 72.031)
	angles = QAngle(286.177, 219.013, 0.000) 

	Inventory =
	{
		active_slot = "slot0"
		
		slot0 = // primary weapon
		{
			weapon = "shotgun_spas"
			clip = 10
			ammo = 82
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 14
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		cvar("st_mr_force_file", "tot5_ellis");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 50
	origin = Vector(-894.499634, -2223.842041, 72.031250)
	angles = QAngle(0.000000, -17.677004, 0.000000) 
	
	Inventory =
	{
		active_slot = "slot1"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 12
		}
		
		slot2 = "molotov"
	}
	
	Actions = function(hPlayer)
	{
		// do some stuff here
		cvar("st_mr_force_file", "tot5_nick");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 100
	origin = Vector(-827.007, -2140.048, 72.031)
	angles = QAngle(3.340, 78.128, 0.000)
	
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
		cvar("st_mr_force_file", "tot5_rochelle");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

SpawnTrigger("trigger_area1", Vector(-1605.986, 17.091, -49.449));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{
			SendToConsole("director_start");
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area3")
		{
			
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
	cvar("host_timescale", 0.5); 
	
	CreateTimer(2.1, function()
	{ 
		z1();
		
		CreateTimer(0.8, function()
		{ 
			cvar("st_fastreload", "1");
			z2();
		});	
	});
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{
	FinaleScript();
	FinaleManager.Settings.Enabled = true;
	FinaleManager.OnBeginCustomStage(1, 0);
	govnoRNGKiller();
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
		CreateTimer(0.000, function()
		{ 
			SendToServerConsole("host_timescale 0.25");
			SayMsg("Slowing down timescale to 0.25");
		});

		CreateTimer(4.00, function()
		{ 
			SayMsg("Turning timescale back to 0.5");
			SendToServerConsole("host_timescale 0.5");
		});
	}
	else if (iType == DELAY)
	{

	}
}

function ScriptedWeaponSpawns()
{
	local ent;
	while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_pain_pills_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_adrenaline_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_first_aid_kit_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_item_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_ammo_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_upgradepack_spawn")) ent.Kill();

	RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
	RemoveItemByName("oxygentank"); RemoveItemByName("defibrillator"); RemoveItemByName("vomitjar"); RemoveItemByName("pistol_magnum");
	RemoveItemByName("chainsaw");

	//Weapon Spawns

	SpawnItem("rifle", Vector(-813.000, -2211.000, 103.000), QAngle(0.000, 313.989, 83.979), 5);
	SpawnItem("rifle_desert", Vector(-843.000, -2214.000, 102.625), QAngle(0.000, 345.015, 87.495), 5);
	SpawnItem("autoshotgun", Vector(-863.000, -2227.000, 102.594), QAngle(0.000, 4.482, 82.002), 5);
	SpawnItem("first_aid_kit", Vector(-834.000, -2061.000, 115.000), QAngle(90.000, 80.991, 0.000), 1);
	SpawnItem("first_aid_kit", Vector(-835.000, -2071.000, 115.000), QAngle(90.000, 199.512, 0.000), 1);
	SpawnItem("first_aid_kit", Vector(-767.000, -2052.000, 118.000), QAngle(9.492, 90.000, 270.000), 1);
	SpawnItem("first_aid_kit", Vector(-773.000, -2063.000, 115.000), QAngle(90.000, 177.495, 0.000), 1);
	SpawnItem("hunting_rifle", Vector(-886.000, -2050.000, 80.000), QAngle(272.988, 90.000, 90.000), 5);
	SpawnItem("ammo", Vector(-742.000, -2062.000, 119.000), QAngle(0.000, 90.000, 0.000), 1);


	SpawnItem("pipe_bomb", Vector(-822.000, -2444.000, 74.000), QAngle(90.000, 336.973, 0.000), 1);
	SpawnItem("propanetank", Vector(-408.000, -2432.000, 84.000), QAngle(0.212, 300.162, 0.457), -1);
	SpawnItem("molotov", Vector(-308.000, -2214.000, 273.000), QAngle(0.000, 0.000, 0.000), 1);
	SpawnItem("pistol_magnum", Vector(-287.000, -2185.000, 269.000), QAngle(0.000, 185.010, 90.000), 5);
	SpawnItem("oxygentank", Vector(-274.969, -2074.844, 245.281), QAngle(89.297, 196.875, 266.484), -1);
	SpawnItem("oxygentank", Vector(-379.938, -2216.844, 245.281), QAngle(88.198, 196.875, 266.484), -1);
	SpawnItem("pipe_bomb", Vector(-582.000, -2172.000, 245.000), QAngle(0.000, 69.521, 90.000), 1);
	SpawnItem("adrenaline", Vector(-1035.000, -2197.000, 244.000), QAngle(0.000, 153.018, 0.000), 1);
	SpawnItem("molotov", Vector(-1033.000, -2211.000, 249.000), QAngle(0.000, 192.480, 0.000), 1);
	SpawnItem("gascan", Vector(-1050.000, -2258.000, 255.000), QAngle(-18.603, 0.028, 0.347), -1);
	SpawnItem("pain_pills", Vector(-897.906, -1989.969, 73.969), QAngle(86.616, 189.272, 259.014), 1);
	SpawnItem("adrenaline", Vector(-679.000, -1971.000, 72.000), QAngle(0.000, 37.485, 0.000), 1);

	SpawnItem("molotov", Vector(-677.000, -64.000, 69.000), QAngle(0.000, 192.480, 0.000), 1);
	SpawnItem("cricket_bat", Vector(-693.969, -48.281, 105.469), QAngle(15.293, 291.094, 92.549), 1);
	SpawnItem("oxygentank", Vector(-925.156, -92.906, 65.281), QAngle(88.330, 276.855, 266.484), -1);

	SpawnItem("gascan", Vector(-1390.000, -777.531, -100.406), QAngle(90.000, 134.736, 180.000), -1);
	SpawnItem("cricket_bat", Vector(-1487.875, -789.969, -55.688), QAngle(335.522, 81.519, 127.266), 1);
	SpawnItem("pain_pills", Vector(-1921.000, -610.000, -52.000), QAngle(0.000, 100.020, 0.000), 1);
	SpawnItem("pistol_magnum", Vector(-2293.969, -519.000, -67.156), QAngle(359.824, 258.838, 87.188), 4);
	SpawnItem("pistol_magnum", Vector(-2269.000, -527.969, -67.188), QAngle(0.176, 150.996, 273.384), 4);
	SpawnItem("pistol_magnum", Vector(-2305.000, -535.969, -67.063), QAngle(359.868, 15.820, 87.188), 4);
	SpawnItem("gascan", Vector(-2437.844, -420.688, -100.406), QAngle(89.912, 197.930, 180.000), -1);
	SpawnItem("molotov", Vector(-2273.000, -95.000, -60.000), QAngle(0.000, 113.994, 0.000), 1);
	SpawnItem("adrenaline", Vector(-2265.000, -85.000, -65.000), QAngle(0.000, 313.989, 0.000), 1);
	SpawnItem("frying_pan", Vector(-2127.781, -120.125, -84.125), QAngle(2.461, 270.439, 264.946), 1);
	SpawnItem("molotov", Vector(-1068.688, 82.094, -60.000), QAngle(0.000, 58.491, 0.000), 1);

	SpawnItem("gascan", Vector(-1392.813, -7.719, -388.406), QAngle(90.000, 197.842, 180.000), -1);
	SpawnItem("oxygentank", Vector(-1341.094, -785.875, -390.719), QAngle(88.945, 281.865, 266.484), -1);
	SpawnItem("adrenaline", Vector(-1387.000, -799.000, -352.000), QAngle(0.000, 29.004, 0.000), 1);
	SpawnItem("pain_pills", Vector(-1400.000, -780.000, -349.969), QAngle(89.956, 110.566, 180.000), 1);
	SpawnItem("molotov", Vector(-1459.000, -787.000, -387.000), QAngle(0.000, 244.512, 0.000), 1);
	SpawnItem("molotov", Vector(-2305.000, -812.000, -349.000), QAngle(0.000, 246.006, 0.000), 1);
	SpawnItem("fireaxe", Vector(-2324.000, -770.031, -390.688), QAngle(359.956, 102.524, 90.132), 1);
	SpawnItem("crowbar", Vector(-2438.000, -779.938, -390.875), QAngle(359.033, 78.047, 88.022), 1);
	SpawnItem("propanetank", Vector(-2738.125, -415.281, -392.500), QAngle(83.320, 104.985, 92.153), -1);
	SpawnItem("gascan", Vector(-2415.438, -454.469, -385.844), QAngle(76.113, 313.682, 298.213), -1);
	SpawnItem("pain_pills", Vector(-2204.000, -72.000, -353.000), QAngle(0.000, 198.018, 0.000), 1);
	SpawnItem("oxygentank", Vector(-2125.125, 6.094, -390.688), QAngle(87.363, 296.851, 266.484), -1);

	SpawnItem("gascan", Vector(-1889.813, -211.719, -388.406), QAngle(89.956, 197.886, 180.000), -1);
	SpawnItem("defibrillator", Vector(-1825.000, -196.000, -353.000), QAngle(0.000, 270.483, 0.000), 1);
	SpawnItem("first_aid_kit", Vector(-1820.438, -202.563, -348.219), QAngle(29.487, 76.992, 270.000), 1);
	SpawnItem("first_aid_kit", Vector(-1833.875, -202.000, -353.625), QAngle(14.985, 42.495, 0.000), 1);
	SpawnItem("first_aid_kit", Vector(-1839.594, -209.031, -350.313), QAngle(63.193, 34.189, 299.531), 1);

	SpawnItem("molotov", Vector(-2956.000, -47.000, -349.000), QAngle(0.000, 192.480, 0.000), 1);
	SpawnItem("pain_pills", Vector(-2945.000, -40.000, -353.000), QAngle(0.000, 277.515, 0.000), 1);

	SpawnItem("gascan", Vector(-2438.531, 348.563, -438.125), QAngle(87.539, 342.817, 331.919), -1);

	//SpawnBarrel(Vector(-1703.125, 488.594, -449.406), QAngle(284.766, 286.875, 254.092));

	SpawnItem("autoshotgun", Vector(-2347.313, -474.938, -383.688), QAngle(283.008, 266.484, 180.000), 5);
	SpawnItem("rifle_ak47", Vector(-2356.000, -490.906, -351.469), QAngle(2.285, 183.076, 274.351), 5);
	SpawnItem("pistol", Vector(-2362.094, -474.656, -352.781), QAngle(0.000, 288.984, 90.000), 4);
	SpawnItem("sniper_military", Vector(-2367.500, -472.000, -351.500), QAngle(358.813, 219.727, 94.746), 5);
	SpawnItem("ammo", Vector(-2341.031, -524.344, -353.719), QAngle(0.000, 128.496, 0.000), 1);
}

CreateTimer(0.1, function()
{ 
	ScriptedWeaponSpawns();
	sayf("Loaded...");
});


//===============Custom Functions================//

function z1()
{
	SpawnCommon("common_male_ceda", Vector(-770.736, -1647.973, 74.031), QAngle(0.0, 39.105, 0.0));
	//SpawnCommon("common_male_tshirt_cargos", Vector(708.272, -1575.486, -13.233), QAngle(0.0, 190.293, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-1300.000, -1212.500, -465.310), QAngle(0.0, 61.548, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-395.737, -937.551, -427.111), QAngle(0.0, 220.167, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-416.698, -1654.530, -8.517), QAngle(0.0, 61.077, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-1162.500, -1712.500, 74.866), QAngle(0.0, 102.207, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1162.500, -2000.000, 78.031), QAngle(0.0, 143.256, 0.0));
	SpawnCommon("common_male_ceda", Vector(-1225.000, -1502.191, -35.436), QAngle(0.0, 92.431, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-601.445, -1016.890, 74.031), QAngle(0.0, 87.029, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-1350.131, -1400.000, -73.115), QAngle(0.0, 284.709, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-1387.500, -1437.500, -54.211), QAngle(0.0, 91.670, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-780.606, -1020.318, 74.031), QAngle(0.0, 287.717, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(431.187, -1579.769, -33.059), QAngle(0.0, 210.466, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1162.500, -2450.000, 78.031), QAngle(0.0, 123.804, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-1662.500, -1462.500, -63.121), QAngle(0.0, 214.335, 0.0));
	SpawnCommon("common_male_riot", Vector(-95.159, -1150.000, -461.354), QAngle(0.0, 357.855, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-864.031, -1545.157, 76.031), QAngle(0.000, 294.225, 0.000));
}

function z2()
{
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2275.000, 41.745, -93.969), QAngle(0.0, 277.657, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2287.500, -12.500, -93.969), QAngle(0.0, 191.088, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-2275.000, 40.187, -93.969), QAngle(0.0, 18.167, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2287.500, -12.500, -93.969), QAngle(0.0, 32.094, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-620.004, 511.078, 74.031), QAngle(0.0, 250.055, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-1762.500, -487.500, -376.398), QAngle(0.0, 223.144, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(136.579, -486.293, -482.853), QAngle(0.0, 49.121, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2450.000, -787.500, -381.969), QAngle(0.0, 332.709, 0.0));
	SpawnCommon("common_male_ceda", Vector(-1662.500, -350.000, -257.969), QAngle(0.0, 110.432, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1375.253, 121.917, -381.969), QAngle(0.0, 19.971, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2137.500, -262.500, -91.224), QAngle(0.0, 359.662, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2200.000, -112.500, -381.969), QAngle(0.0, 73.622, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2150.000, -100.000, -381.969), QAngle(0.0, 237.394, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2762.500, -837.500, -433.780), QAngle(0.0, 167.489, 0.0));
	SpawnCommon("common_male_ceda", Vector(-575.000, -62.500, 74.031), QAngle(0.0, 2.247, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-2200.000, -262.500, -93.969), QAngle(0.0, 24.582, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-2275.000, 46.235, -93.969), QAngle(0.0, 13.771, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2287.500, -12.500, -93.969), QAngle(0.0, 324.721, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2275.000, 46.661, -93.969), QAngle(0.0, 317.638, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2287.500, -12.500, -93.969), QAngle(0.0, 179.828, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2275.000, 37.484, -93.969), QAngle(0.0, 128.358, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2312.500, 0.000, -93.969), QAngle(0.0, 306.231, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-2275.000, 27.290, -93.969), QAngle(0.0, 256.240, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2312.500, 0.000, -93.969), QAngle(0.0, 59.703, 0.0));
}

function DirectorScript::MapScript::OnBeginCustomFinaleStage( num, type )
{
	if ("FinaleManager" in getroottable())
		FinaleManager.OnBeginCustomStage(num, type);
}

govnoRNGKiller <- function(value = 0)
{
	if (value == 0)
	{
		govnoKiller <- function() // Sometimes 1st zombie wave don't have any CEDA zombies.
		{
			local iCount = 0
			local hEntity = null;
			while ((hEntity = Entities.FindByModel(hEntity, "models/infected/common_male_ceda.mdl")) != null)
			{
				iCount++;
				hEntity.Kill();
				printl("Removed CEDA Zombie (" + iCount + ")");
			}
		}
		local iTimer = null;
		if ((iTimer = Entities.FindByName(null, "ent_scripted_killer_timer")) == null)
		{
			SpawnEntityFromTable("logic_timer", {targetname = "ent_scripted_killer_timer", RefireTime = 0.0, OnTimer = "!caller,RunScriptCode,govnoKiller()"});
		}
	}
	if (value == 1)
	{
		local iTimer = null;
		if ((iTimer = Entities.FindByName(null, "ent_scripted_killer_timer")) != null)
		{
			iTimer.Kill();
		}
	}
}

function minigunboost()
{
	Convars.SetValue("st_mr_force_file", "minigun2");
	Convars.SetValue("st_mr_play", Ent("!nick").GetEntityIndex());
}

function OnPlayerTakeDamageEvent(tParams)
{
	local hPlayer = tParams["_player"];
	
	if ( !hPlayer )
		return;
	
	if ( hPlayer.GetZombieType() == 8 ) // 8 = Tank
	{
		SayMsg( "Remaining HP: " + hPlayer.GetHealth() );
	}
}
HookEvent( "player_hurt", OnPlayerTakeDamageEvent );

function OnTankSpawnEvent(tParams)
{
	local hPlayer = tParams["_player"];
	
	if ( !hPlayer )
		return;
	
	govnoRNGKiller(1);
}
HookEvent( "tank_spawn", OnTankSpawnEvent );

//Finale Script
function FinaleScript()
{
	printl("Finale Script Loaded...");
	printl("Scripted By: DXSamXD, Sw1ft");
	
	local aPanicOne = [];
	
	aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3864.000, -466.000, -936.000),Vector(-3874.000, -232.000, -942.000),  RandomInt(15, 15), -20, 50));
	aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(1328.248, -220.673, -452.893),Vector(1320.868, -309.340, -471.576), RandomInt(8, 8), -20, 20));
	
	local aPauseOne = [];
	
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-453.371, 838.173, -15.451),Vector(-236.563, 826.410, -12.608), RandomInt(13, 13), -20, 20));
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3519.954, 1963.390, -55.644),Vector(-3429.121, 1965.943, -47.898), RandomInt(16, 16), -10, 10));
	
	local aPauseTwo = [];

	local aPauseThree = [];
	
	aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-1963.837, 435.148, -453.224),Vector(-1859.341, 355.407, -438.034), RandomInt(11, 11), -45, 45));
	aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-1798.540, 425.915, -449.541),Vector(-1772.545, 424.416, -448.992), RandomInt(3, 3), -10, 10));
	aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3404.469, -34.237, -446.096),Vector(-3597.056, 10.799, -450.832), RandomInt(12, 12), -45, 40));
	
	local aPauseFour = [];
	
	aPauseFour.extend(FinaleManager.CalculatePointsWithinCircle(Vector(-1087.484, 1933.316, 34.199), 45.0, RandomInt(12, 12)));
	aPauseFour.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(0.000, -502.189, -483.418),Vector(0.000, -571.563, -478.960), RandomInt(16, 16), -5, 5));
	
	FinaleManager.aPanicSpawnPoints.push(aPanicOne);
	
	FinaleManager.aPauseSpawnPoints.push(aPauseOne);
	
	FinaleManager.aPauseSpawnPoints.push(aPauseTwo);
	
	FinaleManager.aPauseSpawnPoints.push(aPauseThree);
	
	FinaleManager.aPauseSpawnPoints.push(aPauseFour);
	
	AddScriptedTankSpawn(Vector(-4687.500, -2125.000, 144.031));
	AddScriptedTankSpawn(Vector(-4954.078, 210.086, -436.444));
	AddScriptedTankSpawn(Vector(-3674.828, 1537.500, 61.073));
}

function slowtank()
{
	CreateTimer(0.000, function()
	{ 
		SendToServerConsole("host_timescale 0.25");
		SayMsg("Slowing down timescale to 0.25");
	});

	CreateTimer(4.00, function()
	{ 
		SayMsg("Turning timescale back to 0.5");
		SendToServerConsole("host_timescale 0.5");
	});
}

//================Practice Mode!!=======================//
function MarkRemover()
{
	local hEntity = null;
	while ((hEntity = Entities.FindByModel(hEntity, "models/extras/info_speech.mdl")) != null)
	{
		hEntity.Kill();
	}
}

function MarkRemover()
{
	local hEntity = null;
	while ((hEntity = Entities.FindByModel(hEntity, "models/extras/info_speech.mdl")) != null)
	{
		hEntity.Kill();
	}
}

function ChatCommand_practice(hPlayer)
{
	Say(null, "Type !wave2 - Show the 2st wave position", false);
	Say(null, "Type !wave2_2 - Show the 2nd wave 2nd position", false);
	Say(null, "Type !wave3 - Show the 3rd wave position", false);
	Say(null, "Type !wave3_2 - Show the 3rd wave 2nd position", false);
	Say(null, "Type !wave4 - Show the 4th wave position", false);
	Say(null, "Type !wave4_2 - Show the 4th wave 2nd position", false);
	Say(null, "Type !molly - Gives molotov", false);
	Say(null, "Type !tankspawns - Show the tank spawn position", false);
	Say(null, "Type !clear - Clear bubble speech thing", false);
	Say(null, "Type !fs - Finale Sequence Guide", false);
	Say(null, "Type !req - Recording cVars requirement", false);
	
	RegisterChatCommand("!wave2", ChatCommand_wave2, true);
	RegisterChatCommand("!w2", ChatCommand_wave2, true);
	RegisterChatCommand("!wave2_2", ChatCommand_wave2_2, true);
	RegisterChatCommand("!w2_2", ChatCommand_wave2_2, true);
	RegisterChatCommand("!wave3", ChatCommand_wave3, true);
	RegisterChatCommand("!w3", ChatCommand_wave3, true);
	RegisterChatCommand("!wave3_2", ChatCommand_wave3_2, true);
	RegisterChatCommand("!w3_2", ChatCommand_wave3_2, true);
	RegisterChatCommand("!wave4", ChatCommand_wave4, true);
	RegisterChatCommand("!w4", ChatCommand_wave4, true);
	RegisterChatCommand("!wave4_2", ChatCommand_wave4_2, true);
	RegisterChatCommand("!w4_2", ChatCommand_wave4_2, true);
	RegisterChatCommand("!tankspawns", ChatCommand_tankspawn, true);
	RegisterChatCommand("!ts", ChatCommand_tankspawn, true);
	RegisterChatCommand("!clear", ChatCommand_markremover, true);
	RegisterChatCommand("!fs", ChatCommand_fnlseqguide, true);
	RegisterChatCommand("!req", ChatCommand_req, true);
	RegisterChatCommand("!molly", ChatCommand_gmolly, true);
}

function ChatCommand_wave2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-354.207, 830.333, -20.232), angles = Vector(), glowstate = 3, disableshadows = 1});
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1020.026, 159.940, 93.176), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov throw ang, pos", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "Line up on the tip of the bubble thing, on the line, then -72 to 73", false);
	Say(null, "setpos_exact -1091.214966 90.502693 -103.682159;setang_exact -72.0000 42.517090 0.000000", false);
}

function ChatCommand_wave2_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-3519.954, 1963.390, -55.644), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "No lineup needed", false);
}

function ChatCommand_wave3(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1904.669, 406.512, -453.699), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Shoot Gascan and hide from common sight", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1460.453979 125.454262 -68.233093;setang_exact 38.642273 149.796387 0.000000", false);
}

function ChatCommand_wave3_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-3441.993, -15.538, -461.299), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -3231.858643 -83.982040 -183.968750;setang_exact 51.512615 165.966461 0.000000", false);
}

function ChatCommand_wave4(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1087.484, 1933.316, 34.199), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos (Runthrow)", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1528.049438 -223.968750 -103.968750;setang_exact -35.111309 77.932503 0.000000", false);
}

function ChatCommand_wave4_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1.086, -534.732, -491.765), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos (Crouch Throw)", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1052.611938 -852.267090 -103.968750;setang_exact 12.440001 15.232302 0.000000", false);
}

function ChatCommand_gmolly(hPlayer)
{
	local pName = hPlayer.GetPlayerName();
	Say(null, "Gave " + pName + " a molotov.", false);
	hPlayer.GiveItem("molotov");
}

function ChatCommand_tankspawn(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-4687.500, -2125.000, 144.031), angles = Vector(), glowstate = 3, disableshadows = 1});
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-4954.078, 210.086, -436.444), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Copy Paste into console to see the tank spawns", false);
	Say(null, "Tank # 1: setpos_exact -4687.500, -2125.000, 144.031", false);
	Say(null, "Tank # 2: setpos_exact-4954.078, 210.086, -436.444", false);
}

function ChatCommand_markremover(hPlayer)
{
	MarkRemover();
	Say(null, "Cleared.", false);
}

function ChatCommand_req(hPlayer)
{
	Say(null, "cvars required:", false);
	Say(null, "r_drawothermodels 2; sv_minrate 0; rate 786432", false);
}

function ChatCommand_fnlseqguide(hPlayer)
{
	Say(null, "After your movement stopped, kill the commons as soon as possible, and get the utilities needed", false);
	CreateTimer(3.00, function()
	{ 
		Say(null, "Wave 1 (Panic # 1) is also part of movement so, we are moving on to wave 2", false);
		CreateTimer(3.00, function()
		{ 
			Say(null, "Next is Wave 2 which is PAUSE#2", false);
			CreateTimer(3.00, function()
			{ 
				Say(null, "After Wave 2, The first tank spawn.", false);
				CreateTimer(3.00, function()
				{ 
					Say(null, "2 PAUSE stages have 5-7 commons to spawns but at this time, the Tank is about to spawn.", false);
					CreateTimer(3.00, function()
					{ 
						Say(null, "Shoot the infected after killing the tank to make the next wave spawn as soon as possible.", false);
						CreateTimer(3.00, function()
						{ 
							Say(null, "Tank Spawn is at PAUSE#2 and PAUSE#5, which has 5-7 infected but it doesn't bother that much, just focus on shooting the tank.", false);
						});
						CreateTimer(3.00, function()
						{ 
							Say(null, "Also, one last thing, Shoot the CEDA infected! It doesn't burn. GLHF!", false);
						});
					});
				});
			});
		});
	});
}

RegisterChatCommand("!practice", ChatCommand_practice, true);
RegisterChatCommand("!prac", ChatCommand_practice, true);
RegisterChatCommand("!help", ChatCommand_practice, true);