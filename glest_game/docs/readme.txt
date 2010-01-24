Glest Game 3.2.1 Readme

=================
CONTROLS
=================

a) Camera

f => toggle free camera mode
w => move camera up (only in free camera more)
s => move camera down (only in free camera more)
a => rotate camera left (only in free camera more)
d => rotate camera right (only in free camera more)
space => center camera on selection
up arrow or mouse on top => move camera forward
down arrow or mouse on bottom => move camera backward
left arrow or mouse on left => move camera left
right arrow or mouse on right => move camera right

b) Orders and Unit selection

left mouse button => select or deselect units
shift + left mouse button => add unit to selection
control + left mouse button => remove unit from selection
left mouse double click => select nearby units of this type
right mouse button => auto order
menu click => activate order
left mouse when order is activated => give order
right mouse when order is activated => cancel state
number => recall group
control + number => assign group

c) Network

enter => start typing/send chat message
h => toggle between 'All' and 'Team' chat modes
n => show network status

d) Hotkeys (only in game camera more)

a => activate attack command for selection 
m => activate move command for selection
s => issue stop command to selection
i => select next idle harvester
b => select next building
d => select next damaged unit
t => select next storage unit
r => select next producer unit


e) Other Keys

- + => adjust game speed  (disabled in multiplayer)
p => pause game (disabled in multiplayer)
e => save screen to TGA file

=================
CONFIGURATION
=================

Glest can be configured in three ways:
- in-game config menu: basic parameters
- configuration tool: advanced parameters
- glest.ini: all parameters

=================
NETWORK PLAY
=================

To start a network game, one of the players has to create a new game with network slots and the other players have to join.

The best place to find people to play a multiplayer game is in the Glest forums or irc channel (see "about" section).

To connect to a server you need the server's IP, the IP is shown in the lower left corner of the "new game" menu. This is the right IP for LAN play, however if you are under router and you want to play over the internet, you will need the IP of the router. Once you have connected to a server once, the game will remember it, and you can select it from the server list, in the "join game" menu.

Glest uses TCP port 61357, if you are behind a router you will have to forward this port to your computer if you want to host games.

All players have to be using the same binaries of the game and have exactly the same map, tileset and tech tree. This means that if you have mods installed in the tech tree that is being used for the game, every player has to have the same mods. An option if you want to install mods over the magitech tech tree and be able to play people that don't have them, is to copy it and install the mods over the copy.

This means that you can not play windows vs. linux games (even using wine), and that 32 bit vs. 64 bit games are only possible if the player with the 64 bit machine is using 32 bit binaries too.

You can disable binary and checksum checks in glest.ini, by setting NetworkConsistencyChecks to 0, but the game might get out of sync and crash.

=================
COMMAND LINE
=================

glest => start game normally
glest -server => start game in the new game screen with all slots open
glest -client ServerIp => start game connecting to a server

=================
VIDEO CARD HINTS
=================

Auto config.

The first time you run the game it will try to detect the graphic settings most suitable for your video card. It's highly recommended that you don't change them unless you really know what you are doing. If you change the settings and you want to reset to the recommended ones, you can do it by using the auto config button in the in-game options menu.


Required card features.

The game requires either OpenGL 1.4 or OpenGL 1.3 plus the GL_ARB_env_crossbar extesion. Most video cards with recent drivers support this features. You can bypass the feature check by replacing the "CheckGlCaps=1" line in glest.ini by "CheckGlCaps=0", but the game may crash or have graphics errors.


ATI card problems.

In some versions of the Catalyst drivers, OpenGL selection mode is implemented by software, making it incredibly slow. Glest uses selection mode to select units using the mouse (and in versions prior to 3.1.2 to place buildings too), so selecting units makes the frame rate drop quite a lot, not to the point of making the game unlayable if you have a fast computer, but it is a very noticeable glitch. To fix this you can revert the video card drivers to Catalyst 7.9 or earlier. There are some more tricky things you can to if you want to keep your current driver version, please see our boards for more information.

Also, there seems to be a bug in some ATI OpenGL drivers that makes the game crash with certain card/driver configurations when using more than 1 light. Auto config  will detect this issue and turn off all secondary lights when it detects an ATI card. If you still want to try running the game using more than 1 light you can change this setting in the in-game options menu.


Shadows.

The game features real-time shadows using different algorithms. 1) Projected: Fast shadows but they provide unit over terrain shadows only, and can produce incorrect shadows in some circumstances. 2) Shadow mapping: Slow shadows but they are always correct and provide everything over everything shadows. In ATI cards they look aliased. Both types of shadows require a video card with 3 texture unit support. Auto config will set the most suitable shadow mode for your video card.


3D textures

The game uses 3D textures for some effects like animated water. Some old video cards (ie: GeForceMX) don't support this feature by hardware and the game runs really slow when the camera is near a river.  Auto config will detect this and disable 3D textures when needed.


=================
HISTORY
=================

3.2.1
- Auto tester
- Bug fixes

3.2.0
- LUA scriting
- New tileset: Dark Forest
- Tutorials
- Improved text rendering
- Added sound effect for chat messages
- Changed loading screen
- Removed IP from new game screen
- Removed Api Info screen

3.1.2
- Fixed slow building placement in ATI cards with catalyst 7.10 or newer
- Fixed fog of war smoothing
- Improved position picking when giving orders
- Fixed some glitches in shadows
- Added red colored building cursor when trying to build in an invalid location
- Fix for empty chat messages
- Reduced Drake Rider morphing time from 120 to 80 and reduced splash radius attack of a few units
- Improved battlemachine death animation
- The game now checks that all players are using the same binaries

3.1.1
- Improved shadows
- Added command line options
- Improved 'Valley Of Death' map

3.1.0
- In-game chat
- Main menu background model changed
- Server IPs are now stored in a file, and can be used later
- Network status key
- Map changes: Added 'Swamp of Sorrow' and 'Valley of Death', removed 'One on One' and 'The Ruins'
- Balance changes

3.0.0
- Network play over LAN/Internet
- New key shortcuts for giving orders and selecting special units
- Renamed some units
- Reworked tech faction upgrades
- Balance changes
- Clicking on the minimap now always moves the camera, even if the area is not explored
- Removed some dangerous glest.ini options

2.0.1
- Scenarios
- Added more info to the results screen

2.0.0
- New Magic units: 
	- Tower of Souls: Air defense building, attacks air only
	- Golem: Defensive unit, needs EP to walk, can't attack air
	- Daemon giant: Heavy melee unit
	- Drake rider: Light ranged unit 
- New Tech units:
	- Aerodrome: Building for producing air units
	- Air ballista: Air defense building, attacks air only
	- Rider: Fast medium unit
	- Ornithopter: Light air unit
	- Airship: Heavy air unit, can't attack air
- New Magic upgrades
- New Tech upgrades
- New animations for existing units
- Shared vision between allies
- New particle blending
- Felix and Matze added to the credits
- Players now start on the location indicated in the game settings menu
- Score system
- HTML documentation
- Increased projectile accuracy
- Optimized particle rendering
- Loads of balance changes
	
1.2.2
- Fixed timing problem that was causing some units to regenerate too fast on some computers
- Html tech tree documentation

1.2.1
- Fixed random crash during load

1.2.0
- New tileset objects
- AI now expands its base
- 2 new maps: "in the forest" and "island siege"
- Improved existing maps
- Pathfinding optimizations
- Fixed issues in windowed mode
- Balance changes
- Enemy projectiles are visible when being attacked outside the sight range
- Fixed crash when trying to build a unit without be_built skill

1.1.1
- Archmage energy regeneration rate back to normal
- New windowed mode with window borders
- New error message for when maps have dimensions that are not power of 2
- New contact email

1.1.0
- Glest now compiles on MinGW
- New tileset objects
- New particle systems for all units
- Shared library merged with Duelfield
- Fixed OpenGL version detection bug (now the game detects OpenGL 2 correctly)
- Auto config option added to in-game config menu
- Added configuration option to bypass OpenGL version check
- Added object variations in tilesets
- All files renamed to lowercase to ease portability
- New map: One On One
- New 3D model format (G3D v4)
- Dead skills now have a fade parameter
- Strings in XML files restricted to lowercase (game formats names) 
- ShadowMapLike shadows renamed to Projected shadows
- Shadow mapping support, producing everything over everything shadows
- 8 bit TGA support
- Changed some particle systems
- Now if video mode change fails the game tries the same mode with the default refresh rate
- Changes on about and loading screens
- Changes on language strings
- Fixed a bug affecting the orientation of the light at night

1.0.10
- Small bug fixes

1.0.5
- Balance changes
- Computer controlled units that can't attack air won't run under dragons
- New configuration tool
- Fixed a bug with building construction emplacement
- Fixed a bug related with shadows in free camera mode
- New translation strings for main menu
- Win/Lose window
- Other bug Fixes

1.0.0
- Remaining 3D models done
- Remaining 2D art done
- New magic faction music
- New main menu art and programming
- Fonts change it's size depending on screen resolution
- Bug fixes

0.8.1
- New Sumoner Guild model
- Startup crash on some systems fixed


0.8.0
- Two factions with new units and 3D models
- Cellmaps for units, now units can enter and exit buildings
- New sounds for everything
- New 2D art for icons and buttons
- New water rendering method
- Improvements on projetile damage synchonization
- New main menu system, now a 3d model is used for background
- Particle systems redesigned to allow 3D models
- Sounds synchronized to projectiles and splashes
- New menu music
- Meeting points
- Selection improvements
- HP regeneration 
- Camera can be moved with the arrow keys
- About section changed
- Bug fixes

0.7.6
- Bug fixes

0.7.3
- Selection improvements
- Air units support
- AI improvements
- Bug fixes


0.7.2
- Fixed a bug related with unit resource info


0.7.1
- New stone texture
- 3D textures disabling option added to config menu
- ShadowVolumes removed from shadow options (can be enabled via glest.ini).
- DepthBits now defaults to 32 (up from 24), and StencilBits to 0 (down from 8)
- Fixed some bugs
- Battlemage sounds are now at 22Khz
- Performance optimizations
- OGG files can also be used as static sounds


0.7.0
- New 3D models for units
- New 3D models and textures for tilesets
- 3D model format changed to add support for player colors
- New maps
- Improvements on building command
- Experience levels
- New sounds
- New command available: morph
- 3D textures (for animated water)
- Water Effects
- Focus arrows
- New XML field: anim-speed 
- MPs (Magic Points) are now called EPs (Energy Points)
- New cell sytem: maps 2x bigger, river borders more accurate
- Minimap is now filtered
- Surface detail removed (always draw on max detail)
- Animated trees on intro screen
- Pressing 'T' saves a TGA image on the screen folder
- Improved AI
- Units react instantly when given a command
- Ranged units now attack walking units
- Camera angle changed
- Sounds are synchronized to the action (new XML tag for this)
- Command and Skill format changed, now type is the first tag
- New options for particle systems
- Unit speed changed on XMLs
- Fog of war changes smoothly
- Optimizations on pathfinding
- Optimizations on particle systems
- Crash info is now saved in crash.txt

0.6.3
- New and very fast shadow mode: Shadow Mapping Like
- Some new sounds
- Camera movement stops slowly
- Fire particles changed
- Height fog removed, depth fog added
- WGL extensions added to the api info menu
- Anisotropic filtering (option added to glest.ini)
- Map format changed from text to binary
- Buildings are randomly rotated

0.6.2
- Texture tiling changed to texture splatting

0.6.1
- Units now turn arround when changing direction
- Free camera mode optimized

0.6.0
- New building models
- Music and sounds
- New particle systems: fire ball and ice nova
- Damage and armor types
- Now it is possible to attack your own units
- Now it possible to give "follow" and "attack unit" orders (using move and attack targeting a unit)


0.5.2
- Fixed a bug in pathfinding algorithm

0.5.1
- Fixed a bug loading GL_EXT_fogcoordf

0.5.0
- Added win/lose screen
- DX8 sound
- 3d realtime menu
- Ogg sound support
- Streaming sound support
- Game speeds and pause
- Groups and add/remove to/from selection
- New 3d models for units

0.4.3
- Fixed a bug when double clicking two towers, one under construction and the other one built, caused the first one to finish its construction.
- Fixed a bug that made that fire never stopped when repairing buildings
- Performance counters added for world update timing

0.4.2
- Fixed a bug that made the game crash when right clicking outside the map and a building was selected

0.4.1
- Fixed a bug that made the game crash when canceling unit production

0.4.0
- Shadows (infinite shadow volumes)
- New graphic engine, faster model and particle rendering
- New model format, that allows to export files from 3dsmax
- Memory leaks have been removed (using _CrtDumpMemoryLeaks())
- Air units support
- TGA texture support
- Height fog (using GL_EXT_fog_coord)
- ISO Latin 1 character set support for lang files
- Screen resolution can be changed by editing glest.ini. 
- More configuration options
- Now terrain borders are alpha-blended, and look better
- Double click selects nearby units of the same type
- Model viewer and map editor have been moved to the editor pack
- New lang file format
- New glest.ini file format

0.3.1
- Opengl 1.2 and GL_ARB_multitexture support check
- G3d model viewer improvements

0.3.0
- Keyframe animation (linear interpolation)
- Particle systems (rain, snow, fire and magic projectile)
- New pathfinding algorithm (A* with g=0)
- New tile generation system (no more problems with triple intersections)
- Teams 
- Map editor
- 3d model viewer
- More sounds
- Improved fog of war using multitexture (no more problems with water colors)
- Auto orders when clicking right mouse button
- New 3d models and animations
- New sun orbit (better lighting)
- New languaje strings added
- Selection circles reflect HP and MP status 
- Progress bars
- Bug fixes

0.2.0
- Models (such as trees) have RGBA textures.
- Better lighting model now, less ambient and more difusse and specular
- Units have new skills and magics.
- Sound support (direct sound).
- Corpses now remain in the battlefield
- Unit format has totally changed, unit and buildings are the same now.
- Speed optimizations.
- glest.ini has more options.
- Units now try to mantain it's formation when receiving move commands.
- Some models have been remade (Archmage, Town Hall..)
- Buildings adapt to the terrain
- Lots of bug fixes.

0.1.6
- Unit models have been redesigned, now they have more polygons and detailed animations.   
- Minor bug fixes.

0.1.5 
0.1.4 
0.1.3 
0.1.2 
0.1.1 
0.1.0 
0.0.3 
0.0.2
0.0.1

=================
ACKs
=================

This product includes software developed by the
Apache Software Foundation (http://www.apache.org/).

This program uses Xiph.org's Vorbis software CODEC implementation.

=================
ABOUT
=================

Glest Copyright (C) 2001-2008 The Glest Team. All rights reserved.
mail: contact_game@glest.org
web: http://glest.org/
irc: irc://irc.freenode.net/glest

The Glest Team:

MARTIÑO FIGUEROA. Programmer.
Glest game, engine and tools coder. 
MS in Computer Science by the University of Coruña (Spain).
 
JOSÉ GONZÁLEZ. Sound.
Glest music composer and sound designer. Pianist. 
Currently studies Composition at the Vigo Conservatoire in Spain, in addition to Electroacoustic Music at the CCMIX in Paris.

TUCHO FERNÁNDEZ. 2D and 3D Artist.
Design, modeling, texturing, and animation of the 3D models of units, buildings and more.

JOSÉ ZANNI. 2D Artist and Web design.
Design of the logo, buttons, icons and other 2D stuff for the game. Design and implementation of the website.

MATZE BRAUN. Linux port. 
Ported Glest to SDL and OpenAL which enabled it to work under Linux and other operative systems.

FÉLIX MENéNDEZ. Artist and 3D Animator.
New animations in v2.0.

MARCOS CARUNCHO. 3D Artist.
Creator of the 3D models for buildings in versions prior to 0.7, his work helped in export plugin testing among other things.

=================
SPECIAL THANKS TO
=================

Titust Scharntke - Created the Mod megapack and helped with the Linux builds - see titusgames.de
Yggdrasil - Provided patch for building with LUA in Linux