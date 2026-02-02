import funkin.editors.charter.Charter;

function onSelectOption(e)
{
    if (e.name == "Exit to menu")
    {
        e.cancel();

        if (PlayState.chartingMode && Charter.undos.unsaved)
            state.saveWarn(false);
        else {
            PlayState.resetSongInfos();
            if (Charter.instance != null) Charter.instance.__clearStatics();

            // prevents certain notes to disappear early when exiting  - Nex
            state.strumLines.forEachAlive(function(grp) grp.notes.__forcedSongPos = Conductor.songPosition);

            CoolUtil.playMenuSong();
            StickerHandler.switchState(PlayState.isStoryMode ? new StoryMenuState() : new FreeplayState());
            trace("Exiting to menu");

           
        }
    }
}

function postUpdate(elapsed:Float){

    if (pauseMusic.volume < 1)
        pauseMusic.volume += 0.025 * elapsed;
}

function create(){
var sound:FlxSound = new FlxSound().loadEmbedded(Paths.sound("pause")); sound.volume = 0.7; sound.play();
}
