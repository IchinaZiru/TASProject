// Squirrel

SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133
DisableAutoClimb();

//SetClientName(Ent("!ellis"), "");
//SetClientName(Ent("!rochelle"), "");

/*local ent;
while (ent = Entities.FindByClassname(ent, "melee_spawn")) ent.Kill();

local ent;
while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();

local ent;
while (ent = Entities.FindByClassname(ent, "weapon_first_aid_kit_spawn")) ent.Kill();*/

Cvars <-
{
	//Campaign Settings
	sv_infinite_ammo = 0
	host_timescale = 1
	sv_cheats = 1
    sv_client_min_interp_ratio = 0
	sv_vote_creation_timer = 0
	sv_player_stuck_tolerance = 0
	director_afk_timeout = 999999
	director_no_death_check = 1
	director_panic_wave_pause_max = 5
	z_mega_mob_size = 50
	sb_all_bot_game = 1
	mp_gamemode = "campaign"
	z_difficulty = "Normal"

	//Director Settings
	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 1
	z_common_limit = 0

	//AI Settings
	nb_blind = 1
	nb_stop = 0
	sb_stop = 0
	
	//ST Settings
	changelevel_inhibit = 0 // put this on 0 if you're gonna record demo, this just disable the map change out
	st_autocb = 1
	st_edgebug = 1
	st_fastreload = 0
};

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	ScriptedItems();
	IncludeScript("modules/tas_kit.nut")
	IncludeScript("st_scripts.nut")
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);
	//foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // activate auto gascan shove
	//ActivateFillBot_OnAdrenalineUse(Ent("!"));               //activate auto use gascan while adrenaline effect
	//g_bTLS = true; // TLS script functions
	//OpenSafeRoomDoor()
	//teleport()
	//teleport2()
	//teleport3()
	//EnableAutoClimb();
	//votetoeasy()
	//votetoexpert()
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
			
}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{
	SayMsg("Finale Started.");
	FinaleManager.Settings.Enabled = true;
	cvar("director_no_bosses", 0);
		cvar("director_no_mobs", 0);
		cvar("director_no_specials", 0);
		cvar("z_common_limit", 30);
		cvar("host_timescale", 0.3);
		cvar("st_fastreload",  1);
		cvar("st_edgebug",  1);
		cvar("nb_blind", 0);
	ST_Idle(Ent("!ellis"), 0.0);
	ScriptedTP(Ent("!ellis"), Ent("!rochelle"), 9.0);
			
			
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


Survivors <- {}; // characters customization


Survivors["ellis"] <-
{
	velocity = Vector(0, 0, 0) 

	health = 100
	buffer = 0.0 
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot0"
		slot0 = 
		{
			weapon = ""
			clip = 0
			ammo = 0
		}
	
		slot1 = 
		{
			weapon = ""
			dual = false
			clip = 15
		}
		//slot2 = ""
		//slot3 = ""
		//slot4 = ""
		//slot5 = ""
	}
	
	Actions = function(hPlayer)
	{
		// do some stuff here
		ST_MR(hPlayer,1,"short_fever_ellis");
		TP (Ent("!ellis"), Vector(-15279.500, 9721.000, -290.107), QAngle(0.000, -25.505, 0.000));
	}
}

Survivors["rochelle"] <-
{
	velocity = Vector(0, 0, 0) 

	health = 100
	buffer = 0.0 
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot0"
		slot0 = 
		{
			weapon = ""
			clip = 0
			ammo = 0
		}
	
		slot1 = 
		{
			weapon = ""
			dual = false
			clip = 15
		}
		//slot2 = ""
		//slot3 = ""
		//slot4 = ""
		//slot5 = ""
	}
	
	Actions = function(hPlayer)
	{
		// do some stuff here
		ST_MR(hPlayer,1,"short_fever_rochelle");
		TP (Ent("!rochelle"), Vector(-15251.500, 9781.000, -290.107), QAngle(0.000, -56.503, 0.000));
	}
}

SpawnTrigger("trigger_area1", Vector(-13887.663, 8872.742, -375.936));

SpawnTrigger("trigger_area2", Vector(-8987.964, 6080.586, -503.829));

SpawnTrigger("trigger_area3", Vector(-7856.908, 5619.432, -380.724));

SpawnTrigger("trigger_area4", Vector(-5356.447, -979.898, -523.759));

SpawnTrigger("trigger_area5", Vector(-1411.182, -6904.656, -322.157));

SpawnTrigger("trigger_area6", Vector(3695.641, -12363.777, -399.703));

SpawnTrigger("trigger_area7", Vector(14026.448, -10364.785, 429.299));
function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		local sName = caller.GetName();
		
		if (sName == "trigger_area1" && activator == Ent("!rochelle"))
		{
			SpawnCommonForCB(Vector(-12279.426, 8257.565, -410.087), QAngle(0.000, 137.685, 0.000), 0.5);
            SpawnCommon("common_male_tankTop_overalls", Vector(-12124.780, 8286.553, -408.773), QAngle(0.0, 125.711, 0.0));
            SpawnCommon("common_male_tankTop_overalls", Vector(-12190.620, 8304.196, -411.720), QAngle(0.0, 110.167, 0.0));
            SpawnCommon("common_male_tshirt_cargos", Vector(-11796.007, 8275.158, -413.679), QAngle(0.0, 181.678, 0.0));
            SpawnCommon("common_male_tshirt_cargos", Vector(-12128.228, 8296.988, -340.742), QAngle(0.0, 194.622, 0.0));
            votetoeasy()
			        caller.Kill()
		}
		if (sName == "trigger_area2")
		{
			local hPlayer = SpawnZombie("tank", Vector(-5752.821289, 6172.212891, 24.946915), false);
            ST_MR(hPlayer, true, "tank");
			SpawnCommon("common_male_tankTop_overalls", Vector(-12279.426, 8257.565, -410.087), QAngle(0.0, 137.685, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-9045.066, 4962.359, -503.829), QAngle(0.0, 58.288, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-8999.247, 4955.993, -503.829), QAngle(0.0, 62.912, 0.0));
SpawnCommon("common_male_tankTop_overalls", Vector(-8932.037, 4974.440, -503.829), QAngle(0.0, 67.887, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-8888.142, 4985.426, -503.829), QAngle(0.0, 72.744, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-8857.553, 4988.469, -503.829), QAngle(0.0, 76.605, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-8817.443, 4987.868, -503.829), QAngle(0.0, 82.037, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-8766.405, 4991.891, -503.829), QAngle(0.0, 89.116, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8725.854, 4985.889, -503.829), QAngle(0.0, 94.763, 0.0));
SpawnCommon("common_male_tankTop_overalls", Vector(-8868.660, 5077.692, -503.829), QAngle(0.0, 71.256, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-8978.447, 5062.159, -503.829), QAngle(0.0, 56.934, 0.0));

					caller.Kill()
		}
		if (sName == "trigger_area3")
		{
			ST_Idle(Ent("!ellis"), 0.0);
			
					caller.Kill()
		}
		if (sName == "trigger_area4")
		{
			ST_Idle(Ent("!ellis"), 0.0);

					caller.Kill()
		}
		if (sName == "trigger_area5")
		{
			ST_Idle(Ent("!ellis"), 0.0);

					caller.Kill()
		}
		if (sName == "trigger_area6")
		{
			ST_Idle(Ent("!ellis"), 0.0);

					caller.Kill()
		}
		if (sName == "trigger_area7")
		{
			ST_Idle(Ent("!ellis"), 0.0);
			        
			        caller.Kill()
		}
	}
}

function ScriptedItems() // spawn stuffs here :D
{
//Remove item with functiontFloat distance

RemoveItemWithin(Vector(), 10.0)
RemoveItemWithin(Vector(), 10.0)
RemoveItemWithin(Vector(), 10.0)


//Weapons




//Start Saferoom




//Items




//End Saferoom




//Finale Items




//Gascan's




//Miscellaneous




}

function SetVelocity()
{
	Ent(1).SetVelocity(Vector());
}

//zombie
function z1()
{
	SayMsg("z1() executed!");
}

function z2()
{	
	
}

function z3()
{
	
}

function z4()
{
	
}

function votetoexpert()
{
	//CallVote(Ent("!"), "Impossible")
	//ClientCommand(Ent("!"), "sm_voteall")
}

function votetoeasy()
{
	CallVote(Ent("!rochelle"), "Easy")
	ClientCommand(Ent("!rochelle"), "sm_voteall")
}


function teleport()
{
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 0.0);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 0.0);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 0.0);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 0.0);
	
	CreateTimer(6.2, function(){ SendToServerConsole("script take1();"); });
	CreateTimer(6.2, function(){ SendToServerConsole("script take2();"); });
	CreateTimer(6.2, function(){ SendToServerConsole("script take3();"); });
	CreateTimer(6.2, function(){ SendToServerConsole("script take4();"); });

	//ScriptedTP(Ent("!"), Ent("!"), 00.0)
	//CreateTimer(0.00, function() { TP (Ent("!"), Vector(), QAngle()); } );


}

function teleport2()
{
	
}

function teleport3()
{
	
}

function take1()
{
	ST_Idle(GetOwner("!nick"), true);
}

function take2()
{
	ST_Idle(GetOwner("!ellis"), true);
}

function take3()
{
	ST_Idle(GetOwner("!coach"), true);
}

function take4()
{
	ST_Idle(GetOwner("!rochelle"), true);
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
		SayMsg("Horde incoming! Get in position and prepare your throwables!");
	}
	else if (iType == TANK)
	{
		SayMsg("The Tank has spawned! Kill him as fast as you can!");
	}
	else if (iType == DELAY)
	{
		SayMsg("The Tank is about to spawn! Get in position!");
	}
}

function Countdown_Think()
{
    local hPlayer;
    while (hPlayer = Entities.FindByClassname(hPlayer, "player"))
    {
        if (hPlayer.IsSurvivor())
        {
            NetProps.SetPropInt(hPlayer, "m_fFlags", NetProps.GetPropInt(hPlayer, "m_fFlags") | FL_FROZEN);

            if (g_bBeginMap)
                continue;

            local tInv = {};
            GetInvTable(hPlayer, tInv);
        }
    }
}


		/*===============================*\
		 *     CBasePlayer Buttons       *
		\*===============================*/

		const IN_ATTACK = 1
		const IN_JUMP = 2
		const IN_DUCK = 4
		const IN_FORWARD = 8
		const IN_BACK = 16
		const IN_USE = 32
		const IN_CANCEL = 64
		const IN_LEFT = 128
		const IN_RIGHT = 256
		const IN_MOVELEFT = 512
		const IN_MOVERIGHT = 1024
		const IN_ATTACK2 = 2048
		const IN_RUN = 4096
		const IN_RELOAD = 8192
		const IN_ALT1 = 16384
		const IN_ALT2 = 32768
		const IN_SCORE = 65536
		const IN_SPEED = 131072
		const IN_WALK = 262144
		const IN_ZOOM = 524288
		const IN_WEAPON1 = 1048576
		const IN_WEAPON2 = 2097152
		const IN_BULLRUSH = 4194304
		const IN_GRENADE1 = 8388608
		const IN_GRENADE2 = 16777216
		const IN_ATTACK3 = 33554432

//============================================================

//end;

//============================================================
RemoveItemWithin(Vector(-12820.500, 7965.000, -296.580), 10)
RemoveItemWithin(Vector(-3740.000, 4367.000, -349.772), 10)
RemoveItemWithin(Vector(-5130.500, -2399.000, -476.478), 10)
RemoveItemWithin(Vector(13665.156, -8905.375, 138.844), 10)
RemoveItemWithin(Vector(13648.875, -8890.969, 131.156), 10)

SpawnItem("grenade_launcher", Vector(-12820.500, 7965.000, -296.580), QAngle(0.000, 59.985, 0.000), 1);


SpawnItem("vomitjar", Vector(-3740.000, 4367.000, -349.772), QAngle(0.000, 0.000, 0.000), 1);

SpawnItem("adrenaline", Vector(-5130.500, -2399.000, -476.478), QAngle(0.000, 0.000, 0.000), 1);

SpawnItem("gascan", Vector(13665.156, -8905.375, 138.844), QAngle(358.638, 287.007, 0.571), -1);

SpawnItem("gascan", Vector(13648.875, -8890.969, 131.156), QAngle(271.538, 143.965, 223.726), -1);