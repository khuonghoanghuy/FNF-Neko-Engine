# FNF Neko Engine (ALPHA)

![Repo Size](https://img.shields.io/github/repo-size/khuonghoanghuy/FNF-Neko-Engine)

A Engine of Friday Night Funkin' build on `hl` target (like build for windows but more faster)

This is a **ALPHA** mods engine, which means that it's not ready to be used yet (if you still can using them, good job!)

Also, if you gonna use this engine, dont worry about your disk, you dont need to have a visual studio is install yay! (if u just using `hl`)

# Some feature:
- Gameplay Improve
- Hscript Support (super limited thought)
- Some Menu Improve
- HashLink Support!!!! (main thing)

And more

# Some tip for Neko Engine only:
- If you gonna make own State or SubState, replace `MusicBeatState` and `MusicBeatSubstate` with `MusicBeat` and `MusicBeatSub` (idk why thought but i like this :>)
- Neko Engine is using only `hl` build so if you gonna making da mod using this engine, try `lime build hl` (can be run on windows, macos or linux) (will execute by your opera system you using, like windows will execute as normally `.exe` file!)
- Speed to build a execute file is more faster than and is still on the desktop, wow (if u just using `hl` lol)
- If u don't like the choppy laggy camera lerp on PlayState when play a song, find `FlxG.camera.followLerp = CoolUtil.camLerpShit(0.04);` and comment this code like `// FlxG.camera.followLerp = CoolUtil.camLerpShit(0.04);` (also is an options too!)
- If you add `<name chart>Dialogue.txt`, the engine will auto play a dialogue by the text like senpai song!
# Some issues still in Neko Engine:
- Uncaught exeption `max_string_size reached` (not fixed yet, build on `hl` will not get that error) (also it from `neko` target too)
- dialogue can be played but the `.finished` is make game crash if you press enter while dialogue playing (tip: just wait the dialogue is done and is work normally!)
- this engine is super buggy! (NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO)
- hscript stage, function is still wip
- lua is never support (HELL NOOOOOOOOOOOOOOOOOOOOOOOOOOO)
# Some info:
I really need help ;_;

for u wanna read the hscript api for this engine, open `TableAPI.md` 

# Build tutorial thingie:
download [haxe 4.2.5 version](https://haxe.org/download/version/4.2.5/) however, you can still using a lastest version but i recommended to using 4.2.5 version cause that my version to build

for haxelib, if possible, try 
```
haxelib install flixel
haxelib install openfl
haxelib install lime
haxelib install hscript
haxelib install flixel-addons
haxelib install flixel-ui
```

also if u are having git, try
```
haxelib git hxlua https://github.com/MAJigsaw77/hxlua.git
```

or if you cannot install them by the command, try download manually by yourselfz

after that, you are now able to compile the source! by using command in the main folder and type `haxelib run lime test hl`, the command will took some time to build and run (pretty fast thought!)