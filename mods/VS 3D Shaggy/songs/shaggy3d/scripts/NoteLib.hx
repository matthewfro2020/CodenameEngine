function onNoteCreation(note)
{
    switch(SONG.meta.name)
    {
        case "shaggy3d":
            note.noteSprite = "game/notes/3d";
    }
}

function onStrumCreation(note)
{
   switch(SONG.meta.name)
    {
        case "shaggy3d":
            note.sprite = "game/notes/3d";
    }
}