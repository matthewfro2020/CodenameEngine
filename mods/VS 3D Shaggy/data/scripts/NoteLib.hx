function onNoteCreation(note)
{
    switch(funkin.game.Character.curCharacter‎)
    {
        case "shaggy3d":
            note.noteSprite = "game/notes/3d";
        case "bf":
            note.noteSprite = "game/notes/default";
    }
}

function onStrumCreation(note)
{
    switch(funkin.game.Character.curCharacter‎)
    {
        case "shaggy3d":
            note.sprite = "game/notes/3d";
        case "bf":
            note.sprite = "game/notes/default";
    }
}