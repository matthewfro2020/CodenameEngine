import sys.FileSystem;
import flixel.util.FlxSort;
import flixel.group.FlxGroup;
import funkin.backend.MusicBeatState;
import funkin.backend.assets.ModsFolder;

var grpStickers:FlxGroup;

function new() {
	camera = new FlxCamera();
	camera.bgColor =  FlxColor.fromRGBFloat(0, 0, 0, 0);
	FlxG.cameras.add(camera, false);

    grpStickers = new FlxGroup();
    add(grpStickers);
    grpStickers.cameras = [camera];
}

function create() {
	if (data.doIn)
		doStickerSet("stickers-set-1");
	else {
		for (stickerData in StickerHandler.__lastStickersData)
		{
			var sticky = new FunkinSprite(0, 0, stickerData.image);
			sticky.x = stickerData.x;
			sticky.y = stickerData.y;
			sticky.angle = stickerData.angle;
			sticky.extra["timing"] = stickerData.timing;
			sticky.scale.x = sticky.scale.y = stickerData.scale;
			grpStickers.add(sticky);
		}

		grpStickers.sort((ord, a, b) -> {
			return FlxSort.byValues(ord, a.extra["timing"], b.extra["timing"]);
		});
		undoSticker();
	}
}

public function undoSticker()
{
	if (grpStickers.members == null || grpStickers.members.length == 0)
    {
      close();
      return;
    }

    for (ind => sticker in grpStickers.members)
    {
    	new FlxTimer().start(sticker.extra["timing"], (_) -> {
    		sticker.visible = false;
			FlxG.sound.play(getRandomSound());

    		if (grpStickers == null || ind == grpStickers.members.length - 1)
    		{
    			close();
    		}
    	});
    }
}

function doStickerSet(stickerSet) {
	var __stickerData = [];
    if (grpStickers.members.length > 0)
		grpStickers.clear();

	var stickerInfo = {}; stickerInfo = {
		name: null,
		artist: null,
		stickers: null,
		stickerPacs: null,

		load: function () {
			var path = Paths.file('images/transitionSwag/' + stickerSet + '/stickers.json');
			var json = Json.parse(Assets.getText(path));

			stickerInfo.name = json.name;
			stickerInfo.artist = json.artist;

			var stickerPacks:Map<String, Array<String>> = [];

			for (field in Reflect.fields(json.stickerPacks))
			{
				var stickerFunny = json.stickerPacks;
				var stickerStuff = Reflect.field(stickerFunny, field);

				stickerPacks.set(field, stickerStuff);
			}

			stickerInfo.stickerPacks = stickerPacks;

			// creates a similar for loop as before but for the stickers
			var stickers:Map<String, Array<String>> = [];

			for (field in Reflect.fields(json.stickers))
			{
				var stickerFunny = json.stickers;
				var stickerStuff = Reflect.field(stickerFunny, field);

				stickers.set(field, stickerStuff);
			}

			stickerInfo.stickers = stickers;
		},
		getPack: function (packName:String) {
			return stickerInfo.stickerPacks[packName];
		},
		getStickers: function (stickerName:String) {
			return stickerInfo.stickers[stickerName];
		},
	};

	stickerInfo.load(stickerSet);

	var stickers:Map<String, Array<String>> = [];
	for (stickerSets in stickerInfo.getPack("all"))
		stickers.set(stickerSets, stickerInfo.getStickers(stickerSets));

	var xPos:Float = -100;
	var yPos:Float = -100;
	var allStickersToChoseFrom:Array<String> = [];
	for (char in stickers.keys())
    {
        for (sticke in stickerInfo.stickers.get(char))
        {
            allStickersToChoseFrom.push(sticke);
        }
    }
	while (xPos <= FlxG.width)
	{
        var stickerIndex:Int = FlxG.random.int(0, allStickersToChoseFrom.length - 1);
		var sticker:String = allStickersToChoseFrom[stickerIndex];
		var sticky = new FunkinSprite(0, 0, Paths.image("transitionSwag/" + stickerInfo.name + "/" + sticker));
		sticky.visible = false;

		sticky.x = xPos;
		sticky.y = yPos;
		xPos += sticky.frameWidth * 0.5;

		if (xPos >= FlxG.width)
		{
			if (yPos <= FlxG.height)
			{
				xPos = -100;
				yPos += FlxG.random.float(70, 120);
			}
		}

		sticky.angle = FlxG.random.int(-60, 70);
		grpStickers.add(sticky);

		sticky.extra["image"] = Paths.image("transitionSwag/" + stickerInfo.name + "/" + sticker);
	}

	//stolen from FlxRandom
	function shuffle(array:Array):Void
	{
		var maxValidIndex = array.length - 1;
		for (i in 0...maxValidIndex)
		{
			var j = FlxG.random.int(i, maxValidIndex);
			var tmp = array[i];
			array[i] = array[j];
			array[j] = tmp;
		}
	}
	shuffle(grpStickers.members);

	for (ind => sticker in grpStickers.members)
	{
		sticker.extra["timing"] = FlxMath.remapToRange(ind, 0, grpStickers.members.length, 0, 0.9);

		new FlxTimer().start(sticker.extra["timing"], _ -> {
			if (grpStickers == null) return;

			sticker.visible = true;
			FlxG.sound.play(getRandomSound());

			var frameTimer:Int = FlxG.random.int(0, 2);

			// always make the last one POP
			if (ind == grpStickers.members.length - 1) frameTimer = 2;

			new FlxTimer().start((1 / 24) * frameTimer, _ -> {
				if (sticker == null) return;

				sticker.scale.x = sticker.scale.y = FlxG.random.float(0.97, 1.02);

				if (ind == grpStickers.members.length - 1)
				{
					MusicBeatState.skipTransOut = MusicBeatState.skipTransIn = true;
					StickerHandler.__lastStickersData = __stickerData;

					if (data.finishCallback != null)
						data.finishCallback();
				}
			});
		});
	}

	grpStickers.sort((ord, a, b) -> {
		return FlxSort.byValues(ord, a.extra["timing"], b.extra["timing"]);
	});

	// centers the very last sticker
	var lastOne:StickerSprite = grpStickers.members[grpStickers.members.length - 1];
	lastOne.updateHitbox();
	lastOne.angle = 0;
	lastOne.screenCenter();

	
	for (i in 0...grpStickers.members.length)
	{
		var sticky = grpStickers.members[i];
		__stickerData[i] = { x: sticky.x, y: sticky.y, angle: sticky.angle, scale: sticky.scale.x, timing: sticky.extra["timing"], image: sticky.extra["image"] };
	}
}

function onClose() {
	FlxG.cameras.remove(camera, true);
}

function getRandomSound() {
	var sounds = [];
	for (file in FileSystem.readDirectory("./mods/" + ModsFolder.currentModFolder + "/sounds/stickersounds/")) {
		sounds.push(StringTools.replace(file, ".ogg", ""));
	}
	return Paths.sound("stickersounds/" + sounds[FlxG.random.int(0, sounds.length - 1)]);
}