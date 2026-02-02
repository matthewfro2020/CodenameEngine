    function create() {
    titlescreen = new FunkinSprite(0,0,Paths.image('game/titlescreen'));
    titlescreen.animation.addByPrefix('titlescreen', 'titlescreen', 12);
    titlescreen.screenCenter(0x11);
    titlescreen.animation.play('titlescreen');
    titleScreenSprites.add(titlescreen);

    logo = new FunkinSprite(0,0,Paths.image('game/logo'));
    logo.animation.addByPrefix('logo', 'logo', 12);
    logo.screenCenter(0x11);
    logo.animation.play('logo');
    titleScreenSprites.add(logo);
    logo.x = 750;
    logo.y = 300;

    remove(titleText);
}