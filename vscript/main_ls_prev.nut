//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//Created By Sw1ft: https://steamcommunity.com/id/alkashproduction

SkipIntro();

SetPreviousSegmentTime(48.133); // put previous map segment time. Ex: 24.833

//========================================================================================================================
//Delete Custom Campaigns's Intros
//========================================================================================================================

/*EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);*/

//========================================================================================================================

EntFire("info_changelevel", "Enable");

Cvars <- {
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


/*
SetClientName(Ent("!francis"), "サムライサム");
SetClientName(Ent("!bill"), "happyskillch");
SetClientName(Ent("!zoey"), "noobs_gang");
SetClientName(Ent("!louis"), "ICHINA");
*/

Survivors <- {}; // characters customization

Survivors["bill"] <- {
	origin = Vector(10046.373, 9044.616, 72.031)
	angles = QAngle(5.299, 117.291, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory = {
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = "smg_silenced"
			clip = 50
			ammo = 650
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 8
		}

		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["louis"] <- {
	origin = Vector(9957.872, 9138.598, 72.031)
	angles = QAngle(-1.308, 78.017, 0.000)
	velocity = null

	health = 94
	buffer = 0.0
	revives = null
	idle = false

	Inventory = {
		active_slot = "slot0"

		slot0 = // primary weapon
		{
			weapon = "smg_silenced"
			clip = 50
			ammo = 650
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 8
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["zoey"] <- {
	origin = Vector(10105.425, 9011.621, 72.031)
	angles = QAngle(2.477, 152.512, 0.000)
	velocity = null

	health = 61
	buffer = 0.0
	revives = null
	idle = false

	Inventory = {
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = "smg_silenced"
			clip = 50
			ammo = 650
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 4
		}

		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
	}
}

Survivors["francis"] <- {
	origin = Vector(9952.396, 9094.545, 72.031)
	angles = QAngle(4.605, 76.947, 0.000)

	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory = {
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

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

function OnTriggerTouch() {
	if (activator && activator.IsSurvivor() && !g_bRestarting) {
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1") {

			caller.Kill();
		} else if (sName == "trigger_area2") {

			caller.Kill();
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn

	foreach(idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove

}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	z1();
	cvar("host_timescale", 0.5);
	DisableAutoClimb();
	/*
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");
	*/

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 17.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 23.100);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 25.633);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 25.433);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 29.667);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 29.089);

	CreateTimer(23.000, function() {
		cvar("host_timescale", 0.15);
		SayMsg("francis walk 24.233 throw 24.833 jump 24.567");
	});

	/*
	CreateTimer(26.000, function()
	{
		::AutoKick(Ent("!zoey"), Ent("!francis")); //Make sure Ellis Ent is himself
	});
	CreateTimer(32.000, function()
	{
		::AutoKick(Ent("!louis"), Ent("!bill")); //Make sure Ellis Ent is himself
	});
	*/
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

function Callbacks::OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D) {

}

function Callbacks::OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D) {

}

function Callbacks::OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D) {

}

function Callbacks::OnBeginCustomStage(iNum, iType) {
	local ERROR = -1;
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	local SCRIPTED = 3;

	local PAUSE = 0;

	if (iType == PANIC) {} else if (iType == TANK) {} else if (iType == DELAY) {} else if (iType == PAUSE) {}
}

local ent;
while (ent = Entities.FindByClassname(ent, "melee_spawn")) ent.Kill();

RemoveItemByName("gascan_scavenge");
RemoveItemByName("gascan");
RemoveItemByName("oxygentank");
RemoveItemByName("propanetank");

SpawnItem("pipe_bomb", Vector(8397.000, 11012.000, 69.901), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(7777.000, 7934.000, 108.696), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(7190.000, 7461.000, 121.136), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(7300.000, 7411.000, 121.136), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(7405.000, 7009.000, 76.901), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(8304.000, 5092.000, 69.792), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("grenade_launcher", Vector(7664.000, 5782.000, 74.139), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("sniper_military", Vector(8919.000, 4734.969, 129.750), QAngle(358.945, 55.503, 270.220), 5, 3.0);

function z1() {
	SpawnCommon("common_male_tshirt_cargos", Vector(9904.475, 9784.725, 74.031), QAngle(0.000, 188.485, 0.000));
	SpawnCommon("common_female_tshirt_skirt", Vector(10025.000, 9806.771, 74.031), QAngle(0.000, 257.212, 0.000));
	SpawnCommon("common_male_tankTop_jeans", Vector(9825.000, 9475.000, 188.031), QAngle(0.000, 343.982, 0.000));
	SpawnCommon("common_female_tankTop_jeans", Vector(9787.500, 9487.500, 196.031), QAngle(0.000, 14.616, 0.000));
	//SpawnCommon("common_female_tshirt_skirt", Vector(9670.555, 9795.692, 74.031), QAngle(0.000, 66.912, 0.000));
	//SpawnCommon("common_female_tshirt_skirt", Vector(9662.500, 9862.500, 74.031), QAngle(0.000, 171.787, 0.000));
	SpawnCommon("common_female_tankTop_jeans", Vector(9957.118, 9792.007, 74.031), QAngle(0.000, 290.684, 0.000));
	SpawnCommon("common_female_tshirt_skirt", Vector(9915.252, 9820.281, 74.031), QAngle(0.000, 184.472, 0.000));
	//SpawnCommon("common_male_tshirt_cargos", Vector(9600.000, 9587.500, 82.031), QAngle(0.000, 177.929, 0.000));
	//SpawnCommon("common_male_dressShirt_jeans", Vector(9622.175, 10214.956, 74.031), QAngle(0.000, 245.650, 0.000));
	SpawnCommon("common_male_tshirt_cargos", Vector(9562.500, 9900.000, 74.031), QAngle(0.000, 297.795, 0.000));
}