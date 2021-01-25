global function Noclip_Init

void function Noclip_Init()
{
	#if SERVER
	// IsNoclipping only exists on the server, so serve noclip requests by sending them to the server first
	// Command is bound and activated from scripts/kb_act.lst
	AddClientCommandCallback( "toggle_noclip", ClientCommand_Spawnmenu_RequestNoclipToggle );
	#endif
}

#if SERVER
bool function ClientCommand_Spawnmenu_RequestNoclipToggle( entity player, array<string> args )
{
	if( player.IsNoclipping() )
	{
		ClientCommand( player, "noclip_disable" );
	}
	else
	{
		ClientCommand( player, "noclip_enable" );
	}
	return true;
}
#endif
