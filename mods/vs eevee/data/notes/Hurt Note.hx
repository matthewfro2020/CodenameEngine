var hurtTween:FlxTween;

function onNoteHit(e)
    if (e.noteType == "Hurt Note")
        e.animSuffix = "-alt";

function onPlayerHit(e) {
    if (e.noteType == "Hurt Note"){
        health -= .1;
        e.healthGain = 0;
        boyfriend.color = FlxColor.RED;
        hurtTween = FlxTween.color(boyfriend, 1, FlxColor.RED, FlxColor.WHITE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){hurtTween = null;}});
    }
}

function onPlayerMiss(e) {
	if (e.noteType == "Hurt Note"){
		e.cancel();
		deleteNote(e.note);
	}
}

function onDadHit(e) {
    if (e.noteType == "Hurt Note"){
        health -= .3;
    }
}


function postCreate()
    if (hurtTween != null)
        hurtTween.cancel();