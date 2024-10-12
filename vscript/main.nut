// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
//SetClientName(Ent("!ellis"), "");
//SetClientName(Ent("!nick"), "");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
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
    
	st_fastreload = 0
	st_edgebug = 0
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin =  Vector(-12564.000, 10464.000, 244.893) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -8.998, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = // secondary weapon
		{
			weapon = ""
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(-12539.035, 10431.743, 244.893) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -25.499, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = // secondary weapon
		{
			weapon = ""
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(-12540.000, 10512.000, 247.684) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.841, -51.258, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = // secondary weapon
		{
			weapon = ""
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-12512.000, 10496.000, 244.893) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, -56.497, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = // secondary weapon
		{
			weapon = ""
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
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
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
	}
}


function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);

	//first ci dump
	ci1();
	
	CreateTimer(3.0, function()
	{ 
		Zcb_EllisAndCoach();
	});

	CreateTimer(8.566, function()
	{ 
		//Second ci dump
		ci2();
		cvar("host_timescale", 0.25);
	});

	CreateTimer(10.0, function()
	{ 
		//Third ci dump
		ci3();
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


RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("gascan"); RemoveItemByName("defibrillator"); RemoveItemByName("adrenaline");
RemoveItemByName("pain_pills"); RemoveItemByName("upgradepack_explosive"); RemoveItemByName("upgradepack_incendiary"); 
RemoveItemByName("chainsaw"); RemoveItemByName("grenade_launcher"); RemoveItemByName("vomitjar");
			//------------------ House ------------------//
//ベット付近
SpawnItem("grenade_launcher", Vector(-10081.000, 8680.000, 238.420), QAngle(0.000, 59.985, 0.000), 1); 
//台上
SpawnItem("vomitjar", Vector(-9960.000, 8952.000, 233.446), QAngle(0.000, 0.000, 0.000), 1);
//出入口付近
SpawnItem("vomitjar", Vector(-9824.000, 8768.000, 197.228), QAngle(0.000, 0.000, 0.000), 1);

			//------------------ House2 ------------------//
SpawnItem("molotov", Vector(-9184.000, 9262.000, 148.933), QAngle(0.000, 0.000, 0.000), 1) //for ellis

			//------------------ Truck House ------------------//
SpawnItem("grenade_launcher", Vector(-7547.969, 6615.844, 60.139), QAngle(0.000, 59.985, 0.000), 1);
SpawnItem("defibrillator", Vector(-7552.000, 6568.000, 32.460), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("vomitjar", Vector(-7552.000, 6688.000, 95.228), QAngle(0.000, 0.000, 0.000), 1);

			//------------------ Trigger ------------------//
SpawnItem("vomitjar", Vector(-5715.000, 6559.000, 71.853), QAngle(0.000, 0.000, 0.000), 1);


// ==================== Custom Functions =========================== //

function ci1()
{
	SpawnCommonForCB(Vector(-12035.869, 9080.462, 164.146), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2); //useRochelle
	SpawnCommonForCB(Vector(-11685.096, 9128.606, 168.299), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2);
}

function Zcb_EllisAndCoach()
{
	SpawnCommonForCB(Vector(-11562.463, 9333.750, 165.984), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2); //useEllis And Coach
	SpawnCommonForCB(Vector(-11162.560, 9578.088, 159.841), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2); //useEllis 
	SpawnCommonForCB(Vector(-11250.271, 9351.630, 160.604), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2);//useRochelle
}

function ci2()	//Spawn IDLE Zombies
{
	SpawnCommonForCB(Vector(-9469.658, 8658.974, 120.536), QAngle(0.000, 97.078, 0.000));	//useNick
	//SpawnCommonForCB(Vector(-8564.164, 8984.528, 92.047), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2); //useEllis
}

function ci3()
{
	SpawnCommonForCB(Vector(-7422.163, 6699.990, 32.031), QAngle(0.000, 59.301, 0.000)); //IDLE zombi
}
