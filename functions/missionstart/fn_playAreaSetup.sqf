if (!isServer) exitWith {};

//DELETE LOCATION MARKERS ======================================================
{
    deleteMarker _x;
} forEach LOCATIONMARKERS;

//CREATE PLAY AREA MARKERS =====================================================
//city area
_marker = createMarker ["PositionAREAMARKER", OPFORSPAWN];
_marker setMarkerColor "COLOREAST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [hp_missionParam_CAPTUREZONESIZE, hp_missionParam_CAPTUREZONESIZE];

_marker = createMarker ["BLUFORMINSPAWNDISTANCE", OPFORSPAWN];
_marker setMarkerColor "COLORWEST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [BLUFORSPAWNBAND, BLUFORSPAWNBAND];


//CREATE EXPLANATION MARKERS FOR BLUFOR ========================================
[
    WEST,
    "EXPLANATIONMARKER_CAPTURE",
    true,
    OPFORSPAWN,
    "",
    "COLOREAST",
    "",
    "ELLIPSE",
    [hp_missionParam_CAPTUREZONESIZE,hp_missionParam_CAPTUREZONESIZE],
    1,
    "SolidFull"
] call hp_fnc_createSideMarker;

[
    WEST,
    "EXPLANATIONMARKER_CAPTURE_TEXT",
    true,
    OPFORSPAWN vectorAdd [hp_missionParam_CAPTUREZONESIZE,hp_missionParam_CAPTUREZONESIZE,0],
    "hd_dot",
    "COLOREAST",
    "CAPTURE ZONE",
    "ICON",
    1,
    1
] call hp_fnc_createSideMarker;

missionNamespace setVariable ["hp_init_playAreaSetupDone", true, true];
diag_log "fn_playAreaSetup - Player area set up.";
