// Squirrel

/* 
[TAS Kit]
Author: Sw1ft
Version: 1.3.1
Scripted By: DXSamXD
Addons required: TAS Kit
Campaign: Tour of Terror
Map: eu03_oldtown_b16
*/

/*

Console: Total time: 96.966 (01:36,966)
Console: Segment time: 43.333 

*/

EnableAutoBileBreaker();

SetPreviousSegmentTime(53.633); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!nick"), "XDRIPEN");
SetClientName(Ent("!rochelle"), "so-so");
SetClientName(Ent("!ellis"), "sanchocolatey");
SetClientName(Ent("!coach"), "instagib");

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
	origin = Vector(1864.011, 599.677, 60.031)
	angles = QAngle(0.000, 179.341, 0.000)
	health = 41

	Inventory =
	{
		active_slot = "slot0"
		
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 69
		}

		slot1 = // secondary weapon
		{
			weapon = "fireaxe"
		}

		slot2 = "vomitjar"
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		OpenSafeRoomDoor();
		cvar("st_mr_force_file", "tot3_coach");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 100

	origin = Vector(1943.770, 599.644, 60.031)
	angles = QAngle(0.000, 180.000, 0.000)
	
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
		cvar("st_mr_force_file", "tot3_ellis");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 100
	origin = Vector(1897.033, 409.411, 60.031)
	angles = QAngle(3.593, 201.625, 0.000)

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
		cvar("st_mr_force_file", "tot3_nick");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 100

	origin = Vector(1951.881, 344.807, 60.031)
	angles = QAngle(3.521, 180.571, 0.000)

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
		cvar("st_mr_force_file", "tot3_rochelle");
		cvar("st_mr_play", hPlayer.GetEntityIndex());
	}
}

SpawnTrigger("trigger_area1", Vector(363.045, 744.857, 256.031));
SpawnTrigger("trigger_area2", Vector(-3892.794, 5719.381, 88.031));
SpawnTrigger("trigger_area3", Vector(-5770.587, 4259.685, 88.031));
SpawnTrigger("trigger_area4", Vector(-6082.385, 3888.295, -71.969));
SpawnTrigger("trigger_area5", Vector(-6091.499, 4327.546, -207.969));
SpawnTrigger("trigger_area6", Vector(-1142.826, 4384.790, 564.466));
SpawnTrigger("trigger_area7", Vector(-3413.771, 5822.031, 107.361));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{
			z2();
			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{
			z3();
			caller.Kill();
		}
		else if (sName == "trigger_area3")
		{
			SpawnZombie("boomer", Vector(-5930.436, 3895.245, -31.969));
			caller.Kill();
		}
		else if (sName == "trigger_area4")
		{
			SpawnZombie("hunter", Vector(-6197.477, 4314.712, -207.969));
			caller.Kill();
		}
		else if (sName == "trigger_area5")
		{
			SpawnZombie("spitter", Vector(-5259.504, 4448.697, -705.099));
			caller.Kill();
		}
		else if (sName == "trigger_area6")
		{
			SpawnZombie("tank", Vector(-2864.630, 5729.365, 42.074));
			caller.Kill();
		}
		else if (sName == "trigger_area7")
		{
			RemoveItemWithin(Vector(-3995.000, 5737.000, 121.000), 300);
			SpawnItem("pistol", Vector(-3992.000, 5787.000, 121.000), QAngle(0.000, 291.006, 90.000), 5);
			SpawnItem("rifle", Vector(-3992.000, 5764.000, 121.000), QAngle(0.000, 291.006, 90.000), 5);
			SpawnItem("shotgun_spas", Vector(-4006.000, 5713.000, 121.000), QAngle(0.000, 296.982, 90.000), 5);
			caller.Kill();
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
	
	//32.400 10 seconds stuck = 42.500 Coach -> Ellis
	//26.300 idle start + 6.1 = 32.500Coach -> Nick
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 26.300);
	
	CreateTimer(32.200, function()
	{ 
		::AutoKick(Ent(4), Ent("!Rochelle")); //Make sure Rochelle Ent is himself
	});

	//Vote Ellis
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"callvote changedifficulty Impossible\");", 37.500);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_voteall\");", 37.517);
	//42.000
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
while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_pain_pills_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_pain_pills_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_first_aid_kit_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_item_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_ammo_spawn")) ent.Kill();
local ent;
while (ent = Entities.FindByClassname(ent, "weapon_pistol_spawn")) ent.Kill();
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("gascan"); RemoveItemByName("defibrillator"); RemoveItemByName("adrenaline");
RemoveItemByName("pain_pills"); RemoveItemByName("upgradepack_explosive"); RemoveItemByName("upgradepack_incendiary"); 
RemoveItemByName("chainsaw"); RemoveItemByName("grenade_launcher"); RemoveItemByName("vomitjar");
RemoveItemByName("sniper_military");

//Weapon Spawns

//Start

SpawnItem("pain_pills", Vector(1998.000, 560.000, 99.250), QAngle(0.000, 42.012, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2002.031, 648.000, 100.875), QAngle(90.000, 318.516, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2001.031, 625.000, 98.344), QAngle(0.000, 2.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2015.875, 610.563, 98.344), QAngle(0.000, 129.507, 0.000), 1);
SpawnItem("first_aid_kit", Vector(2000.031, 596.000, 100.875), QAngle(90.000, 39.990, 0.000), 1);
SpawnItem("ammo", Vector(1848.000, 448.000, 90.531), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("smg", Vector(1853.000, 474.000, 91.375), QAngle(0.000, 231.504, 83.979), 5);
SpawnItem("pistol", Vector(1858.000, 482.000, 91.219), QAngle(0.000, 104.985, 272.988), 5);
SpawnItem("pumpshotgun", Vector(1854.188, 504.313, 91.031), QAngle(0.000, 255.015, 87.495), 5);
SpawnItem("smg_silenced", Vector(1840.406, 504.000, 90.969), QAngle(0.000, 274.482, 82.002), 5);
SpawnItem("pipe_bomb", Vector(1851.000, 387.000, 94.000), QAngle(0.000, 27.993, 90.000), 1);

//
SpawnItem("defibrillator", Vector(1168.000, -444.000, 40.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("vomitjar", Vector(1215.344, -417.406, 42.125), QAngle(301.948, 139.966, 270.044), 1);
SpawnItem("gascan", Vector(-289.094, -209.969, -69.063), QAngle(359.473, 360.000, 359.824), -1);
//Saferoom

SpawnItem("first_aid_kit", Vector(-4941.000, 4024.000, -639.688), QAngle(0.000, 315.483, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4954.000, 4011.000, -637.125), QAngle(90.000, 58.491, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4968.000, 4020.000, -639.688), QAngle(0.000, 272.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4992.000, 4021.000, -637.125), QAngle(90.000, 48.516, 0.000), 1);
SpawnItem("shotgun_spas", Vector(-5024.000, 4269.000, -640.031), QAngle(0.000, 313.989, 83.979), 5);
SpawnItem("pistol_magnum", Vector(-4980.000, 4248.000, -640.000), QAngle(0.000, 210.015, 90.000), 5);
SpawnItem("ammo", Vector(-4998.000, 4261.813, -640.875), QAngle(0.000, 90.000, 0.000), 1);
SpawnItem("rifle_ak47", Vector(-5054.313, 4268.000, -640.406), QAngle(0.000, 345.015, 87.495), 5);
SpawnItem("sniper_military", Vector(-5054.000, 4254.188, -640.469), QAngle(0.000, 4.482, 82.002), 5);
//
//
//Detailing
RemoveItemWithin(Vector(-3995.000, 5737.000, 121.000), 250);
SpawnItem("upgradepack_explosive", Vector(-321.000, 2048.000, 100.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("pain_pills", Vector(869.000, 1466.000, 178.000), QAngle(0.000, 270.000, 0.000), 1);
SpawnItem("pipe_bomb", Vector(1002.313, -179.969, 42.281), QAngle(290.962, 126.431, 267.935), 1);
SpawnItem("electric_guitar", Vector(106.344, -424.813, 229.781), QAngle(2.593, 355.210, 15.776), 1);
SpawnItem("frying_pan", Vector(-279.000, -306.000, 243.594), QAngle(0.044, 270.000, 269.956), 1);
SpawnItem("pain_pills", Vector(-153.000, -327.000, 250.000), QAngle(0.000, 270.000, 0.000), 1);
SpawnItem("molotov", Vector(-648.375, -215.156, 149.375), QAngle(358.462, 359.780, 357.935), 1);
SpawnItem("crowbar", Vector(-1945.844, -146.688, -38.906), QAngle(355.210, 90.923, 91.055), 1);
SpawnItem("ammo_l4d", Vector(-1265.000, 116.000, -43.000), QAngle(350.947, 74.575, 357.363), 1);
SpawnItem("pain_pills", Vector(-2704.000, 4491.000, 308.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("fireaxe", Vector(-2848.000, 4213.000, 85.000), QAngle(0.000, 0.000, 7.515), 1);
SpawnItem("molotov", Vector(-2836.344, 4630.688, 79.344), QAngle(357.407, 37.397, 356.572), 1);
SpawnItem("propanetank", Vector(-1025.938, 3590.844, 11.063), QAngle(0.527, 359.824, 0.747), -1);
SpawnItem("propanetank", Vector(-1061.000, 3633.906, 11.250), QAngle(0.176, 359.824, 0.264), -1);
SpawnItem("fireaxe", Vector(-1333.969, 3196.000, 1.250), QAngle(359.824, 16.436, 89.912), 1);
SpawnItem("sniper_scout", Vector(-1269.688, 3826.875, 1.813), QAngle(359.912, 36.475, 90.220), 5);
SpawnItem("autoshotgun", Vector(-1279.000, 3873.000, 32.938), QAngle(0.088, 56.514, 89.297), 5);
SpawnItem("rifle_ak47", Vector(-1252.906, 3883.000, 33.313), QAngle(359.780, 256.289, 90.352), 5);
SpawnItem("ammo", Vector(-1300.000, 3900.000, 32.000), QAngle(0.000, 294.521, 0.000), 1);
SpawnItem("pistol_magnum", Vector(-133.000, 4238.969, 306.875), QAngle(359.780, 208.872, 87.231), 5);
SpawnItem("pipe_bomb", Vector(-368.906, 4663.656, 249.625), QAngle(287.622, 126.826, 270.000), 1);
SpawnItem("adrenaline", Vector(-3456.000, 5488.000, 119.719), QAngle(355.562, 67.632, 359.033), 1);
SpawnItem("pain_pills", Vector(-4955.063, 5077.938, 31.219), QAngle(2.944, 357.012, 7.339), 1);
SpawnItem("grenade_launcher", Vector(296.000, 877.000, 271.000), QAngle(280.020, 270.000, 270.000), 1);


//========================Custom Functions=========================//
function z1()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(1787.500, 462.500, 64.026), QAngle(0.0, 50.292, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1787.500, 400.000, 64.026), QAngle(0.0, 68.381, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1787.500, 400.000, 64.026), QAngle(0.0, 83.623, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(1787.500, 400.000, 64.026), QAngle(0.0, 195.628, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1787.500, 275.000, 64.026), QAngle(0.0, 207.626, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1787.500, 275.000, 64.026), QAngle(0.0, 149.180, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1787.500, 275.000, 64.026), QAngle(0.0, 226.371, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1787.500, 212.500, 214.031), QAngle(0.0, 12.545, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1712.500, 37.500, 73.496), QAngle(0.0, 133.590, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1625.000, 62.500, 58.020), QAngle(0.0, 164.732, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(1750.000, 37.500, 214.031), QAngle(0.0, 266.067, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1662.500, 37.500, 214.031), QAngle(0.0, 65.997, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(975.000, 783.387, 58.026), QAngle(0.0, 331.330, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(975.000, 783.387, 58.026), QAngle(0.0, 331.330, 0.0));
	//SpawnCommon("common_male_tshirt_cargos", Vector(937.500, 550.000, 58.031), QAngle(0.0, 30.961, 0.0));
	//SpawnCommon("common_male_tshirt_cargos", Vector(1425.000, -323.279, 58.020), QAngle(0.0, 40.336, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1174.974, 223.144, 58.023), QAngle(0.0, 209.442, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1174.974, 223.144, 58.023), QAngle(0.0, 209.442, 0.0));
	//SpawnCommon("common_male_tshirt_cargos", Vector(1025.430, 50.000, 127.910), QAngle(0.0, 266.614, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(972.553, 172.566, 58.031), QAngle(0.0, 160.827, 0.0));
	SpawnCommon("common_male_ceda", Vector(971.275, 126.426, 58.031), QAngle(0.0, 210.927, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(944.416, 140.473, 58.031), QAngle(0.0, 197.574, 0.0));
	//SpawnCommon("common_female_tankTop_jeans", Vector(1298.443, -300.721, 58.020), QAngle(0.0, 316.371, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(888.438, 399.873, 58.031), QAngle(0.0, 21.433, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(1200.000, 387.500, 58.026), QAngle(0.0, 275.757, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1087.500, 412.500, 58.031), QAngle(0.0, 326.243, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(912.500, 250.000, 58.031), QAngle(0.0, 308.951, 0.0));
	SpawnCommon("common_male_ceda", Vector(1225.000, 172.760, 248.031), QAngle(0.0, 198.108, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1162.500, 441.342, 277.261), QAngle(0.0, 353.266, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(1162.500, 441.342, 277.261), QAngle(0.0, 284.771, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1250.000, 425.451, 248.031), QAngle(0.0, 116.285, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1052.368, 547.062, 248.031), QAngle(0.0, 168.296, 0.0));
}

function z2()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(-112.500, 850.000, 58.031), QAngle(0.0, 115.705, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(500.000, 83.824, 42.031), QAngle(0.0, 266.382, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(606.620, -675.000, 53.562), QAngle(0.0, 1.651, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(246.798, -521.024, 178.404), QAngle(0.0, 215.979, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-226.511, 544.111, 60.031), QAngle(0.000, 55.801, 0.000));
	SpawnCommon("common_male_tshirt_cargos", Vector(-147.179, 440.104, 60.031), QAngle(0.000, 179.487, 0.000));
	SpawnCommon("common_male_tshirt_cargos", Vector(-36.277, 579.706, 60.031), QAngle(0.000, 120.650, 0.000));
	SpawnCommon("common_male_tshirt_cargos", Vector(55.615, 615.070, 60.031), QAngle(0.000, 6.368, 0.000));
	
	CreateTimer(0.200, function()	//Spawn Interval
	{ 
		SpawnCommon("common_male_tshirt_cargos", Vector(50.000, -188.690, -15.969), QAngle(0.0, 60.274, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(255.587, -386.880, 50.435), QAngle(0.0, 165.713, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(150.000, -176.772, 24.031), QAngle(0.0, 138.066, 0.0));
		SpawnCommon("common_male_ceda", Vector(995.400, 1253.298, 142.031), QAngle(0.0, 296.049, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(-162.500, -175.000, -65.969), QAngle(0.0, 212.780, 0.0));
		//SpawnCommon("common_male_dressShirt_jeans", Vector(237.500, -625.000, 49.461), QAngle(0.0, 291.267, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(490.686, 546.412, 44.031), QAngle(0.000, 48.445, 0.000)); //
		SpawnCommon("common_male_tankTop_jeans", Vector(-137.500, -62.500, -53.969), QAngle(0.0, 321.557, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(-137.500, -62.500, -53.969), QAngle(0.0, 274.370, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(1087.500, 1300.000, 142.031), QAngle(0.0, 48.886, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(112.500, -175.000, -1.969), QAngle(0.0, 141.904, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(634.650, 270.165, 58.031), QAngle(0.0, 253.214, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(-112.500, -125.000, -41.969), QAngle(0.0, 141.904, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-112.500, -125.000, -41.969), QAngle(0.0, 141.206, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(-112.500, -125.000, -41.969), QAngle(0.0, 46.742, 0.0));
		SpawnCommon("common_male_riot", Vector(300.000, -37.500, 42.031), QAngle(0.0, 131.896, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(925.000, 987.500, 142.031), QAngle(0.0, 75.726, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(925.000, 987.500, 142.031), QAngle(0.0, 47.964, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(212.500, -637.500, 49.720), QAngle(0.0, 180.259, 0.0)); //
		SpawnCommon("common_male_tshirt_cargos", Vector(950.000, 1431.587, 143.926), QAngle(0.0, 302.447, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(712.500, -625.000, 50.031), QAngle(0.0, 46.991, 0.0));
		SpawnCommon("common_male_dressShirt_jeans", Vector(1012.500, 1462.500, 146.031), QAngle(0.0, 53.865, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(1237.500, -312.500, 54.026), QAngle(0.0, 190.040, 0.0));
		SpawnCommon("common_female_tshirt_skirt", Vector(787.500, 1662.500, 146.531), QAngle(0.0, 89.467, 0.0));
	});
}

function z3()
{
	CreateTimer(0.350, function()	//Spawn Interval
	{ 
	SpawnCommon("common_male_tshirt_cargos", Vector(-4125.000, 4650.476, 58.031), QAngle(0.0, 233.240, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4125.000, 4839.964, 58.031), QAngle(0.0, 108.573, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3991.911, 5904.445, 45.162), QAngle(0.0, 172.428, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3062.500, 5300.000, 98.031), QAngle(0.0, 323.832, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-4262.500, 4525.000, 38.531), QAngle(0.0, 145.915, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4212.500, 4662.500, 35.031), QAngle(0.0, 86.485, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-4237.500, 4462.500, 38.531), QAngle(0.0, 148.352, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4237.500, 4462.500, 38.531), QAngle(0.0, 252.733, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4559.737, 4675.000, 35.031), QAngle(0.0, 269.968, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4495.975, 4675.000, 35.031), QAngle(0.0, 222.151, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4537.584, 4675.000, 35.031), QAngle(0.0, 269.418, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-4262.500, 4462.500, 42.031), QAngle(0.0, 258.979, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-4262.500, 4462.500, 42.031), QAngle(0.0, 243.448, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-4212.500, 4437.500, 35.031), QAngle(0.0, 265.463, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-4638.621, 4912.474, 38.013), QAngle(0.0, 135.431, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-4287.500, 4437.500, 38.531), QAngle(0.0, 171.433, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4212.500, 4375.000, 35.031), QAngle(0.0, 141.167, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-4633.580, 4764.708, 35.828), QAngle(0.0, 184.542, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-4237.500, 4387.500, 35.031), QAngle(0.0, 15.615, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2837.500, 5837.500, 51.520), QAngle(0.0, 105.968, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2837.500, 5837.500, 51.520), QAngle(0.0, 264.555, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2694.252, 5793.472, 61.687), QAngle(0.0, 207.353, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4375.000, 4437.500, 38.531), QAngle(0.0, 338.655, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2712.500, 5712.500, 56.766), QAngle(0.0, 60.208, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2675.000, 5737.500, 61.540), QAngle(0.0, 264.642, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-2612.500, 5750.000, 66.308), QAngle(0.0, 266.532, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2668.934, 5676.885, 55.931), QAngle(0.0, 119.163, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-2712.500, 5637.500, 53.029), QAngle(0.0, 92.619, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4527.942, 4422.763, 35.335), QAngle(0.0, 312.371, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4773.086, 4675.000, 35.031), QAngle(0.0, 236.472, 0.0));
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

