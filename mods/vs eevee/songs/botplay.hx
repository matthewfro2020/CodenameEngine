function update()
     if(FlxG.keys.justPressed.NINE){
          player.cpu = !player.cpu;
          for(a in [scoreTxt, missesTxt, accuracyTxt]) a.visible = !player.cpu;
     }


function onDadHit(e) {
        health += .01;
        e.healthGain = .01;
}
