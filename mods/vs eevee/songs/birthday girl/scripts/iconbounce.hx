function update(elapsed) {
    iconP2.scale.set(1, 1);
    if (healthBar.percent < 80) iconP2.flipX = false;
}

function beatHit() {
    if (healthBar.percent > 80) {
        iconP2.flipX = !iconP2.flipX;
        if (downscroll) {
        iconP2.y += 130;
        } else {
        iconP2.y -= 130;
        } 
        FlxTween.tween(iconP2, {y: iconP1.y}, (0.5 * (1 / (Conductor.bpm / 60))), {ease: FlxEase.cubeOut});
    } else {
        for (tween in extraTween) {
            tween.cancel();
        }
        iconP2.flipX = false;
        iconP2.offset.x = 0;
        iconP2.offset.y = 0;
        FlxTween.tween(iconP2.offset, {x: -120}, 0.001, {ease: easeFunction, type: PINGPONG});
        

    }

}

