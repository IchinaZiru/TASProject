// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Azure");
SetClientName(Ent("!rochelle"), "昼下がり気分");

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
	st_edgebug = 1
	st_idle_anytime = 1
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-2277.795, -390.299, -255.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 29.776, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 46
	buffer = 40.549 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_spas"
			clip = 10
			ammo = 83
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "upgradepack_explosive" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-2320.413, -361.927, -255.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(344.960, 13.376, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 99
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 25
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 10
		}
		slot2 = "pipe_bomb" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "r");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
RemoveItemByName("pistol");

SpawnItem("pain_pills", Vector(1000.000, -1000.000, -61.376), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnTrigger("vote1", Vector(-2088.855, -520.038, -255.969));
SpawnTrigger("vote2", Vector(-607.334, -502.345, 1.821));
SpawnTrigger("vote3", Vector(80.927, -2392.784, 598.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "vote3"&& activator == Ent("!coach"))
		{
         EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"callvote changedifficulty Impossible\");", 0.000);
		 //SendToServerConsole("callvote changedifficulty Impossible");
         SendToServerConsole("sm_voteall");
		}
		else if (sName == "vote1"&& activator == Ent("!coach"))
		{
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"callvote changedifficulty Impossible\");", 0.000);
			//SendToServerConsole("callvote changedifficulty Impossible");
            SendToServerConsole("sm_voteall");
		}
		else if (sName == "vote2"&& activator == Ent("!rochelle"))
		{
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"callvote changedifficulty Easy\");", 0.000);
			//SendToServerConsole("callvote changedifficulty Easy");
            SendToServerConsole("sm_voteall");
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
	cvar("host_timescale", 0.5);OpenSafeRoomDoor();
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 35.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 41.111);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 44.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 50.033);

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
