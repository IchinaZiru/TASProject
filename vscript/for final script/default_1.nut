//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//created By Sw1ft: https://steamcommunity.com/id/alkashproduction

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

EntFire("info_changelevel", "Disable");

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
	st_edgebug = 0
	st_fastreload = 0
};

SetClientName(Ent("!nick"), "");
SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!coach"), "");
SetClientName(Ent("!ellis"), "");

Survivors <- {}; // characters customization

Survivors["coach"] <-
{
	origin = null
	angles = null
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
			weapon = ""
			dual = false
			clip = 0
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking. 
	}
}

Survivors["ellis"] <-
{
	origin = null
	angles = null
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
			weapon = ""
			dual = false
			clip = 0
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["nick"] <-
{
	origin = null
	angles = null
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
			weapon = ""
			dual = false
			clip = 0
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
	}
}

Survivors["rochelle"] <-
{
	origin = null
	angles = null
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
			weapon = ""
			dual = false
			clip = 0
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
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

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{
			
			caller.Kill();
		}
	}
}

//========================================================================================================================
//tFunctions | By: DarkNe$$
//========================================================================================================================

__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener); // this will collect every function that includes In-Game Events

// Spawning
//========================================================================================================================
//========================================================================================================================

::__SpawnZombie <- function(sName, vecPos = null, idle = false)
{
	local hTable =
	{
		infected = ZOMBIE_NORMAL
		mob = ZSPAWN_MOB
		tank = ZOMBIE_TANK
		witch = ZOMBIE_WITCH
		witch_bride = ZSPAWN_WITCHBRIDE
		hunter = ZOMBIE_HUNTER
		smoker = ZOMBIE_SMOKER
		boomer = ZOMBIE_BOOMER
		jockey = ZOMBIE_JOCKEY
		charger = ZOMBIE_CHARGER
		spitter = ZOMBIE_SPITTER
	}
	if (hTable.rawin(sName))
	{
		local sClass = sName;
		if (["infected", "witch", "witch_bride"].find(sName) == null) sClass = "player";
		else if (sName == "witch_bride")
		{
			sClass = "witch";
			Entities.First().PrecacheModel("models/infected/witch_bride.mdl");
		}
		local entList = [];
		local hEntity = null;
		while ((hEntity = Entities.FindByClassname(hEntity, sClass)) != null) entList.append(hEntity);
		ZSpawn({type = hTable.rawget(sName), pos = vecPos});
		while ((hEntity = Entities.FindByClassname(hEntity, sClass)) != null)
		{
			if (entList.find(hEntity) == null)
			{
				if (idle)
				{
					if (hEntity.IsPlayer()) hEntity.SetSenseFlags(BOT_CANT_FEEL | BOT_CANT_HEAR | BOT_CANT_SEE);
					else ReapplyInfectedFlags(INFECTED_FLAG_CANT_SEE_SURVIVORS | INFECTED_FLAG_CANT_HEAR_SURVIVORS | INFECTED_FLAG_CANT_FEEL_SURVIVORS, hEntity);
				}
				return hEntity;
			}
		}
		return null;
	}
	return error(format("[SpawnZombie] Invalid name '%s' specified.\n", sName));
}

/*__SpawnZombie( "infected", Vector(), false);*/

//How to spawn uncommon zombies ex. Fallen Survivor

::__SpawnCommon <- function(sName = null, vecPos = null, vecAng = null, flags = 1)
{
	const FALLEN_VJAR_OR_MOLOTOV = 1;
	const FALLEN_PIPE = 2;
	const FALLEN_PILLS = 4;
	const FALLEN_MEDKIT = 8;
	local cvar1 = Convars.GetFloat("z_forcezombiemodel"), cvar2 = Convars.GetFloat("z_fallen_max_count"), cvar3 = Convars.GetStr("z_forcezombiemodelname");
	Convars.SetValue("z_forcezombiemodel", 1);
	Convars.SetValue("z_fallen_max_count", 30);
	if (type(sName) == "string") Convars.SetValue("z_forcezombiemodelname", sName);
	else Convars.SetValue("z_forcezombiemodelname", sName ? "common_male_fallen_survivor" : "common_male_ceda");
	if (vecAng == null) vecAng = Vector(0, RandomInt(0, 360), 0);
	local hEntity = __SpawnZombie("infected");
	if (hEntity)
	{
		if (vecPos) hEntity.SetOrigin(vecPos);
		hEntity.SetAngles(QAngle(0, vecAng.y, 0));
		NetProps.SetPropInt(hEntity, "m_nFallenFlags", flags);
	}
	else error("Unable to spawn common infected due to limit.\n");
	Convars.SetValue("z_forcezombiemodel", cvar1.tointeger());
	Convars.SetValue("z_fallen_max_count", cvar2.tointeger());
	Convars.SetValue("z_forcezombiemodelname", cvar3);
	return hEntity;
}

/*__SpawnCommon( "common_male_fallen_survivor", Vector(), QAngle(), 1 | 2 | 4 | 8);*/

//========================================================================================================================
//========================================================================================================================

::OnGameEvent_weapon_fire <- function(event)
{
	local player = GetPlayerFromUserID(event.userid);
	{
		EntFire(player, "RunScriptCode", "NetProps.SetPropInt(self, \"m_afButtonForced\", NetProps.GetPropInt(self, \"m_afButtonForced\") | IN_ATTACK);", 0.0);
        EntFire(player, "RunScriptCode", "NetProps.SetPropInt(self, \"m_afButtonForced\", NetProps.GetPropInt(self, \"m_afButtonForced\") & ~IN_ATTACK);", 0.010);
	}
}

::OnGameEvent_player_first_spawn <- function(event)
{
	local player;
	
	while (player = Entities.FindByClassname(player, "player"))
	{
		if (player.GetZombieType() == 8)  // Smoker = 1, Boomer = 2, Hunter = 3, Spitter = 4, Jockey = 5, Charger = 6, Witch = 7, Tank = 8
		{
			ST_MR(player, 0, "campaign/m1_tank");
		}
	}
}

idle01 <- function()
{
	ST_Idle(Ent("!nick"));
	ST_Idle(Ent("!bill"));
}

idle02 <- function()
{
	ST_Idle(Ent("!rochelle"));
	ST_Idle(Ent("!zoey"));
}

idle03 <- function()
{
	ST_Idle(Ent("!coach"));
	ST_Idle(Ent("!louis"));
}

idle04 <- function()
{
	ST_Idle(Ent("!ellis"));
	ST_Idle(Ent("!francis"));
}

idletake <- function(hPlayer)
{
	if (hPlayer != null)
	{
		ST_Idle(GetOwner(hPlayer), true);
	}
	
	/*script idletake("!")*/
}

idlereplace <- function(value = null)
{
	if (value == null) return;
	else if (value == 1)
	{
		ST_PlayerReplace("!nick", "!rochelle");
	}
	else if (value == 2)
	{
		ST_PlayerReplace("!rochelle", "!coach");
	}
	else if (value == 3)
	{
		ST_PlayerReplace("!coach", "!ellis");
	}
	
	/*script idlereplace(1,2,3...)*/
}


/*TakeNearestItem( Ent("!"), true, false, true, "weapon_pipebomb" );*/

/*ActivateFillBot_OnAdrenalineUse(Ent("!nick")); //for fake id (Ent(2) is an example.*/

/*SpawnCommonWithBile(Vector(), QAngle());*/

/*SpawnCommonForCB(Vector(), QAngle(), 0, null, false)*/

//========================================================================================================================
//tItems
//========================================================================================================================

/*EntFire("weapon_name", "Kill", 0.1); <- Removes Item By c_base class/entity */ 

function tItems()
{
	CreateTimer(0.002, function()
	{
		RemoveItemWithin(Vector(), 100000);

		CreateTimer(0.017, function()
		{
			//items
		});
	});
}

//========================================================================================================================
//========================================================================================================================

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	tItems();
	
	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn
	foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove
	
	cvar("host_timescale", 0.25);
	DisableAutoClimb();
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");
	
	CreateTimer(0.000, function()
	{
		OpenSafeRoomDoor(); /*OpenSafeRoomDoor(bool bOpen = false) | CloseSafeRoomDoor(bool bBeginningDoor = true)*/
	});
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{
	SayMsg("Finale Started.");
	FinaleManager.Settings.Enabled = true;
	CreateTimer(0.1, function()
	{
		SendToServerConsole("st_fastreload 123456789");
		SendToServerConsole("z_common_limit 30");
		SendToServerConsole("r_drawothermodels 2");
		SendToServerConsole("director_no_mobs 0");
		SendToServerConsole("director_no_specials 0");
		
		CreateTimer(0.017, function()
		{
			SayMsg(format("Scripted Mobs: %.03f", PrintCurrentTime()));
		});
	});
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
    aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(),Vector(), RandomInt(8, 8), -35, 35));
	aPanicOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(),Vector(), RandomInt(8, 8), -35, 35));

	aPanicOne.extend( FinaleManager.CalculatePointsByLinearDirection(Vector(), Vector(), RandomInt(9, 9), -15, 15 ));
	aPanicOne.extend( FinaleManager.CalculatePointsWithinCircle(Vector(), 10.0, RandomInt(5, 5)));
	
	//Pause 1
	local aPauseOne = [];
	
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(), Vector(),  RandomInt(11, 11), -45, 45));
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(),Vector(), RandomInt(14, 14), -35, 35));
	
	//First Tank
	AddScriptedTankSpawn(Vector());	//consistent spawn in a certain position when you are at -1404.682, 4160.028, -4479.969
	
	local aPanicTwo = [];
	//Panic 2
	aPanicTwo.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(), Vector(),  RandomInt(11, 11), -35, 35));
	aPanicTwo.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(), Vector(),  RandomInt(13, 13), -35, 35 ));
	
	local aPauseTwo = [];
	//Panic 3
	aPauseTwo.extend(FinaleManager.CalculatePointsWithinCircle(Vector(), 135.0, RandomInt(15, 15)));
	aPauseTwo.extend( FinaleManager.CalculatePointsWithinCircle(Vector(), 0.0, RandomInt(8, 9)));
	
	//Second Tank
	AddScriptedTankSpawn(Vector());
	//Third Tank
	AddScriptedTankSpawn(Vector());

	//Executes
	FinaleManager.aPanicSpawnPoints.push(aPanicOne);
	FinaleManager.aPauseSpawnPoints.push(aPauseOne);
	FinaleManager.aPanicSpawnPoints.push(aPanicTwo);
	FinaleManager.aPauseSpawnPoints.push(aPauseTwo);
    
}