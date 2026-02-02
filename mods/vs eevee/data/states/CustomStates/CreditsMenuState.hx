art = new FlxSprite(200, 120).loadGraphic(Paths.image("menus/menuBGBlue"));
art.updateHitbox();
art.scale.set(1.15, 1.15);
art.x -= 250;
art.y -= 150;
add(art);

function create() {
    chickpeacredit = new FunkinSprite(0,0,Paths.image('game/chickpeacredit'));
    chickpeacredit.animation.addByPrefix('chickpeacredit', 'chickpeacredit', 12, loop = true);
    chickpeacredit.screenCenter(0x11);
    chickpeacredit.visible = true;
    chickpeacredit.animation.play('chickpeacredit');
    add(chickpeacredit);
}

function update(elapsed){
    // controls
 if(controls.BACK){
        StickerHandler.switchState(new MainMenuState());
    }
    // keys
    if(FlxG.keys.justPressed.F5){
        FlxG.resetState();
    }
 if(FlxG.keys.justPressed.ENTER){
var sound:FlxSound = new FlxSound().loadEmbedded(Paths.sound("confirm")); sound.volume = 0.7; sound.play();
CoolUtil.openURL("https://x.com/stubbypubby");
        }
}
