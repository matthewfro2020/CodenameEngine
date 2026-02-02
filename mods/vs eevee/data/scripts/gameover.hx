
function create(){







}
art = new FlxSprite(200, 120).loadGraphic(Paths.image("game/dangusuk"));
art.scale.set(0.9,0.9);
art.x -= 250;
art.y -= 150;
art.updateHitbox();
add(art);

function update(elapsed:Float){
    FlxG.sound.music.volume = 0;
    FlxG.sound(Paths.sound("lossSFX")).volume = 0;

}

function create(event) {
    event.cancel();

		if (controls.ACCEPT)
		{
		endBullshit();
		}


		if (controls.BACK)
		{
			confirm.play();

			   Sys.exit(0);
		}
    
    camera = dieCam = new FlxCamera();
    dieCam.bgColor = FlxColor.BLACK;
    FlxG.cameras.add(dieCam, false);
    var sound:FlxSound = new FlxSound().loadEmbedded(Paths.sound("foghorn-sfx")); sound.volume = 0.7; sound.play();
}

function update(elapsed){
    // controls
    if(controls.ACCEPT){

        new FlxTimer().start(1, function(){StickerHandler.switchState(new PlayState());});
    }else if(controls.BACK){
        StickerHandler.switchState(PlayState.isStoryMode ? new StoryMenuState() : new FreeplayState());
    }
    // keys
    if(FlxG.keys.justPressed.F5){
        FlxG.resetState();
    }
}
