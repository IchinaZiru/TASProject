// Squirrel

Convars.SetValue("mp_gamemode", "Coop");
Convars.SetValue("z_difficulty", "Impossible");
Convars.SetValue("director_no_bosses", 0);
Convars.SetValue("director_no_mobs", 0);
Convars.SetValue("director_no_specials", 0);
Convars.SetValue("z_common_limit", 30);
Convars.SetValue("sb_stop", 0);

Inventory <- function()
{
        Convars.SetValue("host_timescale", 0.25);
	local hPlayer;
	if ((hPlayer = Ent("!nick")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(100);
                SendToConsole("st_mr_record 1");
                Convars.SetValue("st_mr_force_file", "");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex())
	}
	if ((hPlayer = Ent("!coach")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(100);
	}
	if ((hPlayer = Ent("!rochelle")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(100);
	}
	if ((hPlayer = Ent("!ellis")) != null)
	{
		hPlayer.GiveItem("pistol");
		hPlayer.SetHealth(100);
	}
}

::OnEntityOutput <- function()
{
	if (g_ST.restart || !activator.IsSurvivor()) return;
	local client = activator.GetEntityIndex();
	local sName = caller.GetName();
	if (sName == "trigger_area1")
	{

	}
	else if (sName == "trigger_area2")
	{
		
	}
}

/*
::bCoolOff <- true;

::OnPlayLine <- function(hPlayer, sFileName, tick, buttons)
{
	if (hPlayer == Ent("!player"))
	{
		if (bCoolOff && buttons & IN_ATTACK)
		{
			EntFire("worldspawn", "RunScriptCode", "bCoolOff = true", 0.1);
			EmitSoundOnClient("Pistol_Silver.Fire", hPlayer);
			bCoolOff = false;
		}
	}
}
*/

//========================================================================================================================
//ScMp
//========================================================================================================================

Timer();