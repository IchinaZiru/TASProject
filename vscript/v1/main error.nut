// Squirrel

//SkipIntro(); // skip intro of a custom campaign if such is defined

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

Cvars <- // console variables manager; format: cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	director_no_bosses = 1
	director_no_mobs = 1
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
};

Survivors <- {}; // characters customization

Survivors["coach"]
{
	origin = Vector(2046.920, 1628.200, 1152.031) 
	angles = QAngle(0.000, -0.500, 0.000) 
	velocity = null 

	health = 100
	buffer = 0.0 
	revives = null // count of revives (2 - black&white)
	idle = false

        Inventory =
	{
		active_slot = "slot1"
		slot0 = 
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = 
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" 
		slot3 = ""
		slot4 = "" 
		//slot5 = "gascan"
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "coach");
		//cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"]
{
	origin = Vector(2046.410, 1684.210, 1152.031)
	angles = QAngle(0.000, -0.500, 0.000) 
	velocity = null 

	health = 100
	buffer = 0.0 
	revives = null // count of revives (2 - black&white)
	idle = false

        Inventory =
	{
		active_slot = "slot1"
		slot0 = 
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = 
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" 
		slot3 = ""
		slot4 = "" 
		//slot5 = "gascan"
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "ellis");
		//cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"]
{
	origin =  Vector(2143.440, 1678.493, 1152.031)
	angles =  QAngle(6.950, -7.800, 0.000)
	velocity = null 

	health = 100
	buffer = 0.0 
	revives = null // count of revives (2 - black&white)
	idle = false

        Inventory =
	{
		active_slot = "slot1"
		slot0 = 
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = 
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" 
		slot3 = ""
		slot4 = "" 
		//slot5 = "gascan"
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "nick");
		//cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"]
{
	origin = Vector(2096.900, 1625.770, 1152.031) 
	angles = QAngle(0.000, -0.500, 0.000) 
	velocity = null 

	health = 100
	buffer = 0.0 
	revives = null // count of revives (2 - black&white)
	idle = false

        Inventory =
	{
		active_slot = "slot1"
		slot0 = 
		{
			weapon = ""
			clip = null
			ammo = null
			
		}
		slot1 = 
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" 
		slot3 = ""
		slot4 = "" 
		//slot5 = "gascan"
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "rochelle");
		//cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1"&& activator == Ent("!"))
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
	cvar("host_timescale", 0.5);
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