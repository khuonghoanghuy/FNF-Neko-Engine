# FNF Neko Engine (ALPHA)

![Repo Size](https://img.shields.io/github/repo-size/khuonghoanghuy/FNF-Neko-Engine)

A Port of Friday Night Funkin' Port for `hl` target (like build for windows but more faster)

This is a **ALPHA** mod, which means that it's not ready to be used yet

Also, if you gonna use this engine, dont worry about your disk, dont need to have visual studio thing yay! (if u just using `hl`)

# Some feature:
- Gameplay Improve
- Hscript Support (super limit thought)
- Some Menu Improve
- HashLink Support!!!! (main thing)

And more

# Some tip for Neko Engine only:
- If you gonna make own State or SubState, replace `MusicBeatState` or `MusicBeatSubstate` with `MusicBeat` or `MusicBeatSub` (idk why thought but i like this :>)
- Neko Engine is using only `hl` build so if you gonna making da mod using this engine, try `lime build hl` (can be run on windows, macos or linux) (will execute by your opera system you using, like windows will execute as normall `.exe` file!)
- Speed to build a execute file is more faster than and is still on the desktop, wow (if u just using `hl` lol)
- If u don't like the choppy laggy camlerp on PlayState when play a song, find `FlxG.camera.followLerp = CoolUtil.camLerpShit(0.04);` and comment this code like `// FlxG.camera.followLerp = CoolUtil.camLerpShit(0.04);` (also is an options too!)
# Some issues still in Neko Engine:
- Uncaught exeption `max_string_size reached` (not fixed yet, build on `hl` will not get that error) (also it from `neko` target too)
- dialogue can be played but the `.finished` is make game crash if you press enter while dialogue playing (tip: just wait the dialogue is done and is work normally!)
- this engine is super buggy! (NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO)
- hscript stage, function is still wip
# Some info:
I really need help ;_;

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

or if you dont know how to using command, just go to the build folder and use 1 or 2 files bat, should able to build too!