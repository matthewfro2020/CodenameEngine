function onEvent(e) {
    if (e.event.name == "bunnybox") {
        var params:Array = e.event.params;
        bunnybox.visible = params[0];
    bunnybox.animation.play('bunnybox');
    }
}

function create() {
    bunnybox = new FunkinSprite(0,0,Paths.image('game/bunnybox'));
    bunnybox.animation.addByPrefix('bunnybox', 'bunnybox', 12, loop = false);
    bunnybox.screenCenter(0x11);
    bunnybox.visible = false;
    bunnybox.x = 180;
    bunnybox.y = 100;
    add(bunnybox);
}
