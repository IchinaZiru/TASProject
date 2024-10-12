// Squirrel
// Take the nearest/specific item

g_flMaxTakeDistanceSqr <- 10712.8974776;

g_aPropPhysicsModels <-
[
	"models/props_junk/gascan001a.mdl"
	"models/props_equipment/oxygentank01.mdl"
	"models/props_junk/propanecanister001a.mdl"
	"models/w_models/weapons/w_cola.mdl"
	"models/props_junk/gnome.mdl"
]

function TakeItem(hPlayer, hItem, bSetPreviousAngles = true, bSetVelocityDirectionAngles = false)
{
    local sClass = hItem.GetClassname();
	if ((sClass.find("weapon_") != null && sClass.find("_weapon_") == null) || sClass == "prop_physics")
	{
		if (sClass == "prop_physics")
		{
			if (g_aPropPhysicsModels.find(NetProps.GetPropString(hItem, "m_ModelName")) == null) return;
			else if (hPlayer.GetActiveWeapon() == hItem) return;
		}
		else if (NetProps.GetPropEntity(hItem, "m_hOwnerEntity") != null || NetProps.GetPropInt(hItem, "m_itemCount") == 0) return;
		if (VMath.MagnitudeSqr(hItem.GetOrigin() - hPlayer.EyePosition()) <= g_flMaxTakeDistanceSqr)
		{
			local vecAngles = hPlayer.EyeAngles();
			TeleportEntity(hPlayer, null, VMath.Normalize2(hItem.GetOrigin() - hPlayer.EyePosition()), null, true);
			CPlayer(hPlayer).PressButton(IN_USE);
			if (bSetPreviousAngles)
			{
				RunNextTickFunction(TeleportEntity, hPlayer, null, vecAngles, null);
			}
			else if (bSetVelocityDirectionAngles)
			{
				local vecVel = hPlayer.GetVelocity();
				if (vecVel.x != 0 || vecVel.y != 0) RunNextTickFunction(TeleportEntity, hPlayer, null, Vector(vecAngles.x, Math.RadToDeg(atan2(vecVel.y, vecVel.x)), 0), null);
			}
		}
	}
}

function TakeNearestItem(hPlayer, bSetPreviousAngles = true, bSetVelocityDirectionAngles = false, bFindNearestItem = true, sClassname = null)
{
    local hEntity, lastEnt, flDistanceSqr, sClass;
    for (local i = 0; i < MAXENTS; i++)
    {
        hEntity = EntIndexToHScript(i);
        if (hEntity != null)
        {
			sClass = hEntity.GetClassname();
			if ((sClass.find("weapon_") != null && sClass.find("_weapon_") == null) || sClass == "prop_physics")
			{
				if (bFindNearestItem || sClass == sClassname)
				{
					if (sClass == "prop_physics")
					{
						if (g_aPropPhysicsModels.find(NetProps.GetPropString(hEntity, "m_ModelName")) == null) continue;
						else if (hPlayer.GetActiveWeapon() == hEntity) continue;
					}
					else if (NetProps.GetPropEntity(hEntity, "m_hOwnerEntity") != null || NetProps.GetPropInt(hEntity, "m_itemCount") == 0) continue;
					flDistanceSqr = VMath.MagnitudeSqr(hEntity.GetOrigin() - hPlayer.EyePosition());
					if (flDistanceSqr <= g_flMaxTakeDistanceSqr)
					{
						if (lastEnt != null)
						{
							if (flDistanceSqr < VMath.MagnitudeSqr(lastEnt.GetOrigin() - hPlayer.EyePosition()))
							{
								lastEnt = hEntity;
							}
						}
						else lastEnt = hEntity;
					}
				}
			}
        }
    }
    if (lastEnt != null)
    {
		local vecAngles = hPlayer.EyeAngles();
		TeleportEntity(hPlayer, null, VMath.Normalize2(lastEnt.GetOrigin() - hPlayer.EyePosition()), null, true);
		CPlayer(hPlayer).PressButton(IN_USE);
		if (bSetPreviousAngles)
		{
			RunNextTickFunction(TeleportEntity, hPlayer, null, vecAngles, null);
		}
		else if (bSetVelocityDirectionAngles)
		{
			local vecVel = hPlayer.GetVelocity();
			if (vecVel.x != 0 || vecVel.y != 0) RunNextTickFunction(TeleportEntity, hPlayer, null, Vector(vecAngles.x, Math.RadToDeg(atan2(vecVel.y, vecVel.x)), 0), null);
		}
    }
}

function TakeNearestItemByClassname(hPlayer, sClassname, bSetPreviousAngles = true, bSetVelocityDirectionAngles = false)
{
	TakeNearestItem(hPlayer, bSetPreviousAngles, bSetVelocityDirectionAngles, false, sClassname);
}