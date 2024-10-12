// Squirrel

/* 
[TAS Kit]
Author: Sw1ft
Version: 1.3.1
Scripted By: DXSamXD
Addons required: TAS Kit
Campaign: Tour of Terror
Map: eu04_freeway_b16 
*/

/*

Console: Total time: 104.633 (01:44,633)
Console: Segment time: 7.667 

*/

SetPreviousSegmentTime(96.966); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!nick"), "DXSamXD");
SetClientName(Ent("!ellis"), "Strygwyr");
SetClientName(Ent("!coach"), "Raiden Shotgun");

Cvars <- // console variables manager; format: cvar_name = value(string or number)
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
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	health = 36
	buffer = 40.802
	origin = Vector(-9863.247, 2377.116, -735.969)
	angles = QAngle(0.000, 7.311, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 4
			ammo = 62
		}

		slot1 = // secondary weapon
		{
			weapon = "fireaxe"
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 89
	origin = Vector(-9863.247, 2377.117, -735.969)
	angles = QAngle(0.000, -144.443, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		
		slot0 =
		{
			weapon = "shotgun_spas"
			clip = 7
			ammo = 89
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 14
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		cvar("st_mr_force_file", "tot4_ellis");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 50
	origin = Vector(-3014.032227, -1657.969238, -3.968750)
	angles = QAngle(-0.000000, 90.000000, 0.000000)
	
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
		cvar("st_mr_force_file", "tot4_nick");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

/*Survivors["rochelle"] <-
{
	health = 100
	origin = Vector(-9904.000, 2532.000, -735.969)
	angles = QAngle(21.120, 22.928, 0.000)
	
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
	}
}*/

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
	cvar("host_timescale", 1.00);
	z1();
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 2.500);
	
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"callvote changedifficulty Easy\");", 0.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"vote yes\");", 2.0);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"vote yes\");", 4.0);
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

//Item Spawn
//Start
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("gascan"); RemoveItemByName("defibrillator"); RemoveItemByName("adrenaline");
RemoveItemByName("pain_pills"); RemoveItemByName("upgradepack_explosive"); RemoveItemByName("upgradepack_incendiary"); 
RemoveItemByName("chainsaw"); RemoveItemByName("grenade_launcher"); RemoveItemByName("vomitjar");
RemoveItemWithin(Vector(-9830.000, 2595.000, -704.031), 200);
RemoveItemWithin(Vector(-9798.000, 2347.000, -701.125), 5);
SpawnItem("first_aid_kit", Vector(-9747.000, 2350.000, -703.688), QAngle(0.000, 315.483, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-9760.000, 2337.000, -701.125), QAngle(90.000, 58.491, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-9774.000, 2346.000, -703.688), QAngle(0.000, 272.505, 0.000), 1);

SpawnItem("pistol_magnum", Vector(-9786.000, 2574.000, -704.000), QAngle(0.000, 210.015, 90.000), 5);
SpawnItem("shotgun_spas", Vector(-9830.000, 2595.000, -704.031), QAngle(0.000, 313.989, 83.979), 5);
SpawnItem("rifle_ak47", Vector(-9860.313, 2594.000, -704.406), QAngle(0.000, 345.015, 87.495), 5);
SpawnItem("sniper_military", Vector(-9860.000, 2580.188, -704.469), QAngle(0.000, 4.482, 82.002), 5);
SpawnItem("ammo", Vector(-9804.000, 2587.813, -704.875), QAngle(0.000, 90.000, 0.000), 1);
//pathway
SpawnItem("molotov", Vector(-3327.000, -1894.000, 138.000), QAngle(45.000, 333.984, 270.000), 1);
SpawnItem("propanetank", Vector(-2235.000, -2087.000, 139.000), QAngle(0.212, 300.162, 0.457), -1);
//Saferoom
SpawnItem("hunting_rifle", Vector(-886.000, -2050.000, 80.000), QAngle(272.988, 90.000, 90.000), 5);
SpawnItem("first_aid_kit", Vector(-834.000, -2061.000, 115.000), QAngle(90.000, 80.991, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-835.000, -2071.000, 115.000), QAngle(90.000, 199.512, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-767.000, -2052.000, 118.000), QAngle(9.492, 90.000, 270.000), 1);
SpawnItem("first_aid_kit", Vector(-773.000, -2063.000, 115.000), QAngle(90.000, 177.495, 0.000), 1);
SpawnItem("ammo", Vector(-742.000, -2062.000, 119.000), QAngle(0.000, 90.000, 0.000), 1);
SpawnItem("autoshotgun", Vector(-863.000, -2227.000, 102.594), QAngle(0.000, 4.482, 82.002), 5);
SpawnItem("rifle_desert", Vector(-843.000, -2214.000, 102.625), QAngle(0.000, 345.015, 87.495), 5);
SpawnItem("rifle", Vector(-813.000, -2211.000, 103.000), QAngle(0.000, 313.989, 83.979), 5);



// ==================== Custom Functions ===========================//

function z1()
{
	SpawnCommonForCB(Vector(-3042.811, -1909.449, 148.031), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2); 
		
	SpawnCommon("common_female_tankTop_jeans", Vector(-2900.000, -1612.500, -113.969), QAngle(0.0, 321.973, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-3212.500, -1612.500, -117.969), QAngle(0.0, 336.199, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-4087.500, -1487.500, 146.031), QAngle(0.0, 235.434, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3737.500, -1075.000, 154.031), QAngle(0.0, 25.551, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2862.500, -912.500, -424.569), QAngle(0.0, 181.023, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-4182.451, -1611.315, 146.031), QAngle(0.0, 12.493, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4448.055, -1524.971, 146.031), QAngle(0.0, 313.075, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-1537.500, -2062.500, 78.031), QAngle(0.0, 215.693, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-3737.500, -575.000, 154.031), QAngle(0.0, 237.158, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1918.654, -1071.780, -450.602), QAngle(0.0, 177.051, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3024.836, -1750.000, -109.969), QAngle(0.0, 196.214, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-2950.000, -1612.500, -113.969), QAngle(0.0, 217.994, 0.0));
	SpawnCommon("common_male_riot", Vector(-3162.500, -1612.500, -113.969), QAngle(0.0, 180.099, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2750.000, -2088.721, 153.376), QAngle(0.0, 83.940, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2852.314, -1347.366, -120.286), QAngle(0.0, 335.104, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-3369.255, -1851.960, 146.031), QAngle(0.0, 245.376, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-2493.794, -2000.000, 148.104), QAngle(0.0, 161.554, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3712.500, -1550.000, 153.778), QAngle(0.0, 265.129, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3173.492, -1302.401, -131.609), QAngle(0.0, 248.670, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3762.500, -1500.000, 150.031), QAngle(0.0, 288.108, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3762.500, -1600.000, 150.031), QAngle(0.0, 86.042, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2262.500, -1912.500, 138.031), QAngle(0.0, 293.415, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3762.500, -1787.500, 150.031), QAngle(0.0, 289.358, 0.0));
	SpawnCommon("common_male_roadcrew", Vector(-3762.500, -1200.000, 150.031), QAngle(0.0, 295.032, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2737.500, -1037.500, -432.869), QAngle(0.0, 212.181, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2075.349, -2014.560, 120.840), QAngle(0.0, 231.003, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3762.500, -1100.000, 150.031), QAngle(0.0, 7.917, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3461.512, -1347.425, -132.788), QAngle(0.0, 97.342, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3469.962, -1356.537, -131.582), QAngle(0.0, 68.462, 0.0));
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