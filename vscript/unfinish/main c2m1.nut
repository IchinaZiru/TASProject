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
	z_difficulty = "Impossible"

	director_no_bosses = 0
	director_no_mobs = 0
	director_no_specials = 0

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
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
			clip = null
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "coach");
		//cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(10715.983, 7908.000, -542.473) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 159.494, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			clip = null
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
		SpawnZombie("tank", Vector(-1041.633, 298.099, -1512.622));
	}
}

SpawnTrigger("cb", Vector(9779.111, 7934.681, -514.563));
SpawnTrigger("tank", Vector(559.128, 1803.608, -1698.373));
//SpawnTrigger("tanksp", Vector(2936.698, 3506.391, -967.969));

RemoveItemByName("propanetank");
RemoveItemByName("gascan");

SpawnItem("vomitjar", Vector(1692.500, 2321.531, -1348.551), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("adrenaline", Vector(1757.563, 2331.438, -1348.791), QAngle(0.000, 0.000, 0.000), 1, 3.0);

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb" && activator == Ent("!ellis"))
		{
		//SpawnCommonForCB(Vector(8580.699, 7896.346, -551.557), QAngle(0.000, 336.030, 0.000));
		SpawnCommonForCB(Vector(8559.772, 7890.625, -552.784), QAngle(0.000, 357.644, 0.000));
		SpawnCommonForCB(Vector(7563.072, 7612.232, -630.386), QAngle(0.000, 14.415, 0.000));
		}
		else if (sName == "tank" && activator == Ent("!ellis"))
		{
			SendToServerConsole("z_allow_ai_to_use_abilities 0");
			SendToServerConsole("callvote changedifficulty Easy");
                    SendToServerConsole("sm_voteall");
		}
		else if (sName == "tanksp")
		{
						SpawnZombie("boomer", Vector(-1041.633, 298.099, -1512.622));
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);
}

function OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function OnFinaleStart() // do some stuff when a finale event has been started
{

}

function OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBeginCustomStage(iNum, iType)
{
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
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
