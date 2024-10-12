//Left 4 Dead 2 TAS Kit advance scripting...
//Made by DXSamXD https://steamcommunity.com/id/DXSamXD/
//Scripted by: Sw1ft

//Templates for scripting TAS

//How to spawn uncommon zombies ex. Witch Bride on c6m1

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

__SpawnCommon( "common_male_fallen_survivor", Vector(), QAngle(), 2 ); //<= To spawn fallen survivor

__SpawnCommon( "common_male_fallen_survivor", Vector(), QAngle(), 1 | 2 | 4 | 8); //<= by using | you can spawn with items that shown above: const FALLEN_VJAR_OR_MOLOTOV = 1; is 1 and const FALLEN_PIPE = 2; is 2
//END

//Shows Tank HP 
function tank_hp()
{
	local player;
	
	while (player = Entities.FindByClassname(player, "player"))
	{
		if (player.GetZombieType() == 8)
		{
			SayMsg( "HP: " + player.GetHealth() );
		}
	}
}

RegisterOnTickFunction("tank_hp"); // <- Hooking the function to make it work
//End

//End

//Pick Item
TakeNearestItem( Ent("!coach") );
TakeNearestItem( Ent("!coach"), true, false, true, "weapon_pipebomb" );

//End

//Special Aggression e.x tank attacks even though it's out of sight
g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0;

//end

//Remove Timescale Locker
script RemoveOnTickFunction("TimescaleListener");

//RemoveItemByName (so basically it removes all the item in the map)
RemoveItemByName("molotov"); //all molotov. This is helpful tho,

//RemoveItemByClass, basically will remove all melee spawn, no need to write all items by using RemoveItemByName. 
local ent;
while (ent = Entities.FindByClassname(ent, "melee_spawn")) ent.Kill();	//weapon_spawn for all weapons
//End

//Activate Gascan Fill Bot
ActivateFillBot_OnAdrenalineUse(Ent("!nick")); //for fake id (Ent(2) is an example.
//End

//RemoveItemWithin the Range	(Removes the item within the radius given
RemoveItemWithin(Vector(-2280.938, 3256.000, -176.000), 400);	//400 is the radius given by the vector
//End

//Disable/Enable Auto Climb feature
DisableAutoClimb();
EnableAutoClimb();
//End

//Enable/Disable AutoBile Breaker
EnableAutoBileBreaker();
DisableAutoBileBreaker();
//Disable

//Remove a specific item
EntFire("item_spawn_set1_medicinecabinet", "Kill", null, 0.5); //<=example, this is the first_aid cabinet on c2m5 behind the light switch

//In c1m4 some item spawns are in a template as well so you can find it by picking it via AUU menu 

//healthspawns from noa1mbot's c1m4
EntFire("pills-1", "Kill", null, 0.5);
EntFire("pills-2", "Kill", null, 0.5);
EntFire("pills-3", "Kill", null, 0.5);
EntFire("pills-4", "Kill", null, 0.5);
EntFire("pills-5", "Kill", null, 0.5);
EntFire("pills-6", "Kill", null, 0.5);
//Spawning a template
EntFire("ptemplate_pills-2", "ForceSpawn", null, 1.0);
EntFire("ptemplate_pills-3", "ForceSpawn", null, 1.0);
//End

//Create a Timer with commands inside
CreateTimer(1.00, function()	//1.00 second delay and will execute the commands inside
{ 
	SayMsg("This is a test!");
});

//You can also put a timer inside the timer making the execution perfect
//Example
CreateTimer(17.500, function()
{ 
	::AutoKick(Ent(2), Ent("!nick"));
	
	CreateTimer(5.000, function()
	{ 
	SendToServerConsole("kick instagib; sm_fake");
	
		CreateTimer(0.017, function()
		{ 
			SetClientName(Ent(2), "DXSamXD");
		});
		
	});
});
//END

//Run script code command with a timer. I'm just using this command for idle teleportation
EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 1.4); //<= 1.4 seconds delay
EntFire("worldspawn", "RunScriptCode", "SendToServerConsole(\"sm_idle 1\");", 0.4); //= 0.4 seconds delay
//End

//How to spawn gascan scavenge like in c1m4? It's simple if you use TAS Kit by Sw1ft 
//gascans
RemoveItemByName("gascan_scavenge"); //removes all gascan in the map then proceeds the next line making it spawn the scripted item gascan
SpawnItem("gascan_scavenge", Vector(-3710.594, -3435.219, 2.469), QAngle(90.000, 59.985, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-6137.375, -3367.531, 291.438), QAngle(0.000, 59.985, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-6149.656, -3387.375, 283.438), QAngle(90.000, 315.000, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-3515.031, -4285.875, 547.438), QAngle(0.000, 210.015, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-3494.469, -4274.844, 539.438), QAngle(90.000, 104.985, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-2967.438, -4419.875, 285.438), QAngle(0.000, 30.015, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-2963.313, -4404.406, 283.438), QAngle(90.000, 239.985, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-6004.219, -3476.688, 540.438), QAngle(90.000, 340.488, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-5988.250, -3477.938, 548.438), QAngle(0.000, 130.518, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-4536.977, -4207.148, 283.452), QAngle(1.101, -58.143, 0.341), -1);
SpawnItem("gascan_scavenge", Vector(-4516.406, -4212.688, 283.438), QAngle(90.000, 149.985, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-2759.000, -3863.000, 12.438), QAngle(0.000, 45.000, 0.000), -1);
SpawnItem("gascan_scavenge", Vector(-2759.000, -3847.000, 4.438), QAngle(90.000, 255.015, 0.000), -1);

//But don't forget you can also spawn a default gascan skin
SpawnItem("gascan", Vector( , , ), QAngle( , , ), -1);
//End

//How to spawn items with removing the last item so that it won't make conflict

SpawnItem("first_aid_kit", Vector(-5084.000, 1983.688, -3164.125), QAngle(0.000, 0.000, 0.000), 1, 100); //<= by adding , 100, 100 is the radius, inside of that radius, it will delete all the items inside.
SpawnItem("rifle_ak47", Vector(-5088.031, 1884.031, -3166.375), QAngle(0.044, 62.930, 90.791), 4);
SpawnItem("shotgun_spas", Vector(-5087.969, 1936.000, -3166.531), QAngle(0.044, 251.016, 270.439), 4);
SpawnItem("first_aid_kit", Vector(-5088.000, 1968.688, -3164.125), QAngle(0.000, 127.002, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5105.000, 1965.688, -3161.594), QAngle(90.000, 37.485, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-5098.938, 1983.594, -3161.594), QAngle(90.000, 316.011, 0.000), 1);
SpawnItem("ammo", Vector(-5092.719, 2004.000, -3164.125), QAngle(0.000, 76.992, 0.000), 1, 50);

//Please note that always put the removeitems, removewithin, or spawnitem with radius item remover after the normal spawnitem because basically will spawn an item and then it will remove it.
//End