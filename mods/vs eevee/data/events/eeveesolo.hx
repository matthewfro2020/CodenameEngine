function onEvent(e) {
    if (e.event.name == "eeveesolo") {
        var params:Array = e.event.params;
        eeveesolo.visible = params[0];
    eeveesolo.animation.play('eeveesolo');
    }
}

function create() {
    eeveesolo = new FunkinSprite(0,0,Paths.image('game/eeveesolo'));
    eeveesolo.animation.addByPrefix('eeveesolo', 'eeveesolo', 12);
    eeveesolo.screenCenter(0x11);
    eeveesolo.visible = false;
    eeveesolo.x -= 180;
    eeveesolo.y = 160;
    add(eeveesolo);
}
