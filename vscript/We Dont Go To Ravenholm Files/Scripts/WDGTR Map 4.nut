// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined
DisableAutoClimb();
SetPreviousSegmentTime(122.100); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

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
	health = 100
	origin = Vector(-4723.976, 5263.901, -4469.969)   // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -85.413, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )

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
		Convars.SetValue("st_mr_force_file", "ravenholm4_coach");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors
{
	health = 78
	origin = Vector(-4737.500, 5337.500, -4469.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(328.293, 299.854, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )

	Inventory =
	{
		active_slot = "slot1"
		
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 0
			ammo = 26
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 1
		}
	}

	Actions = function(hPlayer)
	{
		// do some stuff here
		Convars.SetValue("st_mr_force_file", "ravenholm4_ellis");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <- // for L4D survivors use their names: coach -> louis, ellis -> francis, nick -> bill, rochelle -> zoey
{
	health = 78
	origin = Vector(-4752.362, 5144.996, -4469.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 255.069, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )

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
		//Convars.SetValue("st_mr_force_file", "ravenholm4_nick");
		//Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 50
	origin = Vector(-4705.530, 5382.731, -4469.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -22.187, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )

	Inventory =
	{
		active_slot = "slot1"
		
		slot0 = // primary weapon
		{
			weapon = "shotgun_spas"
			clip = 10
			ammo = 81
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
		Convars.SetValue("st_mr_force_file", "ravenholm4_rochelle");
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
	}
}

//Clear Director Weapons before spawning scripted ones
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
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank");

//near starting point
SpawnItem("molotov", Vector(-3770.281, 4930.625, -4464.688), QAngle(357.319, 359.912, 357.407), 1);

//truck
SpawnItem("molotov", Vector(-2012.250, 5026.063, -4472.625), QAngle(1.318, 1.846, 1.538), 1);
SpawnItem("molotov", Vector(-1994.344, 5027.938, -4472.625), QAngle(1.187, 0.571, 1.582), 1);

//table near big gun

SpawnItem("molotov", Vector(-1000.906, 5531.438, -4438.688), QAngle(357.319, 359.648, 355.781), 1);
SpawnItem("molotov", Vector(-992.594, 5515.656, -4438.625), QAngle(0.659, 46.714, 358.506), 1);
SpawnItem("molotov", Vector(-976.094, 5504.063, -4438.688), QAngle(358.901, 359.868, 359.033), 1);

//inside warehouse
SpawnItem("molotov", Vector(-1853.000, 7360.000, -4438.895), QAngle(0.000, 0.000, 0.000), 1);
//near radio
SpawnItem("molotov", Vector(-1243.969, 6907.406, -4441.906), QAngle(359.824, 0.000, 359.473), 1);

//melees

SpawnItem("baseball_bat", Vector(-2343.625, 5295.406, -4478.719), QAngle(329.458, 58.403, 270.791), 1);
SpawnItem("baseball_bat", Vector(-2314.438, 5632.438, -4478.719), QAngle(329.150, 160.884, 270.791), 1);
SpawnItem("baseball_bat", Vector(-2271.813, 5802.094, -4478.656), QAngle(327.964, 168.091, 89.209), 1);
SpawnItem("crowbar", Vector(-2353.031, 6004.125, -4478.844), QAngle(359.121, 290.171, 88.022), 1);

SpawnItem("crowbar", Vector(-2106.094, 5778.938, -4478.813), QAngle(358.945, 232.998, 88.154), 1);
SpawnItem("baseball_bat", Vector(-2054.625, 5965.938, -4478.625), QAngle(329.370, 293.423, 270.791), 1);
SpawnItem("crowbar", Vector(-2019.938, 6006.219, -4478.875), QAngle(358.682, 262.134, 88.022), 1);

SpawnItem("fireaxe", Vector(-1546.188, 5950.969, -4478.719), QAngle(0.176, 231.855, 89.912), 1);
SpawnItem("baseball_bat", Vector(-1810.094, 5388.219, -4478.719), QAngle(271.582, 259.980, 64.688), 1);
SpawnItem("crowbar", Vector(-1879.469, 5168.875, -4479.063), QAngle(358.682, 233.613, 87.759), 1);
SpawnItem("baseball_bat", Vector(-1585.625, 5391.094, -4478.719), QAngle(88.813, 300.059, 304.937), 1);

SpawnItem("crowbar", Vector(-2193.375, 6783.906, -4478.875), QAngle(359.077, 174.551, 87.891), 1);
SpawnItem("baseball_bat", Vector(-2157.813, 6969.875, -4478.625), QAngle(89.033, 101.294, 314.385), 1);
SpawnItem("fireaxe", Vector(-1559.563, 7456.375, -4478.688), QAngle(359.956, 6.592, 269.868), 1);
SpawnItem("crowbar", Vector(-1859.563, 7554.719, -4350.813), QAngle(358.682, 232.910, 88.286), 1);

//weapons

SpawnItem("sniper_military", Vector(-924.031, 5441.031, -4478.500), QAngle(358.945, 29.883, 90.352), 4);
SpawnItem("hunting_rifle", Vector(-924.000, 5420.000, -4478.969), QAngle(0.615, 29.971, 89.824), 4);

SpawnItem("autoshotgun", Vector(-1265.000, 6769.594, -4446.281), QAngle(0.044, 33.003, 89.253), 4);
SpawnItem("rifle", Vector(-1264.063, 6748.656, -4446.094), QAngle(358.857, 33.135, 82.969), 4);

SpawnItem("ammo", Vector(-1257.000, 6798.594, -4447.000), QAngle(0.000, 308.496, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-1248.000, 6731.594, -4439.000), QAngle(0.000, 9.009, 182.505), 1);
SpawnItem("first_aid_kit", Vector(-1253.000, 6717.594, -4444.000), QAngle(90.000, 317.505, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-1266.000, 6722.594, -4444.000), QAngle(90.000, 267.495, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-1263.000, 6727.594, -4444.000), QAngle(90.000, 100.503, 0.000), 1);

SpawnItem("pain_pills", Vector(-1254.000, 6915.000, -4447.000), QAngle(0.000, 288.984, 0.000), 1);
SpawnItem("pain_pills", Vector(-1265.000, 6921.000, -4446.000), QAngle(71.016, 333.018, 90.000), 1);
SpawnItem("pain_pills", Vector(-1263.000, 6910.000, -4447.000), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("pain_pills", Vector(-1258.000, 6905.000, -4447.000), QAngle(0.000, 0.000, 0.000), 1);

//saferoom

SpawnItem("rifle_desert", Vector(-4720.000, 5086.000, -4427.844), QAngle(359.780, 31.904, 84.199), 4);
SpawnItem("shotgun_spas", Vector(-4722.000, 5105.000, -4427.625), QAngle(0.044, 36.475, 90.615), 4);
SpawnItem("ammo", Vector(-4708.000, 5064.000, -4429.000), QAngle(0.000, 199.512, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4705.000, 5168.000, -4434.000), QAngle(0.000, 52.515, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4710.000, 5156.000, -4426.000), QAngle(0.000, 299.004, 180.000), 1);
SpawnItem("first_aid_kit", Vector(-4726.000, 5159.000, -4431.000), QAngle(90.000, 339.521, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4715.000, 5172.000, -4431.000), QAngle(90.000, 119.004, 0.000), 1);

function ci1()
{
	SpawnCommon("common_male_tshirt_cargos", Vector(-4550.000, 5012.500, -4469.969), QAngle(0.0, 73.083, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-4425.000, 5299.068, -4469.969), QAngle(0.0, 106.750, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-4325.000, 5287.500, -4467.727), QAngle(0.0, 359.787, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-4357.188, 5009.981, -4469.969), QAngle(0.0, 103.390, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-4287.500, 5125.000, -4469.969), QAngle(0.0, 332.992, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-4165.994, 4914.974, -4469.969), QAngle(0.0, 225.139, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-4002.375, 4977.771, -4469.969), QAngle(0.0, 20.792, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3962.500, 5050.000, -4466.267), QAngle(0.0, 158.249, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-3925.000, 4937.500, -4464.969), QAngle(0.0, 135.847, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3851.677, 4878.401, -4459.969), QAngle(0.0, 173.824, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3812.185, 4980.925, -4469.969), QAngle(0.0, 358.815, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3975.000, 4800.000, -4469.969), QAngle(0.0, 232.961, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3712.500, 4987.500, -4469.969), QAngle(0.0, 183.959, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3698.600, 4935.332, -4469.969), QAngle(0.0, 139.673, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3625.000, 4902.982, -4469.969), QAngle(0.0, 241.612, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-3712.500, 4850.000, -4469.969), QAngle(0.0, 259.407, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3525.000, 4887.500, -4469.969), QAngle(0.0, 138.859, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3525.000, 4887.500, -4469.969), QAngle(0.0, 260.964, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-3732.129, 4729.102, -4469.969), QAngle(0.0, 325.193, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2939.660, 4689.734, -4469.969), QAngle(0.0, 130.985, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(-3012.791, 4786.422, -4469.969), QAngle(0.0, 167.536, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-3152.710, 5300.397, -4469.969), QAngle(0.0, 299.411, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-3184.322, 4479.058, -4469.969), QAngle(0.0, 261.707, 0.0));
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);
	
	CreateTimer(1.0, function()
	{ 
		ci1();
		CreateTimer(4.5, function()
		{
			SendToServerConsole("st_fastreload 123456789");
			SendToServerConsole("z_common_limit 30");
		});
	});
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{
	SayMsg("Finale Started.");
	FinaleManager.Settings.Enabled = true;
	FinaleScript();
	CreateTimer(4.000, function(){ SayMsg("Rochelle, Throw!!"); });
}

function Callbacks::OnFinalePause() // called during pause stage of panic event in the finale
{
	CreateTimer(3.000, function(){ SayMsg("Throw!"); });
	
	CreateTimer(4.000, function(){ SayMsg("Throw!"); });
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

	local PAUSE = 0;

	if (iType == PANIC)
	{
		CreateTimer(1.800, function(){ SayMsg("Throw!"); });
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
			SendToServerConsole("host_timescale 0.5");
		});

		CreateTimer(4.00, function()
		{ 
			SayMsg("Turning timescale back to 0.5");
		});
		
	}
	else if (iType == DELAY)
	{
		SayMsg("GET READY!");

		CreateTimer(10.00, function()
		{ 
			SayMsg("!");
		});
	}
	else if (iType == PAUSE)
	{
	}
}

//Scripted Finale Script
function FinaleScript()
{
	local aPanicOne = [];

	//Panic 1
    aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-1402.758, 7851.735, -4276.241),Vector(-1417.407, 7953.207, -4315.628), RandomInt(8, 8), -35, 35));
	aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-1329.254, 7829.082, -4267.449),Vector(-1318.368, 7974.550, -4323.913), RandomInt(8, 8), -35, 35));

	aPanicOne.extend( FinaleManager.CalculatePointsByLinearDirection(Vector(-314.024, 5338.731, -4033.777), Vector(-248.732, 5435.349, -4059.894), RandomInt(9, 9), -15, 15 ));
	aPanicOne.extend( FinaleManager.CalculatePointsWithinCircle(Vector(-231.448, 5327.072, -4066.807), 10.0, RandomInt(5, 5)));
	
	//Pause 1
	local aPauseOne = [];
	
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-2414.985, 6684.284, -4213.969), Vector(-2413.858, 6768.543, -4213.969),  RandomInt(11, 11), -45, 45));
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-4391.374, 5531.787, -4085.969),Vector(-4368.015, 5797.983, -4085.969), RandomInt(14, 14), -35, 35));
	
	//First Tank
	AddScriptedTankSpawn(Vector(-150.000, 4900.000, -4479.969));	//consistent spawn in a certain position when you are at -1404.682, 4160.028, -4479.969
	
	local aPanicTwo = [];
	//Panic 2
	aPanicTwo.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-2423.986, 7120.619, -4213.969), Vector(-2439.119, 7003.000, -4213.969),  RandomInt(11, 11), -35, 35));
	aPanicTwo.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-2218.728, 3141.367, -4213.969), Vector(-2178.596, 2932.727, -4213.969),  RandomInt(13, 13), -35, 35 ));
	
	local aPauseTwo = [];
	//Panic 3
	aPauseTwo.extend(FinaleManager.CalculatePointsWithinCircle(Vector(-2031.107, 7316.239, -4060.671), 135.0, RandomInt(15, 15)));
	aPauseTwo.extend( FinaleManager.CalculatePointsWithinCircle(Vector(-187.500, 6200.000, -4080.787), 0.0, RandomInt(8, 9)));
	
	//Second Tank
	AddScriptedTankSpawn(Vector(-2522.163, 6723.793, -3959.969));
	//Third Tank
	AddScriptedTankSpawn(Vector(-1488.736, 7745.538, -4238.984));

	//Executes
	FinaleManager.aPanicSpawnPoints.push(aPanicOne);
	FinaleManager.aPauseSpawnPoints.push(aPauseOne);
	FinaleManager.aPanicSpawnPoints.push(aPanicTwo);
	FinaleManager.aPauseSpawnPoints.push(aPauseTwo);
    
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