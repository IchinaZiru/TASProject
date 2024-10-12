__CollectEventCallbacks(this, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

const Jump_time = 4.6            //Change the value on the left to adjust the take- jump time

OnGameEvent_weapon_fire <- function( params )      
{
			
        local weapon=params.weapon;
        if(weapon == "pipe_bomb")
		{
				
				EntFire("worldspawn", "RunScriptCode", "g_STLib.Funcs.Autojump()", Jump_time);
				g_STLib.Funcs.Autojump <- function()
			{
				SendToConsole("+jump;wait 50;-jump");
				//Say(null, "pipe_jump", false);
			}
		}
}

//The code and instructions that need to be used are copied from below. When copying, do not copy "/ /". Change the "key position" into convenient keys, such as "g". Just copy and do not modify.
//SendToConsole("script_execute pipe_jump");
//bind "Key" "script_execute pipe_jump"