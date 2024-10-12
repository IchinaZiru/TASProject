@echo off
start "%cd%" "%cd%\left4dead2.exe" -lv -novid -insecure +plugin_load cfg\sm_server\metamod\bin\server.dll +mm_basedir cfg\sm_server\metamod +sm_basepath cfg\sm_server\sourcemod
exit