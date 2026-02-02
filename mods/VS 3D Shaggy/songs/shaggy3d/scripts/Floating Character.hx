var dad2; // replace dad2 with something else if youd rather
var yOff = -450; // the center offset point you want your character to float between
var floatAm = 100; // how much you want your character to deviate from that base offset point
function create() {
  dad = strumLines.members[strumID].characters[charID];
}
function update() {
  dad.y = yOff + (Math.sin(Conductor.songPosition / 1000 * 3.1415) * floatAm);
}