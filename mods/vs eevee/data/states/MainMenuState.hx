import funkin.options.OptionsMenu;

function onSelectItem(selection){
    selection.cancel();
    switch (selection.name){
        case 'credits':
            StickerHandler.switchState(new ModState("CustomStates/CreditsMenuState"));
        case 'story mode':
            StickerHandler.switchState(new StoryMenuState());
        case 'freeplay':
            StickerHandler.switchState(new FreeplayState());
        case 'options':
            StickerHandler.switchState(new OptionsMenu());

    }
}