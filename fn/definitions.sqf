///////////////////////////////////////////////////////////////////////////////////////////////////////////
// CLIENT FUNCTIONS ///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
fn_loadPlayer = compile preprocessFileLineNumbers 'fn\client\fn_loadPlayer.sqf';
fn_loadPlayerGear = compile preprocessFileLineNumbers 'fn\client\fn_loadPlayerGear.sqf';
fn_savePlayer = compile preprocessFileLineNumbers 'fn\client\fn_savePlayer.sqf';
fn_promotePlayer = compile preprocessFileLineNumbers 'fn\client\fn_promotePlayer.sqf';
fn_defaultLoadout = compile preprocessFileLineNumbers 'fn\client\fn_defaultLoadout.sqf';
fn_getLoadout = compile preprocessFileLineNumbers 'fn\client\fn_getLoadout.sqf';
fn_setLoadout = compile preprocessFileLineNumbers 'fn\client\fn_setLoadout.sqf';
fn_devLog = compile preprocessFileLineNumbers 'fn\client\fn_devLog.sqf';
fn_loadDeployment = compile preprocessFileLineNumbers 'fn\client\fn_loadDeployment.sqf';
fn_loadZones = compile preprocessFileLineNumbers 'fn\client\fn_loadZones.sqf';
fn_rebelLoadout = compile preprocessFileLineNumbers 'fn\client\fn_rebelLoadout.sqf';
fn_buildRespawnPoints = compile preprocessFileLineNumbers 'fn\client\fn_buildRespawnPoints.sqf';
fn_playerIntro = compile preprocessFileLineNumbers 'fn\client\fn_playerIntro.sqf';
fn_handleZone = compile preprocessFileLineNumbers 'fn\client\fn_handleZone.sqf';
fn_loadPlayersAtFOB = compile preprocessFileLineNumbers 'fn\client\fn_loadPlayersAtFOB.sqf';
fn_fobIntro = compile preprocessFileLineNumbers 'fn\client\fn_fobIntro.sqf';
fn_fobOutro = compile preprocessFileLineNumbers 'fn\client\fn_fobOutro.sqf';
fn_promotedScreen = compile preprocessFileLineNumbers 'fn\client\fn_promotedScreen.sqf';
fn_createMarkerLocal = compile preprocessFileLineNumbers 'fn\client\fn_createMarkerLocal.sqf';
fn_deleteMarkerLocal = compile preprocessFileLineNumbers 'fn\client\fn_deleteMarkerLocal.sqf';
fn_floatToString = compile preprocessFileLineNumbers 'fn\client\fn_floatToString.sqf';
fn_positionToString = compile preprocessFileLineNumbers 'fn\client\fn_positionToString.sqf';
fn_addObjectAction = compile preprocessFileLineNumbers 'fn\client\fn_addObjectAction.sqf';
fn_closestOps = compile preprocessFileLineNumbers 'fn\client\fn_closestOps.sqf';

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// SERVER FUNCTIONS ///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
sfn_loadPlayer = compile preprocessFileLineNumbers 'fn\server\fn_loadPlayer.sqf';
sfn_loadPlayerGear = compile preprocessFileLineNumbers 'fn\server\fn_loadPlayerGear.sqf';
sfn_savePlayer = compile preprocessFileLineNumbers 'fn\server\fn_savePlayer.sqf';
sfn_loadDeployment = compile preprocessFileLineNumbers 'fn\server\fn_loadDeployment.sqf';
sfn_createZones = compile preprocessFileLineNumbers 'fn\server\fn_createZones.sqf';
sfn_endZone = compile preprocessFileLineNumbers 'fn\server\fn_endZone.sqf';
sfn_buildBases = compile preprocessFileLineNumbers 'fn\server\fn_buildBases.sqf';
sfn_buildRespawnPoints = compile preprocessFileLineNumbers 'fn\server\fn_buildRespawnPoints.sqf';
sfn_createSpecificDeployment = compile preprocessFileLineNumbers 'fn\server\fn_createSpecificDeployment.sqf';
sfn_handleZone = compile preprocessFileLineNumbers 'fn\server\fn_handleZone.sqf';
sfn_zoneHandler = compile preprocessFileLineNumbers 'fn\server\fn_zoneHandler.sqf';
sfn_loadPlayersAtFOB = compile preprocessFileLineNumbers 'fn\server\fn_loadPlayersAtFOB.sqf';
sfn_promote = compile preprocessFileLineNumbers 'fn\server\fn_promote.sqf';
sfn_setPlayerRole = compile preprocessFileLineNumbers 'fn\server\fn_setPlayerRole.sqf';
sfn_loadPlayerRole = compile preprocessFileLineNumbers 'fn\server\fn_loadPlayerRole.sqf';
sfn_loadPlayerRank = compile preprocessFileLineNumbers 'fn\server\fn_loadPlayerRank.sqf';
sfn_resignRole = compile preprocessFileLineNumbers 'fn\server\fn_resignRole.sqf';
sfn_writeObject = compile preprocessFileLineNumbers 'fn\server\fn_writeObject.sqf';
sfn_hashID = compile preprocessFileLineNumbers 'fn\server\fn_hashID.sqf';
sfn_deleteObject = compile preprocessFileLineNumbers 'fn\server\fn_deleteObject.sqf';
sfn_markOp = compile preprocessFileLineNumbers 'fn\server\fn_markOp.sqf';
sfn_createSupplyDrop = compile preprocessFileLineNumbers 'fn\server\fn_createSupplyDrop.sqf';
