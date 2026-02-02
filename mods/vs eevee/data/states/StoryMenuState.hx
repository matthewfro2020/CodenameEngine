
function selectItem(e) {
           PlayState.loadSong(event.song, event.difficulty, event.opponentMode, event.coopMode);

PlayState.isStoryMode = true;

StickerHandler.switchState(new PlayState());
}

