# Genie

Patch your rom with Game Genie codes

- Author: [Tuncay D.](https://github.com/thingsiplay)
- Source: [Github](https://github.com/thingsiplay/genie)
- License: [GPL-3.0 license](LICENSE)

## What is this?

A simple command line application to patch game ROMs with Game Genie codes to
play them with an emulator. With the optional script a dialog based GUI can
be invoked to automate a few steps, creating the patched ROM, a BPS patch file
and an additional log file.

### Origin

I did not write the C program; this is a fork, of a fork. This project is based
on Game Genie Good Guy, which is based on Game Genie Guy. **GGGG** is the short
name for "**G**ame **G**enie **G**ood **G**uy".

1. [Game Genie Guy](https://www.romhacking.net/utilities/1054/), 2015: The
   original tool is written by Kyle in BCX-BASIC and is released for Windows.
2. [Game Genie Good Guy](https://github.com/Mte90/Game-Genie-Good-Guy), 2020:
   Mte90 took the source code and converted it into C language, made it run on
   Linux and added a GUI written in Python with QT on top of it.
3. [This](https://github.com/thingsiplay/genie), 2024: I forked this new
   "enhanced" version and removed most (to me) unnecessary stuff from the
   repository and added my own dialog based GUI.

## Installation

This project comes with `GGGG`, the main standalone command line program
written in C. An additional custom script `genie` is provided as well, to
automate a few steps with a graphical dialog system.

- build `GGGG` using a C compiler
- install `kdialog` and `flips` as a dependency for `genie`
- copy `GGGG` and `genie` into a folder that is in the $PATH

### Get the code

```bash
git clone "https://github.com/thingsiplay/genie"
cd "genie"
```

### Build GGGG

The main application **GGGG** is written in C and needs must be compiled with a
C compiler. Compile with the command, which will invoke `gcc`:

```bash
make
```

On success, an executable file named `GGGG` should be available now.
Unfortunately at this stage I am not able to give a full list of required
libraries and programs to build it.

## Usage

```bash
GGGG [CODES] [ROM_TYPE] [INPUT_FILE] [OUTPUT_FILE]
```

All arguments are required.

- `CODES`: Game Genie codes to inject into the ROM. Multiple codes can be
  combined with `+` or newline character.
- `ROM_TYPE`: The game system of the input ROM as a number:
  - **1**=Game Boy/Game Gear/Master System,
  - **2**=Genesis/Mega Drive (no SMD roms),
  - **3**=NES,
  - **4**=Super Nintendo
- `INPUT_FILE`: Path to the unaltered original game ROM file to patch on.
- `OUTPUT_FILE`: Path to the patched game ROM file to save as.

### Example

```bash
GGGG "AJDV-4A4L+963B-4JAC" 2 ./rom.md ./rom-new.md
```

### Genie dialog script

The programs `GGGG`, `kdialog` and `flips` need to be in a directory that is in
the $PATH.

```bash
genie [INPUT_FILE]
```

Argument is optional. Without `INPUT_FILE` the script will ask to select a
file.

- `INPUT_FILE`: Path to the unaltered game ROM file or a directory. If this is
  a directory, then script will ask to select a file in that specified folder.

The other parameters are determined by follow up graphical dialogs. Output file
names and formats are determined automatically, based on user input and
original file name. The script will also create a little log file as well.

## Notes and working codes

I noticed lot of games and codes do not work for some systems; and none for the
Super Nintendo. Maybe I broke something. For the Game Boy only those shorter 6
letter codes worked. I'll list a few examples at this place, so you can at
least try working codes for yourself.

### Genesis / Mega Drive [Batman Returns (World)](https://gamehacking.org/game/14798/?name=&format=genie&enc=on)

Play The Demo Level!

```
GFJA-AAJW
```

### NES [Super Mario Bros. (World)](https://gamehacking.org/game/31010/?name=&format=genie&enc=on)

Fly With Button A

```
ZASLPKIO
EASLLGLA
ALSLGGEI
```

### Game Boy [Super Mario Land (World) (Rev 1)](https://gamehacking.org/game/2008/?name=&format=genie&enc=on)

Enemies fall from the sky / Some enemies are more elevated:

```
024-B4D
```

### Some codes need to be split up

I just noticed that some Game Boy codes are in 9 letter format like
`C9D-BD9-C49` for "Super Mario Land (World).gb" (notice this is NOT Rev 1) to
Disable Music. But this code does not work here as it is. Instead I use a "+"
to split them into two codes like `C9D-BD9+C49` and then it works. These are
codes I got from [GameHacking](https://gamehacking.org/), by setting the Filter
to "Device" and "Encrypted" enabled as shown in the screenshot:

![gamehackingorg_filter](gamehackingorg_filter.png)


## See also

### Tools

- [Game Genie Guy](https://www.romhacking.net/utilities/1054/) (Original tool)
- [Game Genie Good Guy](https://www.romhacking.net/utilities/1484/) / [Source](https://github.com/Mte90/Game-Genie-Good-Guy)
  (The port and updated version of original tool)
- [Flips](https://www.romhacking.net/utilities/1040/) / [Source](https://github.com/Alcaro/Flips)
  (To create or apply patch files)

### Recommended websites

- [GameHacking](https://gamehacking.org/) (I recommend filter option device
  "Game Genie" and "Encrypted" enabled)
