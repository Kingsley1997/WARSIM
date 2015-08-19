_serverTime = serverTime;
_missionTime = daytime;

_parsedServerTime = numberToDate [2015, _serverTime]; // [year, month, day, hour(12), minute]
_parsedMissionTime = numberToDate [2015, _missionTime]; // [year, month, day, hour(12), minute]

[_parsedServerTime, false] call fn_devLog;
[_parsedMissionTime, false] call fn_devLog;