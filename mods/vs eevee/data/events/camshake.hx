function onEvent(e) {
    if (e.event.name == "camshake") {
    camera.shake(0.005, 0.3, true);
    }
}