import openfl.geom.ColorTransform;

function onEvent(e) {
    if (e.event.name == "CamPosSwap") {
        curCameraTarget = e.event.params[0];
        new FlxTimer().start(0.01, function(timer) {
            FlxG.camera.snapToTarget();
        });	
        
    }
}