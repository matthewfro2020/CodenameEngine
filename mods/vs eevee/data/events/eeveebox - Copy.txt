function onEvent(e) {
    if (e.event.name == "eeveebox") {
        var params:Array = e.event.params;
        eeveebox.visible = params[0];
    eeveebox.animation.play('eeveebox');
    }
}

function create() {
    eeveebox = new FunkinSprite(0,0,Paths.image('game/eeveebox'));
    eeveebox.animation.addByPrefix('eeveebox', 'eeveebox', 12, loop = false);
    eeveebox.screenCenter(0x11);
    eeveebox.visible = false;
    eeveebox.x -= 140;
    eeveebox.y = 120;
    add(eeveebox);
}
