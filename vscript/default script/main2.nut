// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!louis"), "");
//SetClientName(Ent("!zoey"), "");
//SetClientName(Ent("!francis"), "");
//SetClientName(Ent("!bill"), "");

Cvars <-  // console variables manager; format:  cvar_name = value(string or number)
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

	};

Survivors <- {}; // characters customization

Survivors["louis"] <-  // make sure that the character name is in lowercase
	{
		origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
		angles = null // camera angles; format:  QAngle( 0, 0, 0 )
		velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

		health = 100
		buffer = 0.0 // temporary health
		revives = null // count of revives (2 - black&white)
		idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

		Inventory = {
			active_slot = "slot1"
			slot0 = // primary weapon
			{
				weapon = ""
				clip = null
				ammo = null

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
			//slot5 = "gascan" // physics objects
		}

		Actions = function(hPlayer) {
			//SendToServerConsole("st_mr_record 1");
			//cvar("st_mr_force_file", "louis");
			//cvar("st_mr_play", Ent("!louis").GetEntityIndex());
		}
	}

Survivors["francis"] <-  // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
	{
		origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
		angles = null // camera angles; format:  QAngle( 0, 0, 0 )
		velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

		health = 100
		buffer = 0.0 // temporary health
		revives = null // count of revives (2 - black&white)
		idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

		Inventory = {
			active_slot = "slot1"
			slot0 = // primary weapon
			{
				weapon = ""
				clip = null
				ammo = null

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
			//slot5 = "gascan" // physics objects
		}

		Actions = function(hPlayer) {
			//SendToServerConsole("st_mr_record 1");
			//cvar("st_mr_force_file", "francis");
			//cvar("st_mr_play", Ent("!francis").GetEntityIndex());
		}
	}

Survivors["bill"] <- {
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory = {
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null

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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "bill");
		//cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

Survivors["zoey"] <- {
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory = {
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null

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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer) {
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "zoey");
		//cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
	}
}

function OnTriggerTouch() {
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting) {
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1" && activator == Ent("!")) {

		} else if (sName == "trigger_area2") {

		} else if (sName == "trigger_area2") {

		} else if (sName == "trigger_area2") {

		} else if (sName == "trigger_area2") {

		} else if (sName == "trigger_area2") {

		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{
	
}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 1.00);
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
