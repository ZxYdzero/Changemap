#include <sourcemod>
#include <cstrike>
#include <sdktools>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
name = "change map",
author = "Sparkle",
description = "changelevel when server have no player",
version = "1",
url = "!@#$%^&*&^%^&*"
};

int pnum = 0;

public void OnConfigsExecuted()
{
    CreateTimer(86400.0, Timer_Changelevel, _, TIMER_FLAG_NO_MAPCHANGE);
}

public void OnClientDisconnect()
{
    CreateTimer(86400.0, Timer_Changelevel, _, TIMER_FLAG_NO_MAPCHANGE);
}

public Action Timer_Changelevel(Handle timer)
{
    pnum = (GetTeamClientCount(3) + GetTeamClientCount(2));
    if(pnum == 0)
    {
        ServerCommand("changelevel_next");
        return Plugin_Stop;
    }
    else
    {
        return Plugin_Continue;
    }
}