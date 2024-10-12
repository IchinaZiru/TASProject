//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//Created By Sw1ft: https://steamcommunity.com/id/alkashproduction

SkipIntro();

SetPreviousSegmentTime(0.0); // put previous map segment time. Ex: 24.833

//========================================================================================================================
//Delete Custom Campaigns's Intros
//========================================================================================================================

/*EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);*/

//========================================================================================================================


//timer 19.8s
//45.800
//EntFire("info_changelevel", "Disable");

Cvars <-
{
	// Game
	mp_gamemode = "Coop"
	z_difficulty = "Easy"
	host_timescale = 1.0
	god = 0
	sv_infinite_ammo = 0
	sv_client_min_interp_ratio = 0

	// AI
	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 1
	z_common_limit = 0

	nb_blind = 0
	nb_stop = 0
	sb_stop = 0

	// ST
	st_autocb = 1
	st_edgebug = 1
	st_fastreload = 0

};

SetClientName(Ent("!francis"), "rudd1y");
SetClientName(Ent("!zoey"), "ICHINA");
SetClientName(Ent("!bill"), "萌新野生菌");
SetClientName(Ent("!louis"), "名字改Frenzy");

Survivors <- {}; // characters customization

Survivors["louis"] <-
{
	origin = Vector(7066.020, -3952.000, 66.031)
	angles = QAngle(0.000, 91.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ls1_louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["bill"] <-
{
	origin = Vector(7106.000, -3954.350, 66.031)
	angles = QAngle(0.000, 91.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ls1_bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["francis"] <-
{
	origin = Vector(7103.630, -3997.330, 66.031)
	angles = QAngle(0.000, 91.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ls1_francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
	}
}

Survivors["zoey"] <-
{
	origin = Vector(7066.620, -3998.010, 66.031)
	angles = QAngle(0.000, 91.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ls1_zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

SpawnTrigger("spitter",Vector(-4098.752, 2234.313, -107.969));


function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "spitter")
		{
			local hPlayer = SpawnZombie("spitter", Vector(-2666.391, 2194.384, -262.969), true);
            ST_MR(hPlayer, true, "m1_spitter");
			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn

	foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove


}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	CreateTimer(0.000, function()
			{
				z1();
			});

	cvar("host_timescale", 0.25);
	DisableAutoClimb();

	/*
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");
			*/

		//timer 19.833

		CreateTimer(37.800, function()
{
	z2();
});

//37.466
//warp louis -> francis
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 29.679);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 37.567);
w//warp -> zoey -> louis
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 30.967);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 37.803);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!francis\")), true)", 37.800);
CreateTimer(37.833, function()	//francis kick
	{
		::AutoKick(Ent(1), Ent("!francis")); //Make sure francis Ent is herself
	});

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 37.378);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 37.867);
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!francis\"), \"sm_idle\");", 37.567);

//warp bill -> zoey
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 38.670);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 44.767);


}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{

}

::OnGameEvent_player_first_spawn <- function(event)
{
    local hPlayer = GetPlayerFromUserID(event.userid);
    if(hPlayer.GetZombieType() == 4)//Smoker = 1, Boomer = 2, Hunter = 3, Spitter = 4, Jockey = 5, Charger = 6, Tank = 8, Survivor = 9
    {
    ST_MR(hPlayer, true, "m1_spit");
    }
}

function z1()
{

	SpawnCommon("common_female_tshirt_skirt", Vector(7441.359, -4369.418, 64.031), QAngle(0.000, 159.199, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(7088.880, -4368.405, 64.031), QAngle(0.0, 243.430, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(6975.000, -4056.679, 74.031), QAngle(0.0, 242.858, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(7864.242, -4341.355, 75.307), QAngle(0.0, 25.487, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(7887.112, -4236.271, 74.606), QAngle(0.0, 239.574, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(7882.316, -4592.267, 74.031), QAngle(0.0, 266.883, 0.0));
//SpawnCommon("common_female_tshirt_skirt", Vector(8035.398, -4369.699, 75.496), QAngle(0.0, 36.441, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6744.837, -3728.834, 75.543), QAngle(0.0, 158.603, 0.0));
//SpawnCommon("common_male_tshirt_cargos", Vector(8173.127, -4861.454, 74.031), QAngle(0.0, 149.152, 0.0));
//SpawnCommon("common_female_tankTop_jeans", Vector(8257.062, -4821.543, 74.031), QAngle(0.0, 21.061, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(8450.000, -4419.519, 110.031), QAngle(0.0, 309.961, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6933.005, -3923.992, 74.925), QAngle(0.0, 359.938, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(7012.500, -3850.000, 74.031), QAngle(0.0, 20.481, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6987.500, -3687.500, 75.366), QAngle(0.0, 40.918, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(6862.500, -3650.000, 75.031), QAngle(0.0, 232.705, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6996.682, -3562.914, 74.031), QAngle(0.0, 126.350, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6997.000, -3589.266, 74.031), QAngle(0.0, 44.118, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6460.011, -3583.048, 76.031), QAngle(0.0, 178.089, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6862.500, -3512.500, 71.531), QAngle(0.0, 282.016, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6487.500, -3412.500, 76.031), QAngle(0.0, 202.493, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(6437.500, -3350.000, 76.031), QAngle(0.0, 297.740, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6487.500, -3312.500, 69.031), QAngle(0.0, 308.621, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(6809.626, -3259.806, 182.905), QAngle(0.0, 16.540, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6487.500, -3275.000, 64.031), QAngle(0.0, 190.679, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6437.500, -3237.500, 69.031), QAngle(0.0, 236.279, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(6026.857, -3358.618, 76.031), QAngle(0.0, 129.114, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(6437.500, -3212.500, 64.031), QAngle(0.0, 13.637, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(6950.000, -3057.271, 64.507), QAngle(0.0, 8.652, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(7097.901, -3005.377, 64.031), QAngle(0.0, 108.388, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(6818.803, -3184.468, 183.092), QAngle(0.0, 270.850, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(8528.284, -5031.045, 64.031), QAngle(0.0, 86.549, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(8478.662, -4962.973, 64.031), QAngle(0.0, 66.386, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(8708.935, -5080.868, 64.031), QAngle(0.0, 122.815, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9331.688, -5399.029, 64.031), QAngle(0.0, 143.804, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(8923.817, -5123.071, 64.031), QAngle(0.0, 141.671, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9055.960, -5033.737, 66.031), QAngle(0.0, 157.499, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9451.816, -4911.490, 66.031), QAngle(0.0, 174.290, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9282.126, -4871.212, 66.031), QAngle(0.0, 176.079, 0.0));

	SayMsg("z1 executed");
}

function z2()
{
	SpawnCommon("common_female_tankTop_jeans", Vector(6209.714, -2634.974, 66.031), QAngle(0.0, 339.128, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-3475.793, 2302.859, -107.969), QAngle(0.0, 191.669, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-3623.454, 2565.086, -107.969), QAngle(0.0, 227.866, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-3749.107, 2254.385, -63.486), QAngle(0.0, 195.178, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-3847.364, 2505.137, -107.969), QAngle(0.0, 250.644, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-3806.062, 2341.097, -107.969), QAngle(0.0, 223.737, 0.0));
SayMsg("z2 executed");
}

function z3()
{

}

function z4()
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

	local PAUSE = 0;

	if (iType == PANIC)
	{
	}
	else if (iType == TANK)
	{
	}
	else if (iType == DELAY)
	{
	}
	else if (iType == PAUSE)
	{
	}
}

//spawn items here


SpawnItem("vomitjar", Vector(5546.000, -2326.000, 60.228), QAngle(0.000, 0.000, 0.000), 1,3.0);
//SpawnItem("molotov", Vector(5564.000, -1892.000, 60.167), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("vomitjar", Vector(5163.000, -2524.000, 59.933), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(5564.000, -1892.000, 60.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);

//for bill

SpawnItem("autoshotgun", Vector(7251.625, -1867.781, 66.969), QAngle(0.044, 227.637, 270.308), 5, 3.0);
SpawnItem("molotov", Vector(7284.000, -1822.000, 116.136), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(7330.000, -1820.000, 111.249), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("fireaxe", Vector(7212.000, -1631.000, 67.000), QAngle(0.000, 40.518, 270.000), 5, 3.0);

//saferoom

//hidari
SpawnItem("rifle_ak47", Vector(-560.250, 3182.000, -232.781), QAngle(0.132, 43.330, 270.835), 5, 3.0);
//migi
SpawnItem("shotgun_spas", Vector(-537.000, 3199.000, -233.031), QAngle(359.912, 228.999, 269.956), 5, 3.0);
RemoveItemByName("rifle_desert");

//45.800 ideal
////47.947 louis stuck TP