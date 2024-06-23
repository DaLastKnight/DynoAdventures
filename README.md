# DynoAdventures
 A simple 2D platformer game for EAE

 ## About
 My first full-scale 2D platformer made in Godot! It took me 1 week to complete this. While doing this project, I struggled and faced numerous errors and challenges along the way, but I pushed through and got it done! Overall, it was a fun learning experience that makes me look forward to doing this again in the future!

 ## Objective of project
 - Create a relatively simple 2D platformer game reminiscent of popular ones e.g. Hollow Knight
 - Experience and understand the process behind gamemaking

 ## Features
 - Has a title screen with instructions on it
 - Has a dash mechanic for the player
 - Enemies can detect players from a distance and head to their position
 - Attacking enemies does a knockback effect
 
 ## Known bugs
 - When the enemy slimes detect the player, they may sometimes move midair towards the player despite having no ground (could do a is_on_floor() condition check)
 - When the player attacks the enemy slime ONLY on the right side of the slime, instead of creating a knockback effect, the enemy slime moves towards the player
 - When the player triggers multiple hits in one slash, the knockback effect accumulates and may cause the enemy slime to be clipped into the ground/hills, unable to move
 - When pressing the pressplay button, deathsound (triggers on collision with killzone/falling off the map) plays despite not dying yet and that the level had only just started

 # Credits
- Music Asset: Kevin Macloed, Cyborg Ninja
- Link: https://incompetech.com/music/royalty-free/index.html?isrc=USUAN1600008&Search=Search
- Art, SFX Assets: Brackeys, brackeys_platformer_assets
- Link: https://brackeysgames.itch.io/brackeys-platformer-bundle
- Art Assets: greenpixels, Buttons
-Link: https://greenpixels.itch.io/pixel-art-asset-3
- Art Assets: Arks, Dino Characters
- Link: https://arks.itch.io/dino-characters
- Art Assets: Kyrise, 16x16 RPG Icon Pack
- Link: https://kyrise.itch.io/kyrises-free-16x16-rpg-icon-pack
- Art Assets: Rottingpixels, Nature Platformer Tileset[16x16]
- Link: https://rottingpixels.itch.io/nature-platformer-tileset
- Art Asset: Tiny Worlds, Free Pixel Font - Thaleah
- Link: https://tinyworlds.itch.io/free-pixel-font-thaleah
- SFX Asset: Pixabay, whoosh noise
- Link: https://pixabay.com/sound-effects/whoosh-noise-45477/
- SFX Asset: floraphonic, Swing Whoosh Weapon 5
- Link: https://pixabay.com/sound-effects/swing-whoosh-weapon-5-189821/
