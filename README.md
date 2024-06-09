# DynoAdventures
 A simple 2D platformer game for EAE

 ## About
 My magnum opus of gamemaking as of now! It took me 1 week to complete this. While doing this project, I struggled and faced numerous errors and challenges along the way, but I pushed through and got it done! Overall, a fun learning experience that I look forward to doing again in the future!

 ## Objective of project
 - Create a relatively simple 2D platformer game reminiscent of popular ones e.g. Hollow Knight
 - Experience and understand the process behind gamemaking

 ## Features
 - Has a title screen with instructions on it
 - Has a dash mechanic for player
 - Enemies can detect players from a distance and head to their position
 - Attacking enemies does a knockback effect
 
 ## Known bugs
 - When enemy slime detects player, sometimes they move midair despite having no ground (could do a is_on_floor() condition check)
 - When player attacks enemy slime ONLY on the right side of the slime, instead of knockback, the enemy moves towards the player
 - When player triggers multiple hits in one slash, knockback accumulates and is clipped into the ground/hills, unable to move
 - When pressing the pressplay button, deathsound (triggers on collision with killzone) plays despite being the start of the level

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
