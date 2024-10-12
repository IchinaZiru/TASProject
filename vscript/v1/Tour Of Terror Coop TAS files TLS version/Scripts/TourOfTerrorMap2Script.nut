// Squirrel

/* 
[TAS Kit]
Author: Sw1ft
Version: 1.3.1
Scripted By: DXSamXD
Addons required: TAS Kit
Campaign: Tour of Terror
Map: eu02_castle_b16
*/

SetPreviousSegmentTime(33.167); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133
/*

Console: Total time: 53.633 
Console: Segment time: 20.467 

*/

SetClientName(Ent("!nick"), "ᵈʸᵃ");
SetClientName(Ent("!rochelle"), "QEES シ");
SetClientName(Ent("!ellis"), "Mr.Tank.Bhop");
SetClientName(Ent("!coach"), "(っ◔◡◔)っDXSamXD");

Cvars <- // console variables manager; format: cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	director_no_bosses = 1
	director_no_mobs = 0
	director_no_specials = 0

	god = 0
	z_common_limit = 0
	sv_infinite_ammo = 0
	host_timescale = 1.0

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
	sv_infected_ceda_vomitjar_probability = 1
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	health = 41
	origin = Vector(2934.987, -3217.412, -87.969)
	angles = QAngle(0.066, -135.950, 0.000)
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
			weapon = "fireaxe"	
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		cvar("st_mr_force_file", "tot2_coach");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 100
	origin = Vector(3000.965, -3189.539, -87.969)
	angles = QAngle(1.137, 91.752, 0.000)

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
		cvar("st_mr_force_file", "tot2_ellis");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 100
	origin = Vector(2907.788, -3256.883, -87.969)
	angles = QAngle(0.000, 37.996, 0.000)

	Inventory =
	{
		active_slot = "slot2"

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "molotov"
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		cvar("st_mr_force_file", "tot2_nick");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 50
	origin = Vector(3047.342, -3372.108, -87.969)
	angles = QAngle(0.0000, 123.141, 0.000)

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
		cvar("st_mr_force_file", "tot2_rochelle");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

SpawnTrigger("trigger_area1", Vector(2994.399, -3075.188, -87.969));
SpawnTrigger("trigger_area2", Vector(1171.524, -2961.980, -87.969));
SpawnTrigger("trigger_area3", Vector(958.751, 1404.801, 238.831));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{
			CreateTimer(1.000, function()
			{ 
				z1();
			});
			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{
			z2();
			caller.Kill();
		}
		else if (sName == "trigger_area3")
		{
			z3();
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
	
	//3.500 kick nick 		//QEES 
	CreateTimer(3.500, function()
	{ 
		::AutoKick(Ent(2), Ent("!nick")); //Make sure Nick Ent is himself
	});
	
	//13.067 //Coach warp -> Ellis
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 6.967);
	
	CreateTimer(12.867, function()	//Rochelle idle + kick
	{ 
		::AutoKick(Ent(3), Ent("!rochelle")); //Make sure Rochelle Ent is herself
	});
	
	//18.4
	
	CreateTimer(18.400, function()	//Mr.Tank.Bhop
	{ 
		::AutoKick(Ent(1), Ent("!ellis")); //Make sure Rochelle Ent is himself
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

local ent;
while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("pain_pills"); RemoveItemByName("adrenaline"); RemoveItemByName("defibrillator"); RemoveItemByName("first_aid_kit"); 
RemoveItemByName("vomitjar"); RemoveItemByName("vomitjar"); 

//Weapon Spawns

SpawnItem("pumpshotgun", Vector(2845.313, -3169.094, -55.219), QAngle(0.000, 344.487, 266.001), 4, 75);
SpawnItem("smg", Vector(2897.156, -3164.906, -55.500), QAngle(0.000, 258.486, 83.013), 5);

SpawnItem("first_aid_kit", Vector(3092.156, -3315.000, -52.125), QAngle(0.000, 2.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3088.813, -3330.156, -52.125), QAngle(0.000, 129.507, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3071.969, -3333.875, -49.594), QAngle(90.000, 39.990, 0.000), 1);
SpawnItem("first_aid_kit", Vector(3077.250, -3315.750, -49.594), QAngle(90.000, 318.516, 0.000), 1);

//Saferoom

SpawnItem("ammo", Vector(-948.000, 2369.000, -1558.469), QAngle(0.000, 0.000, 0.000), 1, 100);
SpawnItem("pain_pills", Vector(-798.000, 2481.000, -1549.750), QAngle(0.000, 42.012, 0.000), 1, 100);
SpawnItem("pipe_bomb", Vector(-945.000, 2308.000, -1555.000), QAngle(0.000, 27.993, 90.000), 1);
SpawnItem("smg", Vector(-943.000, 2395.000, -1557.625), QAngle(0.000, 231.504, 83.979), 5);
SpawnItem("pumpshotgun", Vector(-941.813, 2425.313, -1557.969), QAngle(0.000, 255.015, 87.495), 5);
SpawnItem("smg_silenced", Vector(-955.594, 2425.000, -1558.031), QAngle(0.000, 274.482, 82.002), 5);
SpawnItem("pistol", Vector(-938.000, 2403.000, -1557.781), QAngle(0.000, 104.985, 272.988), 5);
SpawnItem("first_aid_kit", Vector(-793.969, 2569.000, -1548.125), QAngle(90.000, 318.516, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-794.969, 2546.000, -1550.656), QAngle(0.000, 2.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-780.125, 2531.563, -1550.656), QAngle(0.000, 129.507, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-795.969, 2517.000, -1548.125), QAngle(90.000, 39.990, 0.000), 1);3

//
SpawnItem("pistol_magnum", Vector(330.438, -2762.000, -47.000), QAngle(0.000, 111.489, 90.000), 5);
SpawnItem("adrenaline", Vector(1447.781, 648.844, 211.875), QAngle(273.560, 342.378, 47.241), 1);
SpawnItem("pain_pills", Vector(456.000, -3040.000, -83.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("pipe_bomb", Vector(478.000, -2941.000, -87.000), QAngle(328.271, 46.055, 87.935), 1);
SpawnItem("molotov", Vector(671.594, -3738.094, -178.656), QAngle(357.891, 359.824, 357.144), 1);

//
SpawnItem("pain_pills", Vector(920.375, 2368.875, 305.000), QAngle(357.627, 19.028, 359.209), 1);
SpawnItem("pipe_bomb", Vector(914.969, 2292.000, 301.000), QAngle(328.271, 46.055, 87.935), 1);
SpawnItem("pumpshotgun", Vector(934.000, 2233.000, 301.313), QAngle(2.021, 161.016, 270.000), 5);
SpawnItem("smg", Vector(937.000, 2253.000, 301.938), QAngle(2.021, 189.009, 270.000), 5);
SpawnItem("smg_silenced", Vector(927.000, 2271.000, 301.938), QAngle(2.021, 21.973, 270.000), 5);
SpawnItem("ammo", Vector(904.313, 2173.656, 303.000), QAngle(1.934, 164.004, 359.473), 1);

SpawnItem("machete", Vector(1739.000, 3000.000, 520.844), QAngle(358.462, 74.487, 90.352), 1);

//detailing

//SpawnItem("pistol_magnum", Vector(-736.000, 2374.000, -1568.000), QAngle(0.000, 66.006, 90.000), 5);
SpawnItem("pistol_magnum", Vector(44.000, 3556.000, -1598.094), QAngle(0.000, 57.480, 270.000), 5, 20);
SpawnItem("adrenaline", Vector(-61.000, 4203.281, -1587.438), QAngle(356.748, 66.753, 359.297), 1, 20);


//===========Custom Function=================//

function z1()
{
	SpawnCommon("common_male_ceda", Vector(2837.500, -2800.000, -77.969), QAngle(0.0, 33.932, 0.0));
	SendToConsole("sv_infected_ceda_vomitjar_probability 0.1");
	CreateTimer(0.017, function()
	{ 
	SpawnCommon("common_male_tshirt_cargos", Vector(2800.000, -2800.000, -77.983), QAngle(0.0, 18.242, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(2787.500, -2725.000, -79.454), QAngle(0.0, 292.925, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2787.500, -2725.000, -79.454), QAngle(0.0, 295.943, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2849.269, -2534.823, -77.969), QAngle(0.0, 128.818, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2900.000, -2983.166, -77.969), QAngle(0.0, 350.056, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2900.000, -2993.565, -77.969), QAngle(0.0, 78.959, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2900.000, -2977.415, -77.969), QAngle(0.0, 53.968, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2762.500, -2987.500, -77.969), QAngle(0.0, 103.593, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2687.500, -2625.000, -78.036), QAngle(0.0, 80.402, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2519.716, -2532.570, -77.969), QAngle(0.0, 142.890, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2675.000, -2972.340, -78.233), QAngle(0.0, 76.602, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2587.500, -2975.000, -78.515), QAngle(0.0, 280.161, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2587.500, -2975.000, -78.515), QAngle(0.0, 82.864, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2587.500, -2975.000, -78.515), QAngle(0.0, 33.518, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2437.500, -2812.500, -77.969), QAngle(0.0, 95.089, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(2400.000, -2737.500, -77.969), QAngle(0.0, 125.119, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2583.168, -3055.290, -77.969), QAngle(0.0, 56.929, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2616.516, -3027.304, -77.969), QAngle(0.0, 183.012, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2577.781, -3040.876, -77.969), QAngle(0.0, 272.423, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2437.966, -2536.906, -77.969), QAngle(0.0, 35.917, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2337.500, -2875.000, -77.969), QAngle(0.0, 209.385, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2300.459, -2925.000, -78.223), QAngle(0.0, 13.163, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2300.000, -2810.918, -77.981), QAngle(0.0, 87.859, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2437.500, -3012.500, -69.969), QAngle(0.0, 303.156, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2437.500, -3012.500, -69.969), QAngle(0.0, 197.673, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2250.000, -2638.736, -78.148), QAngle(0.0, 210.415, 0.0));
	SpawnCommon("common_male_ceda", Vector(2900.000, -2611.297, -77.969), QAngle(0.0, 158.802, 0.0));
	SpawnCommon("common_male_ceda", Vector(2500.000, -2971.408, -78.135), QAngle(0.0, 182.315, 0.0));
	SpawnCommon("common_male_ceda", Vector(2787.500, -3000.000, -77.969), QAngle(0.0, 39.504, 0.0));
	});
}

function z2()
{
	SpawnCommon("common_male_dressShirt_jeans", Vector(772.021, -1623.774, -105.136), QAngle(0.0, 94.768, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(768.107, -1625.022, -107.566), QAngle(0.0, 118.403, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(754.585, -3200.406, -77.969), QAngle(0.0, 311.815, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(741.050, -2534.791, -77.969), QAngle(0.0, 149.924, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(676.554, -2466.586, -77.969), QAngle(0.0, 90.901, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(789.867, -2288.066, -77.969), QAngle(0.0, 76.744, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(778.776, -2340.097, -77.969), QAngle(0.0, 358.258, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(750.000, -2176.239, -49.644), QAngle(0.0, 171.064, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(712.500, -2237.500, -68.215), QAngle(0.0, 90.353, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(712.500, -2237.500, -68.215), QAngle(0.0, 267.127, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(774.044, -2121.454, -27.969), QAngle(0.000, 258.086, 0.000));
	SpawnCommon("common_male_tankTop_jeans", Vector(825.000, -1950.000, -29.969), QAngle(0.0, 239.200, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(525.000, -2294.558, -271.237), QAngle(0.0, 231.758, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(524.977, -2125.863, -285.789), QAngle(0.0, 322.693, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(554.499, -3617.873, -336.547), QAngle(0.0, 317.330, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(587.500, -2112.500, -223.656), QAngle(0.0, 256.907, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(587.500, -2112.500, -223.656), QAngle(0.0, 74.375, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(587.500, -2112.500, -223.656), QAngle(0.0, 313.600, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(503.022, -2071.428, -311.462), QAngle(0.0, 80.763, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(412.500, -1875.000, -408.753), QAngle(0.0, 212.415, 0.0));
	
	SpawnZombie("tank", Vector(800.000, -2762.500, -87.969));
}

function z3()
{
	SpawnCommon("common_male_ceda", Vector(1662.500, 2625.000, 274.031), QAngle(0.0, 116.711, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1788.181, 2878.638, 490.031), QAngle(0.0, 150.674, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2000.000, 2800.000, 490.031), QAngle(0.0, 244.611, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1573.275, 3206.250, 266.031), QAngle(0.0, 4.661, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1614.974, 3292.956, 266.031), QAngle(0.0, 137.314, 0.0));
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

//bosses spawn
//SpawnZombie("witch", Vector(787.500, -2312.500, -77.969), QAngle(0.000, 269.601, 0.000));
//SpawnZombie("tank", Vector(800.000, -2762.500, -87.969));